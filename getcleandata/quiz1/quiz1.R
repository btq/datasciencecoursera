setwd("D:/GitHub/datasciencecoursera/getcleandata/quiz1/")

data <- read.csv("getdata_data_ss06hid.csv")
sum(data$VAL[!is.na(data$VAL)] == 24)

library(xlsx)
dat <- read.xlsx("getdata_data_DATA.gov_NGAP.xlsx",sheetIndex = 1,colIndex=7:15,rowIndex=18:23)
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)
doc <- xmlTreeParse("getdata_data_restaurants.xml",useInternal=TRUE)
rootNode <- xmlRoot(doc)
zipDat <- xpathSApply(rootNode,"//zipcode",xmlValue)
sum(zipDat == "21231",rm.na=TRUE)
sum(zipDat[!is.na(zipDat)] == 21231)

library(data.table)
DT <- fread("getdata_data_ss06pid.csv")
DT[,mean(pwgtp15),by=SEX]
