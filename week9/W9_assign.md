---
title: "IS607 - Week 9"
author: "Nathan Lim"
date: "March 24, 2015"
output: html_document
---

* * *
## IS607 - Week 9
### Seoungyoon Lim(Nathan Lim)

* * *

## Table of Contents
* [Assignment](#Assignment)
* [DATA from HTML](#DATA from HTML)
* [DATA from JSON](#DATA from JSON)
* [DATA from XML](#DATA from XML)
* [Conclusion](#Conclusion)

* * *

## <a name="Assignment"></a>Assignment

Pick three of your favorite books on one of your favorite subjects. At least one of the books should have more than one author. For each book, include the title, authors, and two or three other attributes that you find interesting.
Take the information that you’ve selected about these three books, and separately create three files which store the book’s information in HTML (using an html table), XML, and JSON formats (e.g. “books.html”, “books.xml”, and “books.json”). To help you better understand the different file structures, I’d prefer that you create each of these files “by hand” unless you’re already very comfortable with the file formats.


 Attributes I chose,

* Title
* Authors
* Price
* Type(hardcover, paperbook)
* Pages



```r
library(RCurl)
library(XML)
library(jsonlite)
library(knitr)
```


```r
#assign URLs 
html <- "https://raw.githubusercontent.com/nathanlim45/IS607/master/week9/books.html"
json <- "https://raw.githubusercontent.com/nathanlim45/IS607/master/week9/books.json"
xml <- "https://raw.githubusercontent.com/nathanlim45/IS607/master/week9/books.xml"
```

* * *

## <a name="DATA from HTML"></a>DATA from HTML


```r
url_html <- getURL(html)
data_html <- readHTMLTable(url_html)
str(data_html)
```

```
## List of 1
##  $ NULL:'data.frame':	3 obs. of  5 variables:
##   ..$ title  : Factor w/ 3 levels "Harry Potter and the Sorcerer's Stone",..: 1 2 3
##   ..$ authors: Factor w/ 3 levels "C.S. Lewis, Pauline Baynes",..: 2 1 3
##   ..$ price  : Factor w/ 3 levels "10.66","22.34",..: 3 2 1
##   ..$ type   : Factor w/ 2 levels "hardcover","paperback": 2 1 2
##   ..$ pages  : Factor w/ 3 levels "320","432","784": 1 3 2
```

```r
book_html <- data_html[[1]]
str(book_html)
```

```
## 'data.frame':	3 obs. of  5 variables:
##  $ title  : Factor w/ 3 levels "Harry Potter and the Sorcerer's Stone",..: 1 2 3
##  $ authors: Factor w/ 3 levels "C.S. Lewis, Pauline Baynes",..: 2 1 3
##  $ price  : Factor w/ 3 levels "10.66","22.34",..: 3 2 1
##  $ type   : Factor w/ 2 levels "hardcover","paperback": 2 1 2
##  $ pages  : Factor w/ 3 levels "320","432","784": 1 3 2
```

```r
kable(book_html)
```



|title                                 |authors                    |price |type      |pages |
|:-------------------------------------|:--------------------------|:-----|:---------|:-----|
|Harry Potter and the Sorcerer's Stone |J.K. Rowling               |7.48  |paperback |320   |
|The Chronicles of Narnia              |C.S. Lewis, Pauline Baynes |22.34 |hardcover |784   |
|The Fellowship of the Ring            |J.R.R. Tolkien             |10.66 |paperback |432   |

* * *

## <a name="DATA from JSON"></a>DATA from JSON


```r
url_json <- getURL(json)
data_json = fromJSON(url_json)
str(data_json)
```

```
## 'data.frame':	3 obs. of  5 variables:
##  $ title  : chr  "Harry Potter and the Sorcerer's Stone" "The Chronicles of Narnia" "The Fellowship of the Ring"
##  $ authors:List of 3
##   ..$ : chr "J.K. Rowling"
##   ..$ : chr  "C.S. Lewis" "Pauline Baynes"
##   ..$ : chr "J.R.R. Tolkien"
##  $ price  : num  7.48 22.34 10.66
##  $ type   : chr  "paperback" "hardcover" "paperback"
##  $ pages  : int  320 784 432
```

```r
unlisted <- unlist(data_json[[2]])
aa<-c(unlisted[1], paste(unlisted[2], unlisted[3], sep=","), unlisted[3])
data_json$authors <- aa
str(data_json)
```

```
## 'data.frame':	3 obs. of  5 variables:
##  $ title  : chr  "Harry Potter and the Sorcerer's Stone" "The Chronicles of Narnia" "The Fellowship of the Ring"
##  $ authors: chr  "J.K. Rowling" "C.S. Lewis,Pauline Baynes" "Pauline Baynes"
##  $ price  : num  7.48 22.34 10.66
##  $ type   : chr  "paperback" "hardcover" "paperback"
##  $ pages  : int  320 784 432
```

```r
kable(data_json)
```



|title                                 |authors                   | price|type      | pages|
|:-------------------------------------|:-------------------------|-----:|:---------|-----:|
|Harry Potter and the Sorcerer's Stone |J.K. Rowling              |  7.48|paperback |   320|
|The Chronicles of Narnia              |C.S. Lewis,Pauline Baynes | 22.34|hardcover |   784|
|The Fellowship of the Ring            |Pauline Baynes            | 10.66|paperback |   432|


* * *

## <a name="DATA from XML"></a>DATA from XML


```r
url_xml <- getURL(xml) 
xml_parsed <- xmlParse(url_xml)
list_xml<- xmlToList(xml_parsed)
library(plyr)
data_xml <- ldply(list_xml, function(x) {data.frame(x)})
book_xml <- data_xml[,2:6]
str(book_xml)
```

```
## 'data.frame':	3 obs. of  5 variables:
##  $ title  : Factor w/ 3 levels "Harry Potter and the Sorcerer's Stone",..: 1 2 3
##  $ authors: Factor w/ 3 levels "J.K. Rowling",..: 1 2 3
##  $ price  : Factor w/ 3 levels "7.48","22.34",..: 1 2 3
##  $ type   : Factor w/ 2 levels "paperback","hardcover": 1 2 1
##  $ pages  : Factor w/ 3 levels "320","784","432": 1 2 3
```

```r
kable(book_xml)
```



|title                                 |authors                    |price |type      |pages |
|:-------------------------------------|:--------------------------|:-----|:---------|:-----|
|Harry Potter and the Sorcerer's Stone |J.K. Rowling               |7.48  |paperback |320   |
|The Chronicles of Narnia              |C.S. Lewis, Pauline Baynes |22.34 |hardcover |784   |
|The Fellowship of the Ring            |J.R.R. Tolkien             |10.66 |paperback |432   |

* * *

## <a name="Conclusion"></a>Conclusion

The values of each table are identical, though, their data types and forms were different depending on the data forms. So, to get the same three data frames and tables from each data, extra works are necessary. 
