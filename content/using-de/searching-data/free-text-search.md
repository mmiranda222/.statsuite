---
title: "Free text search"
subtitle: 
comments: false
weight: 1700
keywords: [
  'Where search is performed', '#where-search-is-performed',
  'How to search', '#how-to-search',
  'Exact single match word or multiword', '#exact-single-match-word-or-multiword',
  'Exact phrase', '#exact-phrase',
  'Partial match of a word', '#partial-match-of-a-word',
  'How free text search hits are displayed', '#how-free-text-search-hits-are-displayed',
  'Free text search reset', '#free-text-search-reset',
]

---

#### Table of Content
- [Where search is performed](#where-search-is-performed)
- [How to search](#how-to-search)
  - [Exact single match word or multiword](#exact-single-match-word-or-multiword)
  - [Exact phrase](#exact-phrase)
  - [Partial match of a word](#partial-match-of-a-word)
- [How free text search hits are displayed](#how-free-text-search-hits-are-displayed)
- [Free text search reset](#free-text-search-reset)

![DE Free text search](/dotstatsuite-documentation/images/de-free-text-search.png)

---

### Where search is performed
The free text search of the Data Explorer looks for a specific language in the following pieces of information:
* ID and localised name of the dataflow
* IDs and localised names of the dimensions (concepts)
* Localised description of the dataflow
* ID and localised name of the categories (and their parent categories) in which the dataflow is categorised
* IDs and localised names of the codes used as dimension values
* Agency ID of the dataflow
* Version number of the dataflow

The relevance score depends on where the search term was found, which can be customised as documented [here](/dotstatsuite-documentation/configurations/search-config/#relevance-of-free-text-search-results-how-to-tweak-the-weights-of-specific-dataflow-properties).

---

### How to search
#### Exact single match word or multiword
Return all dataflows that have the exact match single word of one of the search words in the indexed information. The usage of search hints like `AND`, `+` and `-` are not required but allowed. The terms `euro AND dollar AND "exchange rate"` and `euro dollar "exchange rate"` are syntactically the same and bring the same results.

#### Exact phrase
Return all dataflows that have the exact match phrase in the indexed information. Exact phrases are entered by using quotes, e.g. `"exchange rate"`.

#### Partial match of a word
Apply the same rules as for exact single match word or multiword for partial matching of words, e.g. `key` is found in `keys` and `keywords`.  
It is not used for exact phrases.  
See reference [here](https://www.elastic.co/guide/en/elasticsearch/guide/current/partial-matching.html).

---

### How free text search hits are displayed
For each search result (dataflow), search hits found are displayed **highlighted within its context**, meaning that according text before and after the found text is also to be displayed.

#### Found in ID and localised name of a dataflow
![de search hits](/dotstatsuite-documentation/images/de-search-hits-1.png)

#### Found in ID and localised name of the categories (and their parent categories) in which the dataflow is categorised
![de search hits](/dotstatsuite-documentation/images/de-search-hits-2.png)

#### Found in the localised description of the dataflow
![de search hits](/dotstatsuite-documentation/images/de-search-hits-3.png)

#### Found in IDs and localised names of the concepts used as dimensions, as well as the dimension IDs
![de search hits](/dotstatsuite-documentation/images/de-search-hits-4.png)

#### Found in IDs and localised names of the codes used as dimension values
![de search hits](/dotstatsuite-documentation/images/de-search-hits-5.png)

---

### Free text search reset
*Since [October 5, 2021 Release .Stat Suite JS 10.0.0](/dotstatsuite-documentation/changelog/#october-5-2021)*, performing a free text search from the search result page **after** a filter selection will reset the entire search request.

Example:
* From the DE homepage, I browse by topic 'Health'
* It displays the related search results
* From the search results page, I free text search for 'Industry'
* The previous 'Health' selected facet is reset, and it displays the results according to the 'Industry' text search only.
