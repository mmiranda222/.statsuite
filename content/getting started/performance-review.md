---
title: "Performance tests"
subtitle: 
comments: false
weight: 35

---
**Performance review (2.0)**  
The goal of this review is to present the results of the stress tests performance of the dotstat-suite-transfer and dotstat-suite-nsi web services. 

With the aim to produce realistic results, the stress tests were done in an isolated environment, using two representative OECD .Stat V7 production datasets and two ABS datasets. Although the results are not comparable to a live production environment, they provide a general understanding of the services’ performance under stress loads.

In the previous performance review, the analysis was focused on single large CRUD transactions (slices of 1 million observations), using large datasets (10 and 70 million observations). Although it covered the main OECD production data loading scenarios, it left out the most common data consumption scenarios. These scenarios are typically small filtered concurrent data queries from data explorer, to visualize and extract of small ranges of data. 

## Setup
### Virtual machine 
* Memory: 16 GB
* vCPUs: 8 Intel(R) Xeon(R) CPU E5-2680 v4 @ 2.4 GHz
* Disk: 250 GB 	  
* Windows server 2016 standard (64-bit)
* Microsoft SQL Server 2017 Enterprise Edition 
### DotStat
*  .Stat V8 v2.0 - November 2019 built
### Performance analysis tools
* JetBrains dotTrace
* Redgate Monitoring
* JMeter

## Expected data sizes in a realistic production environment 
The OECD .Stat V7 production environment is a point of reference to the type of conditions in which .Stat V8 will operate. The following histogram represents the OECD production datasets grouped by number of observations.

![histogram](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/uploads/f7984abd63fc6005dace69e1a5b4f7b1/histogram.PNG)

In the current OECD dotstat V7 production, there are 2679 datasets, where ~ 2474 (92.35%) contain less than 3 Million observations. To better represent this scenario, the performance tests used 10 datasets with the following characteristics:
 
|Dataflows|Dimensions|Obs. level Attr.|DimGroup level Attr.|Size|Total observations|
|------ |------ |------ |------ |------ |------ |
|ABS:WPI(1.0.0)|8|2|2|small|19,537|
|ABS:WPI_2(1.0.0)|8|2|2|small|19,537|
|ABS:WPI_3(1.0.0)|8|2|2|small|19,537|
|ABS:WPI_4(1.0.0)|8|2|2|small|19,537|
|ABS:WPI_5(1.0.0)|8|2|2|small|19,537|
|ABS:DF_CPI(1.0.0)|6|2|2|medium|654,143|
|ABS:DF_CPI_2(1.0.0)|6|2|2|medium|654,143|
|ABS:DF_CPI_3(1.0.0)|6|2|2|medium|654,143|
|OECD:MEI_DF(1.0)|5|1|4|large|10,000,000|
|OECD:CRS1_DF(1.0)|9|1|4|extra-large|70,000,000|

## Concurrent data updates
### Benchmark
The following table contains the average import time per dataflow when there are no concurrent transactions. This table can be used as a reference to see how concurrency affects the importing time. 

Dataflow|ART_ID|Imported obs|Existing Obs|% size import|Avg import time in ms|time in min|
|------ |------ |------ |------ |------ |------ |------ |
|OECD:MEI_DF(1.0)|16|3,000,000|10,000,000|30.00|96873|1.61|
|OECD:CRS1_DF(1.0)|1|1,000,000|70,000,000|1.43|175,074|2.92|
|ABS:DF_CPI(1.0.0)|27|196,243|654,143|30.00|7236|0.12|
|ABS:DF_CPI_2(1.0.0)|50|196,243|654,143|30.00|7241|0.12|
|ABS:DF_CPI_3(1.0.0)|64|196,243|654,143|30.00|7469|0.12|
|ABS:WPI(1.0.0)|37|2,862|19,537|14.65|451|0.01|
|ABS:WPI_2(1.0.0)|52|2,862|19,537|14.65|474|0.01|
|ABS:WPI_3(1.0.0)|55|2,862|19,537|14.65|451|0.01|
|ABS:WPI_4(1.0.0)|58|2,862|19,537|14.65|449|0.01|
|ABS:WPI_5(1.0.0)|61|2,862|19,537|14.65|441|0.01|

