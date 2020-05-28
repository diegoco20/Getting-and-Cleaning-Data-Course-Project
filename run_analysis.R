# Reading the data to R environment
##Reading Train and Test Data
setwd("C:\Users\Usuario\Desktop\Data\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset")



### Reading Train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") #Train measurements
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") #Train activity
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #Train subjects


### Reading Test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt") #Test measurements
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") #Test activity
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") #Test subjects

###Read Features and Activities descriptive information
features <- read.table("./UCI HAR Dataset/features.txt") 
activities <- read.table("./UCI HAR Dataset/activity_labels.txt") 

# 1. Merging Train and Test Data
X_merge = rbind(X_train, X_test)
y_merge= rbind(y_train, y_test)
Subjects= rbind(subject_train, subject_test)
names(Subjects)="Subjects"

# 2 y 4. Extracting only mean and std measurements and calling them appropriately
names(X_merge)=features$V2  ##Appropiately labels
number_filter= grepl("mean|std", features$V2) # Logical vector to select columns 
features_filter=X_merge[,number_filter] #Filtering data


# 3. Use descriptive activity names
Activities= factor(y_merge$V1 , labels = as.character(activities$V2))


##### 5. Tidy Data creation
tidy_data=data.frame(Subjects[1], Activities, features_filter) # Creating a tidy data data frame 
tidy_data_group= group_by(tidy_data, Subjects, Activities) %>%  summarise_each(funs(mean)) #Grouping and summarizing it 
tidy_data_group
write.table(tidy_data_group, "tidy_data.txt", row.names = FALSE, quote = FALSE) #Creating the tidy data


