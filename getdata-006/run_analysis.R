# script is supposed to be run in the base directory of extracted data archive

# universal function for loading 'test' and 'training' data sets
load_data_set <- function(set_type) {
  features_t <- read.table('features.txt')
  labels_t <- read.table('activity_labels.txt')
  
  subjects_t <- read.table(file.path(set_type, paste('subject_', set_type, '.txt', sep = '')))
  activities_t <- read.table(file.path(set_type, paste('y_', set_type, '.txt', sep = '')))
  values_t <- read.table(file.path(set_type, paste('X_', set_type, '.txt', sep = '')))
  
  activity_label <- function(value) { as.character(labels_t[labels_t$V1 == value,][1,2]) }
  label_values <- apply(activities_t, 1, activity_label)
  
  df <- data.frame()
  df <- rbind(df, subjects_t)
  df <- cbind(df, label_values)
  
  cols_of_interest <- grep("-mean\\(\\)|-std\\(\\)", features_t$V2, perl = TRUE, value = FALSE)
  colnames_of_interest <- grep("-mean\\(\\)|-std\\(\\)", features_t$V2, perl = TRUE, value = TRUE)
  
  df <- cbind(df, values_t[,cols_of_interest])
  colnames(df) <- c("Subject", "Activity", colnames_of_interest)
  
  df
}

# load both data sets
df1 <- load_data_set('test')
df2 <- load_data_set('train')

# merge them
df <- rbind(df1, df2)

# calculate means using aggregate
agg <- aggregate(df, by = list(df$Subject, df$Activity), FUN = mean)

# drop unnecessary columns
agg$Subject <- NULL
agg$Activity <- NULL

# rename group criteria
colnames(agg)[1] <- "Subject"
colnames(agg)[2] <- "Activity"

# write output
write.table(agg, file = "output.txt", row.name = FALSE)

