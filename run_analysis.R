#Load dplyr
library(dplyr)

#Read in Descriptive Feature Names
feature_names <- read.table("./features.txt")$V2

#Read Training Dataset and Bind on Columns
X_train <- read.table("./train/X_train.txt", col.names=feature_names)
y_train <- read.table("./train/y_train.txt", col.names=c('activity'))
subj_train <- read.table("./train/subject_train.txt", col.names=c('subject'))
train_data <- cbind(X_train, y_train, subj_train)

#Read Testing Dataset and Bind on Columns
X_test <- read.table("./test/X_test.txt", col.names=feature_names)
y_test <- read.table("./test/y_test.txt", col.names=c('activity'))
subj_test <- read.table("./test/subject_test.txt", col.names=c('subject'))
test_data <- cbind(X_test, y_test, subj_test)

#Bind both Training and Testing Datasets on Rows
df <- rbind(train_data, test_data)
#Select only Column Names with Mean/Std/Subject/Activity
df <- df[, grepl("mean|std|subject|activity", names(df))]

#Read Activity Label and Map to Numerical Activity Column
activity_labels <- read.table("./activity_labels.txt")
df$activity <- factor(df$activity, levels=activity_labels[,1], labels=activity_labels[,2])

#Group by Subject and Activity and Taking Average on all Variables
tidy_dataset <- df %>% group_by(subject, activity) %>% summarise_all(mean)
write.table(tidy_dataset, "TidyData.txt", row.name=FALSE)