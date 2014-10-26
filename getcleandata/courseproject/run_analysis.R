setwd('D:/GitHub/datasciencecoursera/getcleandata/courseproject')
library(reshape2)

### 1. Merge the training and the test sets to create one data set.
## Read features
features <- read.table("UCI HAR Dataset/features.txt", comment.char = c(""), colClasses=c("numeric", "character"), col.names = c("featurenum", "featurename"))

## Clean feature names (remove parens commas & dashes)
features$featurename <- tolower(gsub(")", "", gsub("(", "", gsub(",", "", gsub("-", "", features$featurename, fixed=TRUE), fixed=TRUE), fixed=TRUE), fixed=TRUE))
## Rename acc to be descriptive
features$featurename <- gsub("acc", "acceleration", features$featurename)

## Read xtrain set
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", comment.char = c(""), colClasses=c("numeric"))
## Read xtest set
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", comment.char = c(""), colClasses=c("numeric"))
## Read subject train
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", comment.char = c(""), colClasses=c("factor"), col.names = c("subject"))
subjecttrain$subject <- relevel(subjecttrain$subject, 1)
## Read subject test
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", comment.char = c(""), colClasses=c("factor"), col.names = c("subject"))
subjecttest$subject <- relevel(subjecttest$subject, 1)
## Read train labels
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", comment.char = c(""), colClasses=c("integer"), col.names = c("activity_id"))
## Read test labels
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", comment.char = c(""), colClasses=c("integer"), col.names = c("activity_id"))
## -- Read activity names
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt", comment.char = c(""), colClasses=c("integer", "factor"), col.names = c("activity_id", "activity"))
activity_names$activity <- relevel(activity_names$activity, "WALKING")
## Merge activity names with train/test labels
ytrain$rownum <- seq_len(nrow(ytrain))
ytrain <- merge(ytrain, activity_names, by.x="activity_id", by.y="activity_id")
ytrain <- ytrain[order(ytrain$rownum),]
ytrain$activity_id <- NULL
ytrain$rownum <- NULL

ytest$rownum <- seq_len(nrow(ytest))
ytest <- merge(ytest, activity_names, by.x="activity_id", by.y="activity_id")
ytest <- ytest[order(ytest$rownum),]
ytest$activity_id <- NULL
ytest$rownum <- NULL

## Combine into data frame with all information
dataset <- cbind(rbind(xtrain, xtest), rbind(subjecttrain, subjecttest), rbind(ytrain, ytest))
names(dataset) <- c(features$featurename, "subject", "activity")
dataset$subject <- relevel(dataset$subject, 1)
dataset$activity <- relevel(dataset$activity, "WALKING")


## Compute mean and standard deviation for each of 66 measurements.
meansd_dataset <- dataset[,c("tbodyaccelerationmeanx", "tbodyaccelerationstdx",
                             "tbodyaccelerationmeany", "tbodyaccelerationstdy",
                             "tbodyaccelerationmeanz", "tbodyaccelerationstdz",
                             "tgravityaccelerationmeanx", "tgravityaccelerationstdx",
                             "tgravityaccelerationmeany", "tgravityaccelerationstdy",
                             "tgravityaccelerationmeanz", "tgravityaccelerationstdz",
                             "tbodyaccelerationjerkmeanx", "tbodyaccelerationjerkstdx",
                             "tbodyaccelerationjerkmeany", "tbodyaccelerationjerkstdy",
                             "tbodyaccelerationjerkmeanz", "tbodyaccelerationjerkstdz",
                             "tbodygyromeanx", "tbodygyrostdx",
                             "tbodygyromeany", "tbodygyrostdy",
                             "tbodygyromeanz", "tbodygyrostdz",
                             "tbodygyrojerkmeanx", "tbodygyrojerkstdx",
                             "tbodygyrojerkmeany", "tbodygyrojerkstdy",
                             "tbodygyrojerkmeanz", "tbodygyrojerkstdz",
                             "tbodyaccelerationmagmean", "tbodyaccelerationmagstd",
                             "tgravityaccelerationmagmean", "tgravityaccelerationmagstd",
                             "tbodyaccelerationjerkmagmean","tbodyaccelerationjerkmagstd",
                             "tbodygyromagmean", "tbodygyromagstd",
                             "tbodygyrojerkmagmean","tbodygyrojerkmagstd",
                             "fbodyaccelerationmeanx", "fbodyaccelerationstdx",
                             "fbodyaccelerationmeany", "fbodyaccelerationstdy",
                             "fbodyaccelerationmeanz", "fbodyaccelerationstdz",
                             "fbodyaccelerationjerkmeanx", "fbodyaccelerationjerkstdx",
                             "fbodyaccelerationjerkmeany", "fbodyaccelerationjerkstdy",
                             "fbodyaccelerationjerkmeanz", "fbodyaccelerationjerkstdz",
                             "fbodygyromeanx", "fbodygyrostdx",
                             "fbodygyromeany", "fbodygyrostdy",
                             "fbodygyromeanz", "fbodygyrostdz",
                             "fbodyaccelerationmagmean", "fbodyaccelerationmagstd",
                             "fbodybodyaccelerationjerkmagmean", "fbodybodyaccelerationjerkmagstd",
                             "fbodybodygyromagmean", "fbodybodygyromagstd",
                             "fbodybodygyrojerkmagmean", "fbodybodygyrojerkmagstd",
                             "subject", "activity")]

## make a tidy dataset for each activity and each subject.
tidy_dataset <- meansd_dataset
for (nameId in seq_along(colnames(tidy_dataset))) {
  if (colnames(tidy_dataset)[nameId] != "subject" && colnames(tidy_dataset)[nameId] != "activity") {
    colnames(tidy_dataset)[nameId] <- paste("mean_", colnames(tidy_dataset)[nameId], sep="")
  }
}
measure_var_vec <- c()
for (nameId in seq_along(colnames(meansd_dataset))) {
  if (colnames(meansd_dataset)[nameId] != "subject" && colnames(meansd_dataset)[nameId] != "activity") {
    measure_var_vec <- append(measure_var_vec, colnames(meansd_dataset)[nameId])
  }
}

meltdf <- melt(meansd_dataset, id=c("subject", "activity"), measure.vars=measure_var_vec)
tidy_dataset <- dcast(meltdf, subject + activity ~ ..., mean)
for (nameId in seq_along(colnames(tidy_dataset))) {
  if (colnames(tidy_dataset)[nameId] != "subject" && colnames(tidy_dataset)[nameId] != "activity") {
    # Prefix 'meanof' to the variable names.
    colnames(tidy_dataset)[nameId] <- paste("meanof", colnames(tidy_dataset)[nameId], sep="")
    # Use same precision as input for mean values.
    tidy_dataset[,nameId] <- format(tidy_dataset[,nameId], scientific=TRUE)
  }
}
tidy_dataset <- tidy_dataset[order(tidy_dataset$subject, tidy_dataset$activity),]

## Tidy Data:
## 1. Each variable should be in one column.
## 2. Each observation should in in one row.
## 3. One table per "kind" of variable.
## 4. Multiple tables should be linked by an one (or more) column(s).
## Output of Tidy Data:
## 1. Include a header with variable names.
## 2. Make variable names human readable.
## 3. One file per table.
## --- USE 'write.table'
write.table(tidy_dataset, "tidy_dataset.txt", quote=FALSE, sep="\t")