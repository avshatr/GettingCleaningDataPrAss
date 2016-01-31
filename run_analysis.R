#check all files exist and download if something is wrong
cond<-file.exists('./UCI HAR Dataset/train/X_train.txt') &
  file.exists('./UCI HAR Dataset/train/y_train.txt') &
  file.exists('./UCI HAR Dataset/train/subject_train.txt') &
  file.exists('./UCI HAR Dataset/test/X_test.txt') &
  file.exists('./UCI HAR Dataset/test/y_test.txt') &
  file.exists('./UCI HAR Dataset/test/subject_test.txt') &
  file.exists('./UCI HAR Dataset/train/y_train.txt') &
  file.exists('./UCI HAR Dataset/activity_labels.txt') &
  file.exists('./UCI HAR Dataset/features.txt')
if (cond==FALSE) 
{download.file(
  'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
destfile='data.zip')
unzip('data.zip')}
####

#Read data 
X_train<-read.table('./UCI HAR Dataset/train/X_train.txt')
y_train<-read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train<-read.table('./UCI HAR Dataset/train/subject_train.txt')

X_test<-read.table('./UCI HAR Dataset/test/X_test.txt')
y_test<-read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test<-read.table('./UCI HAR Dataset/test/subject_test.txt')

labels<-read.table('./UCI HAR Dataset/activity_labels.txt')
features<-read.table('./UCI HAR Dataset/features.txt')
###

# merge data sets
X<-rbind(X_train,X_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
###

#assign names to the data set
names(X)<-features[[2]]
###

#extract mean() and std() measurements
featureinds<-grep('(.*-mean\\(\\))|(.*-std\\(\\))',features[[2]])
X<-X[featureinds]
###

#add activity and subject variables to data set, modify activity labels
labels[[2]]<-tolower(labels[[2]])
labels[[2]]<-gsub('_','',labels[[2]])

for (k in 1:dim(labels)[1])
{y[y==k]<-labels[[2]][k]}


X$activity<-y[[1]]
X$subject<-subject[[1]]
###

#modify names of the dataset, although I disagree with the instructors' politics concerning
#variable names.

names(X)<-gsub('-|_|\\(|\\)','',names(X))
names(X)<-gsub('BodyBody','Body',names(X))
names(X)<-gsub('Acc','Acceleration',names(X))
names(X)<-gsub('^t([A-Z])','time\\1',names(X))
names(X)<-gsub('^f([A-Z])','frequency\\1',names(X))
names(X)<-gsub('Mag','Magnitude',names(X))
names(X)<-gsub('Gyro','gyroscope',names(X))

names(X)<-tolower(names(X)) #now all the variable names are truly ridiculous!

#split the dataset into appropriate groups and average variables
Xsplit<-split(X,interaction(X$subject,X$activity))

firstsixsix<-function(x){colMeans(x[,1:66])}
Xsplitmean<-lapply(Xsplit,firstsixsix)#a list of numeric vectors with average values
tidyset<-data.frame(do.call('rbind',Xsplitmean))#a data.frame with a tidy dataset
###

#write the data
write.table(tidyset,file='avshatrTidySet.txt',row.names=FALSE)#the file created should 
#be read into workspace with read.table() using header=TRUE argument
