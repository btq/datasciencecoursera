complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  cnames <- c("id","nobs")
  #fileList <- list.files(path = directory)
  thisMonitor <- read.csv(file.path(directory,sprintf("%03i.csv",id[1])))
  #allVals <- c(id[1],min(sum(!is.na(thisMonitor$sulfate)),sum(!is.na(thisMonitor$nitrate))))
  allVals <- c(id[1],sum(complete.cases(thisMonitor)))
  for(i in id[-1]) {
    thisMonitor <- read.csv(file.path(directory,sprintf("%03i.csv",i)))
    #thisValues <- c(i,min(sum(!is.na(thisMonitor$sulfate)),sum(!is.na(thisMonitor$nitrate))))
    thisValues <- c(i,sum(complete.cases(thisMonitor)))
    allVals <- c(allVals,thisValues)
  }
  returnVal <- data.frame(id = allVals[seq(1,length(allVals),2)],nobs = allVals[seq(2,length(allVals),2)])
  returnVal
}