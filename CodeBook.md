The run_analysis.R script merges train and test data sets (activity and subject labels
are added to feature vectors), then the script
extracts the variables that have 'mean()' or 'std()' in their names (total of 66 columns). 

The names of the variables are altered according to principles of the Course. The table describing 
alteration of the names is included in this file. 

The data are then split into classes according to activity and subject factors.  
The classes are row names of the tidy data set and follow the scheme "subject_number.activity_name".


Inside each class the mean value of each column (each variable) is computed.

The output data set is a data frame called 'tidyset'. Features are columns of the 'tidyset'. 
Pairs of subjects and activities are rows. Value of each element in the data tidy data frame is
is the average value of all observations of the   
corresponding variable for the corresponding subject and activity.  

 
TABLE. The names of the variables were changed according to this table:
"featureIndex"		"oldName"		"newName"
1		"tBodyAcc-mean()-X"		"timebodyaccelerationmeanx"
2		"tBodyAcc-mean()-Y"		"timebodyaccelerationmeany"
3		"tBodyAcc-mean()-Z"		"timebodyaccelerationmeanz"
4		"tBodyAcc-std()-X"		"timebodyaccelerationstdx"
5		"tBodyAcc-std()-Y"		"timebodyaccelerationstdy"
6		"tBodyAcc-std()-Z"		"timebodyaccelerationstdz"
41		"tGravityAcc-mean()-X"		"timegravityaccelerationmeanx"
42		"tGravityAcc-mean()-Y"		"timegravityaccelerationmeany"
43		"tGravityAcc-mean()-Z"		"timegravityaccelerationmeanz"
44		"tGravityAcc-std()-X"		"timegravityaccelerationstdx"
45		"tGravityAcc-std()-Y"		"timegravityaccelerationstdy"
46		"tGravityAcc-std()-Z"		"timegravityaccelerationstdz"
81		"tBodyAccJerk-mean()-X"		"timebodyaccelerationjerkmeanx"
82		"tBodyAccJerk-mean()-Y"		"timebodyaccelerationjerkmeany"
83		"tBodyAccJerk-mean()-Z"		"timebodyaccelerationjerkmeanz"
84		"tBodyAccJerk-std()-X"		"timebodyaccelerationjerkstdx"
85		"tBodyAccJerk-std()-Y"		"timebodyaccelerationjerkstdy"
86		"tBodyAccJerk-std()-Z"		"timebodyaccelerationjerkstdz"
121		"tBodyGyro-mean()-X"		"timebodygyroscopemeanx"
122		"tBodyGyro-mean()-Y"		"timebodygyroscopemeany"
123		"tBodyGyro-mean()-Z"		"timebodygyroscopemeanz"
124		"tBodyGyro-std()-X"		"timebodygyroscopestdx"
125		"tBodyGyro-std()-Y"		"timebodygyroscopestdy"
126		"tBodyGyro-std()-Z"		"timebodygyroscopestdz"
161		"tBodyGyroJerk-mean()-X"		"timebodygyroscopejerkmeanx"
162		"tBodyGyroJerk-mean()-Y"		"timebodygyroscopejerkmeany"
163		"tBodyGyroJerk-mean()-Z"		"timebodygyroscopejerkmeanz"
164		"tBodyGyroJerk-std()-X"		"timebodygyroscopejerkstdx"
165		"tBodyGyroJerk-std()-Y"		"timebodygyroscopejerkstdy"
166		"tBodyGyroJerk-std()-Z"		"timebodygyroscopejerkstdz"
201		"tBodyAccMag-mean()"		"timebodyaccelerationmagnitudemean"
202		"tBodyAccMag-std()"		"timebodyaccelerationmagnitudestd"
214		"tGravityAccMag-mean()"		"timegravityaccelerationmagnitudemean"
215		"tGravityAccMag-std()"		"timegravityaccelerationmagnitudestd"
227		"tBodyAccJerkMag-mean()"		"timebodyaccelerationjerkmagnitudemean"
228		"tBodyAccJerkMag-std()"		"timebodyaccelerationjerkmagnitudestd"
240		"tBodyGyroMag-mean()"		"timebodygyroscopemagnitudemean"
241		"tBodyGyroMag-std()"		"timebodygyroscopemagnitudestd"
253		"tBodyGyroJerkMag-mean()"		"timebodygyroscopejerkmagnitudemean"
254		"tBodyGyroJerkMag-std()"		"timebodygyroscopejerkmagnitudestd"
266		"fBodyAcc-mean()-X"		"frequencybodyaccelerationmeanx"
267		"fBodyAcc-mean()-Y"		"frequencybodyaccelerationmeany"
268		"fBodyAcc-mean()-Z"		"frequencybodyaccelerationmeanz"
269		"fBodyAcc-std()-X"		"frequencybodyaccelerationstdx"
270		"fBodyAcc-std()-Y"		"frequencybodyaccelerationstdy"
271		"fBodyAcc-std()-Z"		"frequencybodyaccelerationstdz"
345		"fBodyAccJerk-mean()-X"		"frequencybodyaccelerationjerkmeanx"
346		"fBodyAccJerk-mean()-Y"		"frequencybodyaccelerationjerkmeany"
347		"fBodyAccJerk-mean()-Z"		"frequencybodyaccelerationjerkmeanz"
348		"fBodyAccJerk-std()-X"		"frequencybodyaccelerationjerkstdx"
349		"fBodyAccJerk-std()-Y"		"frequencybodyaccelerationjerkstdy"
350		"fBodyAccJerk-std()-Z"		"frequencybodyaccelerationjerkstdz"
424		"fBodyGyro-mean()-X"		"frequencybodygyroscopemeanx"
425		"fBodyGyro-mean()-Y"		"frequencybodygyroscopemeany"
426		"fBodyGyro-mean()-Z"		"frequencybodygyroscopemeanz"
427		"fBodyGyro-std()-X"		"frequencybodygyroscopestdx"
428		"fBodyGyro-std()-Y"		"frequencybodygyroscopestdy"
429		"fBodyGyro-std()-Z"		"frequencybodygyroscopestdz"
503		"fBodyAccMag-mean()"		"frequencybodyaccelerationmagnitudemean"
504		"fBodyAccMag-std()"		"frequencybodyaccelerationmagnitudestd"
516		"fBodyBodyAccJerkMag-mean()"		"frequencybodyaccelerationjerkmagnitudemean"
517		"fBodyBodyAccJerkMag-std()"		"frequencybodyaccelerationjerkmagnitudestd"
529		"fBodyBodyGyroMag-mean()"		"frequencybodygyroscopemagnitudemean"
530		"fBodyBodyGyroMag-std()"		"frequencybodygyroscopemagnitudestd"
542		"fBodyBodyGyroJerkMag-mean()"		"frequencybodygyroscopejerkmagnitudemean"
543		"fBodyBodyGyroJerkMag-std()"		"frequencybodygyroscopejerkmagnitudestd"


