---
title: "SolR optimisation"
subtitle: 
comments: false
weight: 89
keywords: [
  'IR Ranking Functions Introduction - Default Scoring', '#ir-ranking-functions-introduction---default-scoring',
  'Customise Scoring Function', '#customise-scoring-function',
  'Basic Boosting (Already in place)', '#basic-boosting-already-in-place',
  'Advanced Boosting', '#advanced-boosting',
  'Constant Score Queries', '#constant-score-queries',
  'Partial Search', '#partial-search',
  'Stemming', '#stemming',
  'Lemmatisation', '#lemmatisation',
  'Synonyms Search', '#synonyms-search',
  'Synonyms Provision', '#synonyms-provision',
  'Solr Schema Configuration', '#solr-schema-configuration',
  'Query Time - phrase query disable', '#query-time-phrase-query-disable',
  'Autocompletion Service (potential future development)', '#autocompletion-service-potential-future-development',
  'Autocompletion Suggestions Provision', '#autocompletion-suggestions-provision',
  'Solrconfig.xml Configuration', '#solrconfig-xml-configuration',
  '.Stat Search-API Extension', '#stat-search-api-extension',
  'Highlighting', '#highlighting',
  'Federated Search', '#federated-search',
  'Faceting, Tag and Exclusion', '#faceting-tag-and-exclusion',
]
---

