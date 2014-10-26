setwd("D:/GitHub/datasciencecoursera/rprogramming/quiz1/")

data <- read.csv("hw1_data.csv")

names(data)

sum(is.na(data$Ozone))
mean(data$Ozone,na.rm = TRUE)
mean(data$Temp[data$Month==6],na.rm=TRUE)
mean(data$Solar.R[data$Ozone > 31 & data$Temp > 90],na.rm=TRUE)
max(data$Ozone[data$Month == 5],na.rm=TRUE)
