corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  fileList <- list.files(path = directory)
  allCors <- c()
  
  for(i in fileList) {
    thisMonitor <- read.csv(file.path(directory,i))
    if(sum(complete.cases(thisMonitor))>threshold) {
      thisMonitor[complete.cases(thisMonitor),2:3]
      allCors <- c(allCors,cor(thisMonitor$sulfate,thisMonitor$nitrate,use="complete.obs"))
    }
  }
  allCors
}