#### Table of Content
- [IR Ranking Functions Introduction - Default Scoring](#ir-ranking-functions-introduction---default-scoring)
- [Customise Scoring Function](#customise-scoring-function)
  - [Basic Boosting (Already in place)](#basic-boosting-already-in-place)
  - [Advanced Boosting](#advanced-boosting)
  - [Constant Score Queries](#constant-score-queries)
- [Partial Search](#partial-search)
  - [Stemming](#stemming)
  - [Lemmatisation](#lemmatisation)
- [Synonyms Search](#synonyms-search)
  - [Synonyms Provision](#synonyms-provision)
  - [Solr Schema Configuration](#solr-schema-configuration)
  - [Query Time - phrase query disable](#query-time-phrase-query-disable)
- [Autocompletion Service (potential future development)](#autocompletion-service-potential-future-development)
  - [Autocompletion Suggestions Provision](#autocompletion-suggestions-provision)
  - [Solrconfig.xml Configuration](#solrconfig-xml-configuration)
  - [.Stat Search-API Extension](#stat-search-api-extension)
- [Highlighting](#highlighting)
- [Federated Search](#federated-search)
- [Faceting, Tag and Exclusion](#faceting-tag-and-exclusion)

This page describes the SOLR search engine optimisation possibilities to fine-tune the **free-text search** behaviour.

---

### IR Ranking Functions Introduction - Default Scoring
Search relevance and search results scoring is a complex matter.  
Modern IR systems relies on various factors to score a document when matching a user query:
- term frequency of the term matched in the search result field
- document frequency of the term matched in the corpus field
- search result field length
- corpus avg field length
- boosts

Starting from Solr 6, Lucene implements by default the [BM25 similarity](https://en.wikipedia.org/wiki/Okapi_BM25), a scoring function that make use of the features forementioned.  

When a search result matches the query, each term occurrence is scored and then combined to build the score of the search result.  

The score will then affect the ranking of the results (higher the score, higher the rank).

Even if Apache Lucene/Solr implements what is called an “probabilistic information retrieval ranking model” the score produced for the search results are not probabilities in the strict sense of the mathematical definition, so don't expect scores to be 0<x>1.  

For more information on Lucene/Solr scoring:  
https://opensourceconnections.com/blog/2015/10/16/bm25-the-next-generation-of-lucene-relevation/  
https://lucene.apache.org/core/8_2_0/core/org/apache/lucene/search/package-summary.html#scoringBasics

---

### Customise Scoring Function
There is a whole world of ways to customise the Solr scoring function.  
Books have been written on this topic, so describing all the ways to tune relevance in Solr is out of scope here.  
We’ll describe what is currently available in your search solution, and some possible improvement there.  

#### Basic Boosting (Already in place)
It is currently possible to give an additional boost to specific fields, explicitly:  

```
name: { // field name, we must get the same in POST /admin/dataflows body
      type: ATTR_TYPE, // ????
      ext: TEXTFIELD_EXT, // solr dynamic field extension
      …
      weight: 2, // field will be boosted by 2
    },
```

This is translated into the following Solr syntax:  
field:(query)^weight.

This syntax build a Lucene Boost Query (https://lucene.apache.org/core/8_2_0/core/org/apache/lucene/search/BoostQuery.html).  
This means that the score clause calculated for that part of your query, will be multiplied by the boost(2 in this scenario).  
This gives you the chance of assigning manually an additional weight to certain fields.  

**N.B.** this weight is manual, so when assigning the weight it must be extremely clear how internal score works.  
Assigning the weight is also a difficult and iterative task, that is the reason why Information Retrieval moved to automatically generated weights and ranking models (AKA Learning To Rank):  
https://sease.io/2016/07/apache-solr-learning-to-rank-part-1-data-collection.html

#### Advanced Boosting
Apart from the boost queries currently in use, moving to edismax query parsing gives additional possibility in terms of:

1) **boosting fields** (so the weight passed as a parameter will end up as a qf Solr parameter)  
   e.g.  
   qf=field1^2 field2^5 … fieldn^m  
   This boosting is equivalent to the one currently in place.  
   It gives you the possibility of a multiplicative factor (the weight) to the score calculated by Solr for the query match in a field.  
   e.g.  
   **Query** = term1 term2  
   **qf**=field1^2 field2^5  
   Doc1 = {field1:term1, field2:term1}   
   Score(field1) = score(term1) * 2  
   Score(field2) = score(term1) * 5  

2) **boosting phrase matches**, so documents containing phrase matches of the user query will be boosted in accordance with the factor specified  
   e.g.  
   pf=field1^2 field2^5 … fieldn^m  
   https://lucene.apache.org/solr/guide/6_6/the-dismax-query-parser.html#TheDisMaxQueryParser-Thepf_PhraseFields_Parameter  
   So search results that contain the query terms as an exact phrase (all the terms and in the exact sequential order) will get an additional score boost.  
   e.g.  
   **Query** = term1 term2 term3  
   **pf**=field1^2  
   Doc1 = {field1:(term3 term1 term2}   
   Doc2 = {field1:(bla bla **term1 term2 term3** bla bla}  
   Score(Doc1) = score(doc1) +  
   **Score(Doc2)** = score(doc2) + **PhraseScore(doc2)\*2**  

3) **boosting NGrams**, so documents containing combination of the original query terms will be boosted in accordance with the factor specified  
   e.g.  
   **pf2**=field1^2 field2^5 … fieldn^m  
   https://lucene.apache.org/solr/guide/6_6/the-extended-dismax-query-parser.html#TheExtendedDisMaxQueryParser-Thepf2Parameter  
   So search results that contain the pair of terms as an exact phrase (two terms and in the exact sequential order) will get an additional score boost.  
   e.g.  
   **Query** = term1 term2 term3  
   **pf2**=field1^5  
   Doc1 = {field1:(term3 **term1 term2**}  
   Doc2 = {field1:(bla bla **term1 term2** term3 bla bla}  
   **Score(Doc1)** = score(doc1) + **PairScore(doc1)\*5**  
   **Score(Doc2)** = score(doc2) + **PairScore(doc2)\*5**  

4) **boosting base on functions**, this applies to your ORDER boost use case, once you have the value at indexing time you could boost documents based on the ORDER value they have.  
   To do that at query time, with the edismax would be:  
   e.g.  
   **Query** = term1 term2 term3  
   **boost=order_i**  
   Doc1 = {field1:(term3 term1 term2), **order_i:50**}  
   Doc2 = {field1:(bla bla term1 term2 term3 bla bla), **order_i:35**}  
   **Score(Doc1)** = score(doc1) * **50**  
   **Score(Doc2)** = score(doc2) * **35**  
   
   **N.B.** there many other advanced functions to use in boosting, first of all you can decide if additive or multiplicative:  
   https://lucene.apache.org/solr/guide/6_6/function-queries.html  

#### Constant Score Queries
If case of interest in constant score queries i.e. you get a constant score for a clause matching, independently of the document/corpus terms distributions.  
This is possible in Solr through the Constant Score query concept, the score of each clause is explicitly passed with the syntax:  
^=  
e.g.  
(id:(query) OR name:(query))^=16 OR  
(categoryId:(query) OR categoryName:(query))^=8 OR  
(description:(query))^=4 OR  
(dimensionId:(query) OR dimensionName:(query))^=2 OR  
(dimensionValue:(query))^=1  

This means that a document matching all the clauses will have a simple score of 1+2+4+8+16.  
The simple formula translates in:  
1*(match)+2*(match)+4*(match)+8*(match)+16*(match)  

To offer this functionality in the current platform it is necessary to:

1. **Configuration** - Add a configuration capability in the schema , this will grant the users the capability specify the constant score for fields match:  

```json
name: {
      type: ATTR_TYPE,
      ext: TEXTFIELD_EXT,
      …
      constantWeight: 2, // score calculated for this clause if a match happens for this field, is constantly 2
    },
```

2.	**Query Building** - src/server/search/index.js:19, the config parameter is passed to the query building component and  a constant score query is built here  

**N.B.** it is unlikely that constant scoring solves complex relevance problems, but having the possibility of using it, can give great flexibility to the adopters of the framework  

---

### Partial Search
Currently each search term is hard-coded prefixed and suffixed by a *  
e.g.  
\<field1\>:\*one\*  

This wildcard search is extremely expensive and not very common in the free text Lucene search world and represents a temporary solution for stemming, lemmatisation, etc.

Following are listed alternativatives better performing alternatives. 

#### Stemming
Stemming is a functionality used in search to improve the recall of your system.  
It means you want to cover MORE search results given a query.  
It relies on a text analysis technique that brings the terms to their stem:  
e.g.  
jumping -> jump  
dinosaurs -> dinosaur  
dragons -> dragon  

In this way your search for “dragon” or “dragons” will return the same results.  
This is recommended when in your use case you don’t really care about this variation in the term and for you, they have the same semantic.  
In Solr it is vastly implemented through language specific text analysis, even in the default Solr schema you will find language specific text analysis with stemming configured:  

**English**  

```xml
    <fieldType name="text_en" class="solr.TextField" positionIncrementGap="100">
      <analyzer type="index">
        <tokenizer class="solr.StandardTokenizerFactory"/>
       …
        …
  <!-- Optionally you may want to use this less aggressive stemmer instead of PorterStemFilterFactory:
        <filter class="solr.EnglishMinimalStemFilterFactory"/>
  -->
        <filter class="solr.PorterStemFilterFactory"/>
      </analyzer>
      <analyzer type=“query”>…
      </analyzer>
    </fieldType>
```

**Italian**

```xml
    <fieldType name="text_it" class="solr.TextField" positionIncrementGap="100">
      <analyzer> 
        <tokenizer class="solr.StandardTokenizerFactory"/>
        …
        <filter class="solr.ItalianLightStemFilterFactory"/>
        <!-- more aggressive: <filter class="solr.SnowballPorterFilterFactory" language="Italian"/> -->
      </analyzer>
    </fieldType>
```

This field types are already defined in the schema used by .Stat.  

e.g.  
\<dynamicField name="*_txt_it" type="text_it"  indexed="true"  stored=“true”/\>  

Currently only  
**\<dynamicField name="*_t" type="text_general" indexed="true" stored="true"/\>**  
Is used, with a generic text analysis per language.  

This means it’s possible to use them with a change in the .stat configurations:  

where we have:  
   schema: [  
  {  
    name: 'name',   
    field: lang => `name_${lang}_txt`,  
  },  

Should become:  
schema: [  
  {  
    name: 'name',  
    field: lang => `name_txt_${lang}`,  
  },  

So it is necessary to make sure that .stat suite is able to support that Solr field extension (**\*\_txt\_\<language\>**)  
 (currently it only supports the :  
export const **TEXTFIELD_EXT** = 't';  
export const ***STRING_EXT*** = 's';  
export const ***STRING_LIST_EXT*** = ‘ss';  

#### Lemmatisation
Lemmatisation is another technique similar to Stemming, to improve the recall of your system.   
It means you want to cover MORE search results given a query.  
It relies on a text analysis technique that brings the terms to their stem:  
e.g.  
better -> good  
meeting -> meet  
dragons -> dragon  

In this way your search for “dragon” or “dragons” will return the same results.  
This is recommended when in your use case you don’t really care about this variation in the term and for you, they have the same semantic.  
Unlike stemming, lemmatisation attempts to select the correct lemma depending on the context.  
You find more details here:  
https://en.wikipedia.org/wiki/Lemmatisation  
https://lucene.apache.org/solr/guide/7_3/language-analysis.html#opennlp-lemmatizer-filter  
Some lemmatiser are already included in the per language txt field type provided by Solr in the default schemas.  
More advanced lemmatisation can be found in Solr 7.x.  
The exact same suggestion for the stemmers applies here.  

---

### Synonyms Search
Synonyms search is a complex matter and it is a functionality offered by Solr out of the box, with full support in Solr versions >=6.6.  
Just bear in mind that some particular class of synonyms may require particular care i.e. multi-term synonyms (https://lucidworks.com/post/multi-word-synonyms-solr-adds-query-time-support/).  
The approach to implement synonyms search (e.g. in the .Stat Suite Data Explorer search) is as follow:  

#### Synonyms Provision
Where should Solr fetch the synonyms from? Currently Solr provide 2 flexible approaches:  

1) **synonyms.txt**, the synonyms are detailed in a txt file, one synonym per line as (1) a comma-separated list of words or as (2) two comma-separated lists of words with the symbol "=>" between them, and provided to Solr. They can be entered manually or a middleware application may extract them from a database and then populate the file  
https://solr.apache.org/guide/8_7/filter-descriptions.html#synonym-graph-filter  

2) **Managed Resources**,  synonyms can be provided to Solr to handy REST endpoints, this gives the possibility of developing your own custom approach in the way you push the synonyms to Solr, it may be a UI, an application that extract them from a DB of whatever necessary  
https://solr.apache.org/guide/8_7/managed-resources.html#managing-synonyms  
The second approach is normally suggested when complex synonyms provision system are considered.

#### Solr Schema Configuration
Once we have defined the various groups of synonyms ( they may be depending on the language or field types), the Solr schema will be modified accordingly, specifying the Synonym graph filter to be part to analysis chain:  
e.g.  

```xml
    <fieldType name="text_en" class="solr.TextField" positionIncrementGap="100">
      <analyzer type="index">
        <tokenizer class="solr.StandardTokenizerFactory"/>
        <filter class="solr.SynonymGraphFilterFactory" synonyms="mysynonyms.txt"/>
        <filter class="solr.FlattenGraphFilterFactory"/> <!-- required on index analyzers after graph filters -->
      </analyzer>
      <analyzer type="query">
        <tokenizer class="solr.StandardTokenizerFactory"/>
        <filter class="solr.SynonymGraphFilterFactory" synonyms="mysynonyms.txt" ignoreCase="true" expand="true"/>
        …
        …    
      </analyzer>
    </fieldType>
```

**N.B.** depending on the synonyms provision choice you made, you may want in the analysis chain to appear the mysynonyms.txt file or the solr.ManagedSynonymFilterFactory  
A query time semantic expansion of your query means that the original terms of your query are expanded with synonyms.  
e.g.  
Assuming the set of synonyms:    
mage, sorcerer, sorceress  
United Kingdom, Great Britain, England  

\<the mages of the United Kingdom\> query  
Will be expanded in:  
the (mages OR sorcerer OR sorceress) of the (United Kingdon OR Great Britain OR England)  

Effectively bringing an expansion to the semantic of the query.  

Semantic Expansion Query Time - Synonyms Query Style
- **as_same_term**: Default. Treats all terms as if they're exactly equivalent.  -->  The IDF component will be identical among all results, the TF will drive the score, so (field length + terms matches)    
- **pick_best**: The rarest synonym will be considered more important.  -->  Only the rarest synonym match drives the score  
- **as_distinct_terms**: All synonyms matches will contribute, with their IDF and TF  -->  All synonyms matches participate to the score  

```xml
    <fieldType name="text_general" scoreOverlaps="pick_best" class="solr.TextField" positionIncrementGap="100" multiValued="true">  
```
    
https://issues.apache.org/jira/browse/SOLR-11662  
Note:  
IDF stands for Inverse Document Frequency.  
TF stands for Term Frequency.  

For more information about how scoring works in Lucene/Solr, page 10-11 has all the details.  

#### Query Time - phrase query disable
Out of the box Solr is going to expand synonyms in phrase queries as well.  
This doesn’t seem an acceptable behaviour for a requirements that synonyms expansion should not happen for phrase queries.
This implies:  

1) definition of two fields from the original one: one with synonyms and one without  
2) implement the logic that will trigger the query building to one field or the other in src/server/dataflow.js:6  

In this way for phrase queries you hit the field with no synonyms expansion.   

---

### Autocompletion Service (potential future development)
The autocomplete solutions can be heavily customised. However, the following design will be for a basic autocompletion service, but much can be done in addition to that:

#### Autocompletion Suggestions Provision
Solr out of the box supports suggestions coming from both the index (so you are sure the suggestions will get results when clicking them) or an external file: https://lucene.apache.org/solr/guide/6_6/suggester.html#dictionary-implementations  

#### Solrconfig.xml Configuration
When you have decided where the suggestions are coming from it is necessary to define the proper Solr configuration in the solrconfig.xml, starting from defining the suggester component:

```xml
<searchComponent name="suggest" class="solr.SuggestComponent">
  <lst name="suggester">
    <str name="name">mySuggester</str>
    <str name="lookupImpl">FuzzyLookupFactory</str>
    <str name="dictionaryImpl">DocumentDictionaryFactory</str>
    <str name="field">cat</str>
    <str name="weightField">price</str>
    <str name="suggestAnalyzerFieldType">string</str>
    <str name="buildOnStartup">false</str>
  </lst>
</searchComponent>
```

For a detailed explanation of each config param:  
https://lucene.apache.org/solr/guide/6_6/suggester.html#adding-the-suggest-search-component  

The lookup algorithm is extremely important, it defines how you build suggestions candidates and how you match the query with the suggestions.  This is an overview of the choices in terms of lookup algorithm:  
https://sease.io/2015/07/solr-you-complete-me.html  
https://sease.io/2018/06/apache-lucene-blendedinfixsuggester-how-it-works-bugs-and-improvements.html  

**Recommendation**: you should decide your lookup algorithm depending on your requirements, as a rule of thumb, you should opt for the **AnalyzingInfixLookupFactory** in case of entire field content suggestion or **FreeTextLookupFactory** of terms suggestion.  
Once you have defined all the parameters you need (https://lucene.apache.org/solr/guide/6_6/suggester.html#suggester-search-component-parameters), a request handler must be defined: this will be the REST endpoint exposed by Solr:  

```xml
<requestHandler name="/suggest" class="solr.SearchHandler" startup="lazy">  
  <lst name="defaults">  
    <str name="suggest">true</str>  
    <str name="suggest.count">10</str>  
  </lst>  
  <arr name="components">  
    <str>suggest</str>   
  </arr>  
</requestHandler>  
```

https://lucene.apache.org/solr/guide/8_1/suggester.html#adding-the-suggest-request-handler  

#### .Stat Search-API Extension
Once the Solr side is operational it is required to implement the client side.   
This will require:  
1) modelling of the autocomplete response from a .Stat perspective  
2) add the call to the configured Solr request handler in src/server/solr/index.js:87 
3) parse the Solr response and build the .Stat response  

---

### Highlighting
Currently highlighting is included in the .stat solution and specifically it uses the default method:  

hl.method: The highlighting implementation to use. Acceptable values are: unified, original, fastVector, and postings. See the Choosing a Highlighter section below for more details on the differences between the available highlighters.  

On a set of fields configured:  

```
{
  ...
  fields: {
    id: { …
    },
    name: {     type: ATTR_TYPE,
      …
      highlight: true, // will be highlighted
      …
    },
}
```

You find here details about this implementation:  
https://lucene.apache.org/solr/guide/6_6/highlighting.html#Highlighting-TheOriginalHighlighter  

And specifically to change the snippet size (solrconfig.xml):

hl.snippets (default:1): Specifies maximum number of highlighted snippets to generate per field. It is possible for any number of snippets from zero to this value to be generated.

hl.fragsize	(default:100): Specifies the approximate size, in characters, of fragments to consider for highlighting. 0 indicates that no fragmenting should be considered and the whole field value should be used.  

These params can be just sent as request parameters or specified in the solrconfig.xml  

```xml
  <!-- Highlighting Component

       http://wiki.apache.org/solr/HighlightingParameters
  -->
  <searchComponent class="solr.HighlightComponent" name="highlight">
    <highlighting>
      <!-- Configure the standard fragmenter -->
      <!-- This could most likely be commented out in the "default" case -->
      <fragmenter name="gap"
                  default="true"
                  class="solr.highlight.GapFragmenter">
        <lst name="defaults">
          <int name="hl.fragsize">100</int>
        </lst>
      </fragmenter>
```

---

### Federated Search
Solr offers the capability of federating search across collections.  
A collection in Solr is a logical domain separation: it contains documents that share the same structure and semantic (https://lucene.apache.org/solr/guide/6_6/collections-api.html)  
A collection may contains data coming from a different datasource (a CMS for example).  
Collection may have completely different data models, or share part of the data model.   
In case collections are compatible from a data model perspective, it is possible to federate search across collections, following this syntax:  

http://localhost:8983/solr/collection1/select?q=*:*&collection=collection1,collection2&shards.qt=localSelect  

For more information on distributed search and all its related caveats, please have a read to our blog post:  
https://sease.io/2017/11/distributed-search-tips-for-apache-solr.html   

---

### Faceting, Tag and Exclusion
While the tag and exclusion approach for multi selected facets was previously implemented, it was replaced by a drill-down facet approach. More information:  

https://lucene.apache.org/solr/guide/7_5/faceting.html#tagging-and-excluding-filters