* *The imported obs column represents the size of the csv import files used for each dataset.*
* *The % size import represents the percentage of the data imported compared to the existing amount of observations in the dataset.*
* *These percentages were chosen based on the common usage in the current OECD .Stat V7 production.* 

### Test 1. - 10 Concurrent data updates (1 update for each dataset)
The objective of this test is to show how the transfer-service handles concurrent data imports for various datasets. In this test, there were 10 csv files imported to 10 different datasets, triggered a the same time.

TRANSACTION_ID|ART_ID|DSD_DATE_CREATED|READY_FOR_VALIDATION_DATE|Import order|total_time in ms|time in min|
|------ |------ |------ |------ |------ |------ |------ |
|168|16|23:45.4|25:24.8|5|99,490|1.66|
|169|1|20:45.5|23:34.7|4|169,176|2.82|
|170|58|25:29.0|25:29.5|8|484|0.01|
|171|52|25:28.1|25:28.6|7|467|0.01|
|172|50|20:37.5|20:44.8|3|7,306|0.12|
|173|64|20:20.0|20:27.9|1|7,923|0.13|
|174|27|20:28.9 |20:36.3|2|7,443|0.12|
|175|37|25:27.1|25:27.6|6|487|0.01|
|176|61|25:29.9|25:30.4|9|437|0.01|
|177|55|25:30.8|25:31.3|10|466|0.01|
|||Total time||293,679|5|

