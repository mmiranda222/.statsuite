---
title: "Chart generation business rules"
subtitle: 
comments: false
weight: 3200
---

The attached Excel sheet explains how the data structure needs to be transformed from its original input structure to the structure that corresponds to each type of chart. 
The sheet also explains all possible user choices for the chart layout (definition on how the dimensions or dimension items go to the different chart axes, highlightable items) for each type of chart according to the OECD chart graphique.  
The sheet is organised in 3 vertical parts (with blue coloured headers). For each type of chart (yellow coloured headers):   
    - The first part shows the data structure (example) as retrieved as original input to the chart generator;
    - The second part explains all of the possible user choices (see blue coloured text) for the chart layout, the definition on how the chosen dimensions or dimension items go to the differtent chart axes (see green coloured text), and the highlightable items for each type of chart according to the OECD chart graphique;  
    - The third part shows the transformed data structure that corresponds to each type of chart, including concatenated labels.
All information is provided through concrete (hopefully generic enough) examples.   

It is assumed that ALL data provided to the chart generator is to be plotted at once in the chart (except for the bubble flow map where all data per each counterpart dimension value is plotted). Data filtering is only done using the visualisation page filters.   

See: [ChartGenerationBusinessRules.xlsx](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/ChartGenerationBusinessRules.xlsx)
