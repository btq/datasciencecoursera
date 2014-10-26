setwd("D:/GitHub/datasciencecoursera/getcleandata/quiz2/")

#2013-11-07

file <- "../quiz1/getdata_data_ss06pid.csv"
acs <- read.csv(file)
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")

unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

#How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
fileUrl = "http://biostat.jhsph.edu/~jleek/contact.html"
download.file(fileUrl, destfile="./contact.html")
sum(nchar(readLines("contact.html",n=10)[10]))
sum(nchar(readLines("contact.html",n=20)[20]))
sum(nchar(readLines("contact.html",n=30)[30]))
sum(nchar(readLines("contact.html",n=100)[100]))

fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
fileName = "getdata_wksst8110.for"
download.file(fileUrl, destfile="./getdata_wksst8110.for")
#ugh! this file sucks just estimated the answer, tried this below:
sstDat <- read.fwf(fileName,widths=c(9,8,8,8,8),skip=4)