Analyzing the results, the imports times seem not to be affected and comparable to the [benchmark](#benchmark), but looking at the import start time (DSD_DATE_CREATED) and import end times (READY_FOR_VALIDATION_DATE) per dataflow, **the import requests were processed one at a time, and not concurrently.**

## Test 2.-  80 concurrent data updates (10 updates for each dataset) not including MEI and CRS
The objective of this test is to show how the transfer-service handles large amounts of concurrent import requests, and multiple requests to the same dataset.

|TRANSACTION_ID|ART_ID|DSD_DATE_CREATED|READY_FOR_VALIDATION_DATE|total_time in ms|
|------ |------ |------ |------ |------ |
|198|64|50:03.7|50:12.0|8254|
|200|55|50:31.0|50:31.4|453|
|201|61|50:31.9|50:32.3|437|
|202|27|50:12.8|50:20.0|7187|
|203|37|50:30.1|50:30.6|470|
|204|50|50:21.1|50:28.5|7344|
|205|61|50:29.2|50:29.6|420|
|208|37|50:32.8|50:33.2|437|
|209|61|50:59.0|50:59.5|436|
|210|52|50:58.2|50:58.6|420|
|211|58|50:59.9|51:00.3|436|
|212|27|50:49.7|50:56.9|7234|
|213|64|50:33.6|50:40.9|7334|
|214|50|50:41.6|50:49.1|7433|
|216|52|51:00.8|51:01.3|534|
|218|37|51:02.6|51:03.0|436|
|219|52|51:01.7|51:02.2|437|
|220|55|51:03.4|51:03.9|470|
|221|58|51:12.9|51:13.3|437|
|222|61|51:13.7|51:14.2|437|
|223|27|51:04.3|51:11.7|7353|
|224|58|51:30.5|51:30.9|420|
|225|64|51:14.6|51:21.9|7267|
|227|37|51:39.8|51:40.2|440|
|228|52|51:40.6|51:41.2|534|
|229|50|51:22.5|51:29.8|7230|
|231|61|51:57.9|51:58.3|437|
|232|27|51:31.4|51:38.6|7270|
|233|58|51:58.8|51:59.2|483|
|234|55|52:07.7|52:08.3|640|
|235|27|51:41.5|51:48.8|7270|
|236|64|51:50.0|51:57.2|7194|
|238|55|52:16.7|52:17.2|470|
|239|50|51:59.6|52:07.0|7360|
|240|64|52:08.9|52:16.0|7137|
|241|27|52:17.6|52:24.8|7210|
|242|37|52:34.0|52:34.4|454|
|243|58|52:34.8|52:35.3|483|
|244|61|52:35.7|52:36.2|470|
|246|50|52:25.9|52:33.2|7227|
|247|37|52:37.6|52:38.0|436|
|248|55|52:36.6|52:37.1|454|
|249|58|52:39.4|52:39.8|484|
|250|52|52:38.4|52:38.8|420|
|251|61|52:56.4|52:56.8|423|
|253|64|52:40.3|52:47.8|7450|
|254|50|52:48.4|52:55.6|7210|
|256|27|52:57.2|53:04.5|7340|
|258|37|53:22.7|53:23.1|423|
|259|55|53:21.9|53:22.3|437|
|260|58|53:23.6|53:24.1|484|
|261|52|53:24.6|53:25.0|436|
|262|61|53:25.4|53:25.9|483|
|263|27|53:05.6|53:12.9|7220|
|264|50|53:14.0|53:21.2|7137|
|266|37|53:34.8|53:35.3|470|
|267|55|53:44.6|53:45.0|440|
|269|58|53:43.6|53:44.1|487|
|270|52|53:45.5|53:45.9|420|
|271|27|53:26.3|53:33.7|7413|
|272|55|53:54.2|53:54.6|437|
|273|61|53:55.1|53:55.6|500|
|274|64|53:35.7|53:42.9|7210|
|275|64|53:46.3|53:53.5|7220|
|278|52|54:12.4|54:12.9|436|
|279|58|54:21.1|54:21.6|484|
|280|37|54:22.0|54:22.4|467|
|281|50|53:55.9|54:03.3|7323|
|282|61|54:22.9|54:23.3|423|
|283|27|54:03.9|54:11.2|7287|
|284|55|54:31.9|54:32.3|437|
|285|64|54:13.2|54:20.4|7166|
|288|52|54:40.7|54:41.2|500|
|290|50|54:23.8|54:31.1|7326|
|291|58|54:50.3|54:50.7|437|
|292|64|54:32.8|54:39.9|7100|
|293|37|54:49.4|54:49.9|437|
|294|52|54:51.1|54:51.7|516|
|295|55|54:52.1|54:52.5|454|
|296|50|54:41.5|54:48.8|7216|
||||total_time| 4 min 50 sec|

The import times for the different datasets are similar to the [benchmark](#benchmark). 
It was expected that only the first import request of each of the 8 different datasets would have been accepted, and the other 9 would be rejected; to give a total of 8 success imports and 72 request rejected. **Instead, all request were successfully processed, one at a time.**

## Single data query with concurrent data requests
### Test 3. - Request the same query concurrently for different amounts of users
For these tests, the single query */Rest/data/OECD,CRS1_DF,1.0/20005..1000.100.100.D.115./* was requested concurrently for multiple amounts of users. Apart from the query on the dimensions, the header range was used to limit the amount of observations to 2680 (one page for data explorer view). 
 
![singleconcurrentquery](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/uploads/027bd2ab2faf6acb613cd4afc216a7cd/singleconcurrentquery.PNG)

One of the main changes introduced by the V8 2.0 was the use of column-stored indexes in the database model. These indexes are not optimal when querying small amounts of rows from large tables. 

The results show that V8 2.0 has been improved largely compared to the previous version, and that it is able to perform better than dotstat V7 under high loads. 

## Multiple data queries with concurrent requests
For the following tests, the data requests were grouped in five categories by response size:
* Extra-Small - (1-3KB)
* Small - (~30-40KB)
* Medium - (~400KB)
* Large - (~2MB)
* Extra-Large - (20MB+)

**The purpose of this grouping and the selection of these specific queries, is to align this performance review with the analysis done by ABS and the performance requirements specified in [this ticket](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/88#note_231439052)**

### Example queries
* Extra-Small (1-3KB)
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1.10001.10.50.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/2.10001.10.50.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.50.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.1.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.2.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.3.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.4.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.5.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.6.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.7.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.8.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/3.10001.10.50.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/1.THRPEB.1.TOT.10.3.Q/ABS?startPeriod=2017-Q2&endPeriod=2018-Q2 
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/2.THRPEB.1.TOT.10.3.Q/ABS?startPeriod=2017-Q2&endPeriod=2018-Q2 
* Small (~30-40KB)
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.10001...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.20001...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.30002...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.40005...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.40006...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.40007...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.30003...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.114120...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.114121...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.114122...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.20002...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/.20003...Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/...TOT.10.3.Q/ABS?startPeriod=2012-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/...TOT.10.2.Q/ABS?startPeriod=2012-Q2&endPeriod=2018-Q2 
* Medium (~400KB)
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.50.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.1.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.2.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.3.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.4.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.5.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.6.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.7.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1+2+3..10.8.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1..10.1+2+3.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1..10.3+4+5.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/1..10.6+7+8.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/.THRPEB.....Q/ABS?startPeriod=2015-Q2&endPeriod=2018-Q2 
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/.THRPEB.....Q/ABS?startPeriod=2010-Q2&endPeriod=2013-Q2 
* Large (~2MB)
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/...1+2+3.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/...2+3+4Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/...3+4+5.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/...4+5+6.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/...5+6+7.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/...6+7+8.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/...7+8+50.Q/?startPeriod=2017-Q2&endPeriod=2018-Q2
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/all/ABS?startPeriod=2000&endPeriod=2018
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,WPI,1.0.0/all/ABS?startPeriod=1999&endPeriod=2017
* Extra-Large (20MB+)
    * http://nsi-stable-siscc.redpelicans.com/rest/data/ABS,CPI,1.0.0/all/?startPeriod=2010
 
The sample queries were refactored and replicated to target the following datasets: 
* ABS:WPI(1.0.0)
* ABS:WPI_2(1.0.0)
* ABS:WPI_3(1.0.0)
* ABS:WPI_4(1.0.0)
* ABS:WPI_5(1.0.0)
* ABS:DF_CPI(1.0.0)
* ABS:DF_CPI_2(1.0.0)
* ABS:DF_CPI_3(1.0.0)

The idea behind this set up was to have a test scenario to launch multiple different concurrent queries to different datasets and avoid targeting only a single dataset. 

## Summary of the results
 
### Average response time for concurrent requests for multiple response sizes.
![multipleconcurrentqueries](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/uploads/3ab158ae24c034d4bd0309490ad40347/multipleconcurrentqueries.PNG)

### Percentage of errors for concurrent requests for multiple response sizes.
![error_rate](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/uploads/e7a9d62ad42ff05ead64c4f7173b79cb/error_rate.PNG)

The results show that the response times for the concurrent data queries seem to grow in a linear way, but for data requests above small size, the error rates are not acceptable. 

A further analysis monitoring the resources on the web server and the SQL server, show that more than 98% of the time is spend waiting on the .Net core code. Most probably on the generation of sdmx objects. 

## Concurrent data updates and data queries
This test was conducted to analyse the behaviour of the systems when concurrent data queries are requested while multiple data updates are being processed. 
* Step 1.-  100 concurrent data queries of mixed response sizes and 80 data imports were requested concurrently
* Step 2. -  While the imports were being completed (import 51), another 100 concurrent data queries of mixed response sizes were requested.
* Step 3. -  While the imports were being completed (import 61), another 100 concurrent data queries of mixed response sizes were requested.

|TRANSACTION_ID|ART_ID|DSD_DATE_CREATED|READY_FOR_VALIDATION_DATE|total_time in ms|
|------ |------ |------ |------ |------ |
|298|37|59:02.3|59:02.8|437|
|299|52|59:03.2|59:03.7|484|
|300|55|59:04.2|59:04.7|436|
|301|58|59:05.1|59:05.5|436|
|302|61|59:06.0|59:06.4|440|
|303|27|58:53.8|59:01.2|7350|
|**304**|**50**|**58:07.9**|**58:52.9**|**45047**|
|305|64|57:58.6|58:07.2|8614|
|307|55|59:31.9|59:32.4|437|
|308|58|59:31.1|59:31.5|420|
|309|64|59:06.8|59:14.0|7197|
|310|27|59:14.7|59:21.9|7223|
|312|50|59:23.0|59:30.3|7300|
|315|37|59:34.6|59:35.1|467|
|316|52|59:32.8|59:33.3|483|
|317|61|59:33.7|59:34.2|470|
|318|37|59:35.5|59:35.9|440|
|319|52|59:36.4|59:36.9|517|
|320|58|59:37.3|59:37.8|487|
|321|55|59:47.3|59:47.7|424|
|322|61|59:46.4|59:46.8|420|
|323|64|59:38.2|59:45.7|7506|
|324|37|59:48.2|59:48.7|470|
|325|52|59:57.4|59:58.0|513|
|326|55|59:58.4|59:58.8|437|
|327|58|00:15.0|00:15.5|484|
|328|61|00:15.9|00:16.4|454|
|329|27|59:49.1|59:56.3|7193|
|330|64|59:59.2|00:06.4|7220|
|331|50|00:07.1|00:14.3|7214|
|334|61|00:49.3|00:49.8|436|
|335|55|00:50.3|00:50.7|473|
|336|64|00:16.8|00:24.0|7157|
|337|55|01:15.5|01:16.0|437|
|338|27|00:24.7|00:31.8|7184|
|339|50|00:33.1|00:40.2|7133|
|340|27|00:40.9|00:48.1|7243|
|341|52|01:19.0|01:19.5|500|
|342|37|01:16.4|01:16.8|454|
|346|37|01:32.7|01:33.1|437|
|347|50|01:07.5|01:14.8|7306|
|348|52|01:18.1|01:18.6|437|
|349|52|01:20.0|01:20.4|436|
|350|37|01:17.3|01:17.7|453|
|352|61|01:20.8|01:21.3|436|
|355|64|00:51.1|00:58.5|7357|
|356|27|00:59.1|01:06.4|7240|
|357|58|01:31.8|01:32.2|440|
|358|52|01:30.9|01:31.3|456|
|359|37|01:21.7|01:22.1|420|
|360|58|02:53.0|02:53.4|440|
|361|61|02:54.8|02:55.3|437|
|362|58|02:52.1|02:52.6|436|
|363|58|02:53.9|02:54.4|483|
|364|50|01:22.5|01:30.1|7550|
|**365**|**50**|**01:41.7**|**02:35.1**|**53353**|
|366|27|01:33.5|01:40.6|7157|
|367|61|04:03.4|04:03.8|420|
|368|61|04:04.3|04:04.8|467|
|369|55|04:13.0|04:13.5|437|
|370|27|02:35.9|02:43.1|7223|
|371|50|02:44.3|02:51.4|7087|
|372|27|02:55.6|03:03.0|7350|
|373|64|03:04.1|03:12.0|7867|
|374|52|04:22.7|04:23.2|437|
|**375**|**64**|**03:12.7**|**04:01.6**|**48870**|
|377|55|04:21.8|04:22.2|483|
|378|37|04:48.5|04:49.0|517|
|380|58|04:31.5|04:31.9|436|
|383|55|04:49.4|04:49.9|470|
|384|64|04:05.2|04:12.3|7163|
|385|50|04:13.9|04:21.0|7174|
|388|37|04:50.3|04:50.7|420|
|389|55|04:51.1|04:51.6|483|
|392|52|04:52.1|04:52.6|483|
|393|58|04:53.0|04:53.4|437|
|394|50|04:23.6|04:30.8|7166|
|395|61|04:53.8|04:54.3|437|
|396|27|04:32.3|04:39.5|7203|
|397|64|04:40.6|04:47.7|7140|
||||**total time** |**5 min 50 sec**|

The results show that there was an increase of one minute for the total time to import the 80 requests compared to the previous test where not concurrent data request were made.

The highlighted rows show how the time for the import transaction was affected by the concurrent data requests.

The following table contains the 3 imports that were affected by the concurrent data queries and how the timings compare to the [benchmark](#benchmark):

|TRANSACTION_ID|ART_ID|DSD_DATE_CREATED|READY_FOR_VALIDATION_DATE|total_time|Avg time single import|Time Increase|
|------ |------ |------ |------ |------ |------ |------ |
|304|50|58:07.9|58:52.9|45047|7241|X6|
|365|50|01:41.7|02:35.1|53353|7241|X7|
|375|64|03:12.7|04:01.6|48870|7469|X6.5|

* The column *Avg time single import* represents the expected times from the [benchmark](#benchmark)


The response time of the concurrent data query requests was slightly affected, compared to the benchmark time of 0.8 min when no data was being imported. 

The following table contains total time taken the 3 concurrent data queries and compare them to the average time shown in the results when no imports were made. [summary](#summary-of-the-results) *(see avg time for 100 concurrent requests for mixed response size)*

|100 data requests of mixed size|Import transaction| average ms |time in min|Avg time query only|Time increase|
|------ |------ |------ |------ |------ |------ |
|1|0|51094|0.851567|48000|X1.06|
|2|51|49898|0.831633|48000|X1.04|
|3|61|53897|0.898283|48000|X1.12|

**In the following excel file, you will find all the collected information from the performance tests.** [Performance_results.xlsx](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/uploads/9fec13aaa877c529e7983c1e78bcbd26/Performance_results.xlsx)
