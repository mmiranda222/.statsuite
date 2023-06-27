---
title: "Future or programmatically configurable advanced search features"
subtitle: 
comments: false
weight: 89
keywords: [
  'Scoring method', '#scoring-method',
  'Eventual boosting enhancements', '#eventual-boosting-enhancements',
  'Solr filters', '#solr-filters',
  'Stemming', '#stemming',
  'Lemmatisation', '#lemmatisation',
  'Synonyms', '#synonyms',
  'Autocompletion (potential future .Stat development)', '#autocompletion-potential-future-stat-development',
  'Highlighting', '#highlighting',
  'Federated Search', '#federated-search',
  'Faceting, Tag and Exclusion', '#faceting-tag-and-exclusion',
]
---

#### Table of Content
- [Scoring method](#scoring-method)
  - [Eventual boosting enhancements](#eventual-boosting-enhancements)
- [Solr filters](#solr-filters)
  - [Stemming](#stemming)
  - [Lemmatisation](#lemmatisation)
  - [Synonyms](#synonyms)
- [Autocompletion (potential future .Stat development)](#autocompletion-potential-future-stat-development)
- [Highlighting](#highlighting)
- [Federated Search](#federated-search)
- [Faceting, Tag and Exclusion](#faceting-tag-and-exclusion)


---

### Scoring method
Search relevance and search results scoring is a complex matter.  
Modern information retrieval (IR) systems rely on various factors to score a document when matching a user query:
- term frequency of the term matched in the search result field
- document frequency of the term matched in the corpus field
- search result field length
- corpus avg field length
- boosts

Starting from Solr 6, Lucene implements by default the [probabilistic IR model Okapi BM25](https://en.wikipedia.org/wiki/Okapi_BM25), a scoring function that make use of the features forementioned.  

For more information on Lucene/Solr scoring:  
https://opensourceconnections.com/blog/2015/10/16/bm25-the-next-generation-of-lucene-relevation/  
https://lucene.apache.org/core/8_2_0/core/org/apache/lucene/search/package-summary.html#scoringBasics

Specific document fields (in our case dataflow properties) can be boosted in the scoring algorithm. For more information, see: [Relevance of free-text search results: How to tweak the weights of specific dataflow properties](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/search-config/#relevance-of-free-text-search-results-how-to-tweak-the-weights-of-specific-dataflow-properties)

Specific documents (in our case dataflows) can be boosted in the scoring algorithm. For more information, see: [Relevance of free-text search results: How to boost specific dataflows](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/search-results/#result-boosting)

---

#### Eventual boosting enhancements
Apart from the boost queries currently in use, moving to edismax query parsing would give additional possibilities in terms of:

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

---

### Solr filters

#### Stemming
Added in [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023).  

The wildcard matching was removed and replaced by stemmers that SOLR uses by default for all fields of type `text_{lang}`.

The default .Stat SOLR schema is generated by the installation script ([src/server/manageSchema](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/develop/README.md#script)). It defines the fields using the SOLR API. 

In order to customise stemming filters, modify the installation script accordingly. Remember that stemmers need to be defined per language. For more information, consult the SOLR documentation.  
The SOLR stemmers filters used by default in SFS are:
- Arabic: solr.ArabicStemFilterFactory
- German: solr.GermanLightStemFilterFactory
- English: solr.PorterStemFilterFactory
- Spanish: solr.LightStemFilterFactory
- French: solr.FrenchLightStemFilterFactory
- Italian: solr.ItalianLightStemFilterFactory
- Kmer: -
- Dutch: solr.SnowballPorterFilterFactory
- Thai: -


#### Lemmatisation
Lemmatisation is another technique similar to Stemming. But unlike stemming, lemmatisation attempts to select the correct lemma depending on the context.

Some lemmatiser are already included in the `text_{lang}` field type provided by Solr.

In order to customise lemmatisation filters, modify the installation script ([src/server/manageSchema](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/develop/README.md#script)), which calls the SOLR API, accordingly. Remember that lemmatisation need to be defined per language. For more information, consult the SOLR documentation.

#### Synonyms
Added in [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023). 

Synonyms can now be provided in .Stat through configuration files. For more information, see [Manage synonyms](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/search-config/#manage-synonyms). Synonyms are applied on the search query terms, e.g. a `the mages of the United Kingdom` query would be expanded to: `the (mages OR sorcerer OR sorceress) of the (United Kingdon OR Great Britain OR England)`. Synonyms are automatically ASCII-folded by the script (see below).

If you want to develop your own custom approach for pushing synonyms to SOLR, e.g., directly from a database, then modify the installation script ([src/server/manageSchema](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/develop/README.md#script)), which calls the SOLR API, accordingly. Remember that synonyms need to be defined per language.  

For more information, consult the SOLR documentation, e.g., https://solr.apache.org/guide/8_7/managed-resources.html#managing-synonyms. Note also that different scoring approaches can be applied to the synonym terms depending on their occurence. 

#### Other filters
The SOLR filters used in SFS by default are the following:
```xml
  <fieldType name="sfs_text_ar" class="solr.TextField" positionIncrementGap="100">
    <analyzer>
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="ar"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.ArabicNormalizationFilterFactory"/>
      <filter class="solr.ArabicStemFilterFactory"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_de" class="solr.TextField" positionIncrementGap="100">
    <analyzer>
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="de"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.GermanNormalizationFilterFactory"/>
      <filter class="solr.GermanLightStemFilterFactory"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_en" class="solr.TextField" positionIncrementGap="100">
    <analyzer type="index">
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.EnglishPossessiveFilterFactory"/>
      <filter class="solr.KeywordMarkerFilterFactory" protected="protwords.txt"/>
      <filter class="solr.PorterStemFilterFactory"/>
    </analyzer>
    <analyzer type="query">
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="en"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.EnglishPossessiveFilterFactory"/>
      <filter class="solr.KeywordMarkerFilterFactory" protected="protwords.txt"/>
      <filter class="solr.PorterStemFilterFactory"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_es" class="solr.TextField" positionIncrementGap="100">
    <analyzer>
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="es"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.SpanishLightStemFilterFactory"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_fr" class="solr.TextField" positionIncrementGap="100">
    <analyzer>
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="fr"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.ElisionFilterFactory" articles="lang/contractions_fr.txt" ignoreCase="true"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.FrenchLightStemFilterFactory"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_it" class="solr.TextField" positionIncrementGap="100">
    <analyzer>
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="it"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.ElisionFilterFactory" articles="lang/contractions_it.txt" ignoreCase="true"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.ItalianLightStemFilterFactory"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_km" class="solr.TextField" positionIncrementGap="100" multiValued="true">
    <analyzer type="index">
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
    </analyzer>
    <analyzer type="query">
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="km"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_nl" class="solr.TextField" positionIncrementGap="100">
    <analyzer>
      <tokenizer class="solr.StandardTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="nl"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
      <filter class="solr.StemmerOverrideFilterFactory" dictionary="lang/stemdict_nl.txt" ignoreCase="false"/>
      <filter class="solr.SnowballPorterFilterFactory" language="Dutch"/>
    </analyzer>
  </fieldType>
  <fieldType name="sfs_text_th" class="solr.TextField" positionIncrementGap="100">
    <analyzer>
      <tokenizer class="solr.ThaiTokenizerFactory"/>
      <filter class="solr.ASCIIFoldingFilterFactory"/>
      <filter class="solr.ManagedSynonymGraphFilterFactory" managed="th"/>
      <filter class="solr.FlattenGraphFilterFactory"/>
      <filter class="solr.LowerCaseFilterFactory"/>
    </analyzer>
  </fieldType>
```
Note: If the analyzer has no type, then it is applied to both index & query. The analyzer is not related to what is stored in the collection but how this collection is indexed, as indexes are stored aside from the collection. Therefore, applying ascii folding while indexing doesn't prevent us from having results with accents.  

If you want to define your own custom settings for SOLR analyzers and filters, then modify the installation script ([src/server/manageSchema](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/develop/README.md#script)), which calls the SOLR API, accordingly.
For more information, consult the SOLR documentation, e.g., https://solr.apache.org/guide/7_2/analyzers.html.

---

### Autocompletion (potential future .Stat development)
Solr itself supports suggestions coming from both the index (to be sure that the suggestions will get results or an external file: https://lucene.apache.org/solr/guide/6_6/suggester.html#dictionary-implementations  

When this feature is implemented in .Stat (SFS and DE), and it is decided where the suggestions are coming from, it is necessary to define the proper SOLR configuration in the solrconfig.xml, starting from defining the suggester component:

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

**Recommendation**: Decide the lookup algorithm depending on requirements. As a rule of thumb, opt for the **AnalyzingInfixLookupFactory** in case of entire field content suggestion or **FreeTextLookupFactory** of terms suggestion.  
When all the required parameters are defined (https://lucene.apache.org/solr/guide/6_6/suggester.html#suggester-search-component-parameters), a request handler using the SOLR API is to be implemented:  

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

---

### Highlighting
Currently highlighting is included in the .Stat Suite. It uses the default SOLR method.
For more information see: https://lucene.apache.org/solr/guide/6_6/highlighting.html#Highlighting-TheOriginalHighlighter  

To customsie the snippet size, adapt the following values in the `solrconfig.xml` file or just set as request parameters:

- hl.snippets (default:1): Specifies maximum number of highlighted snippets to generate per field. It is possible for any number of snippets from zero to this value to be generated.
- hl.fragsize	(default:100): Specifies the approximate size, in characters, of fragments to consider for highlighting. 0 indicates that no fragmenting should be considered and the whole field value should be used.  

**Example**  
```xml
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
Also see http://wiki.apache.org/solr/HighlightingParameters.

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
While the tag and exclusion approach for multi-selected facets was previously implemented, it was replaced by a drill-down facet approach. More information:  

https://lucene.apache.org/solr/guide/7_5/faceting.html#tagging-and-excluding-filters
