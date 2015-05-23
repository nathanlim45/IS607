# 607-week10-assignment.R
# [For your convenience], here is provided code based in Jared Lander's R for Everyone, 

install.packages("XML")
library(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

# 1. What type of data structure is bowlpool? 
str(bowlPool) #data.frame

# 2. Suppose instead you call readHTMLTable() with just the URL argument,
# against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

# What is the type of variable returned in hvalues?
class(hvalues) #list

# 3. Write R code that shows how many HTML tables are represented in hvalues
str(hvalues) #two data frames

# 4. Modify the readHTMLTable code so that just the table with Number, 
# FirstName, LastName, # and Points is returned into a dataframe
firsttable <- readHTMLTable(theURL, which=1, header = TRUE, stringsAsFactors = FALSE)
firsttable

hvalues[[1]]

# 5. Modify the returned data frame so only the Last Name and Points columns are shown.
hvalues[[1]][3:4]

# 6. Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files).  
theURL2 <- "http://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
wiki <- readHTMLTable(theURL2)
head(wiki[[1]])
# 7 How many HTML tables does that page contain?
n_tables <- sapply(wiki, function(x) class(x)=="data.frame")
sum(n_tables)

# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.

#I am using Google Chrome. To see HTML page source, click "View" on the menu and then click "Developer" and "View Source", or, alt+command+U


# 9 (Optional challenge exercise)
# Instead of using readHTMLTable from the XML package, use the functionality in the rvest package to perform the same task.
library(rvest)
rves<- html(theURL2)
rves_table = html_table(html_nodes(rves, "table")[[1]])
head(rves_table)
rves_table==wiki[[1]]

# Which method do you prefer?  Why might one prefer one package over the other?

#Under this assignment, they are not that different. So far, I prefer "XML" package since it is just familiar to use at this moment.
#However I heared about the potential of "rvest" package.

