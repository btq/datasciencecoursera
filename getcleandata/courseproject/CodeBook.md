# Code Book

The 'run_analysis.R' reads the UCI HAR Dataset and writes output to 'tidy_dataset.txt' 

The UCI HAR Dataset can be found at:

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Source
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws 

##Reference
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

##Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Attribute Information:
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

To make the data tidy, the feature names were made lowercase and extraneous spaces, parenthesis, and dashes were removed, and 'Acc' was renamed as 'acceleration' to be more clear about its meaning.  Mean features are prefixed with 'mean_'.

The following is a descrption of each column in the tidy_dataset.txt data set:

<table>
    <tr>
        <th>Field #</th>
        <th>Name</th>
        <th>Data Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>1</td>
        <td>subject</td>
        <td>categorical</td>
        <td>subject ID who carried out the experiment.</td>
    </tr>
    <tr>
        <td>2</td>
        <td>activity</td>
        <td>categorical</td>
        <td>Activity name (one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).</td>
    </tr>
    <tr>
        <td>3</td>
        <td>mean_tbodyaccelerationmeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Mean X values.</td>
    </tr>
    <tr>
        <td>4</td>
        <td>mean_tbodyaccelerationstdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Standard Deviation X values.</td>
    </tr>

    <tr>
        <td>5</td>
        <td>mean_tbodyaccelerationmeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Mean Y values.</td>
    </tr>
    <tr>
        <td>6</td>
        <td>mean_tbodyaccelerationstdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>7</td>
        <td>mean_tbodyaccelerationmeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Mean Z values.</td>
    </tr>
    <tr>
        <td>8</td>
        <td>mean_tbodyaccelerationstdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>9</td>
        <td>mean_tgravityaccelerationmeanx</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Mean X values.</td>
    </tr>
    <tr>
        <td>10</td>
        <td>mean_tgravityaccelerationstdx</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>11</td>
        <td>mean_tgravityaccelerationmeany</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Mean Y values.</td>
    </tr>
    <tr>
        <td>12</td>
        <td>mean_tgravityaccelerationstdy</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>13</td>
        <td>mean_tgravityaccelerationmeanz</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Mean Z values.</td>
    </tr>
    <tr>
        <td>14</td>
        <td>mean_tgravityaccelerationstdz</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>15</td>
        <td>mean_tbodyaccelerationjerkmeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Mean X values.</td>
    </tr>
    <tr>
        <td>16</td>
        <td>mean_tbodyaccelerationjerkstdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>17</td>
        <td>mean_tbodyaccelerationjerkmeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Mean Y values.</td>
    </tr>
    <tr>
        <td>18</td>
        <td>mean_tbodyaccelerationjerkstdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>19</td>
        <td>mean_tbodyaccelerationjerkmeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Mean Z values.</td>
    </tr>
    <tr>
        <td>20</td>
        <td>mean_tbodyaccelerationjerkstdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>21</td>
        <td>mean_tbodygyromeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Mean X values.</td>
    </tr>
    <tr>
        <td>22</td>
        <td>mean_tbodygyrostdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>23</td>
        <td>mean_tbodygyromeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Mean Y values.</td>
    </tr>
    <tr>
        <td>24</td>
        <td>mean_tbodygyrostdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>25</td>
        <td>mean_tbodygyromeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Mean Z values.</td>
    </tr>
    <tr>
        <td>26</td>
        <td>mean_tbodygyrostdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>27</td>
        <td>mean_tbodygyrojerkmeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Mean X values.</td>
    </tr>
    <tr>
        <td>28</td>
        <td>mean_tbodygyrojerkstdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>29</td>
        <td>mean_tbodygyrojerkmeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Mean Y values.</td>
    </tr>
    <tr>
        <td>30</td>
        <td>mean_tbodygyrojerkstdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>31</td>
        <td>mean_tbodygyrojerkmeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Mean Z values.</td>
    </tr>
    <tr>
        <td>32</td>
        <td>mean_tbodygyrojerkstdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>33</td>
        <td>mean_tbodyaccelerationmagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccMag Mean values.</td>
    </tr>
    <tr>
        <td>34</td>
        <td>mean_tbodyaccelerationmagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccMag Standard Deviation values.</td>
    </tr>

    <tr>
        <td>35</td>
        <td>mean_tgravityaccelerationmagmean</td>
        <td>continuous</td>
        <td>Mean of the tGravityAccMag Mean values.</td>
    </tr>
    <tr>
        <td>36</td>
        <td>mean_tgravityaccelerationmagstd</td>
        <td>continuous</td>
        <td>Mean of the tGravityAccMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>37</td>
        <td>mean_tbodyaccelerationjerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerkMag Mean values.</td>
    </tr>
    <tr>
        <td>38</td>
        <td>mean_tbodyaccelerationjerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerkMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>39</td>
        <td>mean_tbodygyromagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroMag Mean values.</td>
    </tr>
    <tr>
        <td>40</td>
        <td>mean_tbodygyromagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>41</td>
        <td>mean_tbodygyrojerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerkMag Mean values.</td>
    </tr>
    <tr>
        <td>42</td>
        <td>mean_tbodygyrojerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerkMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>43</td>
        <td>mean_fbodyaccelerationmeanx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Mean X values.</td>
    </tr>
    <tr>
        <td>44</td>
        <td>mean_fbodyaccelerationstdx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>45</td>
        <td>mean_fbodyaccelerationmeany</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Mean Y values.</td>
    </tr>
    <tr>
        <td>46</td>
        <td>mean_fbodyaccelerationstdy</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>47</td>
        <td>mean_fbodyaccelerationmeanz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Mean Z values.</td>
    </tr>
    <tr>
        <td>48</td>
        <td>mean_fbodyaccelerationstdz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>49</td>
        <td>mean_fbodyaccelerationjerkmeanx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Mean X values.</td>
    </tr>
    <tr>
        <td>50</td>
        <td>mean_fbodyaccelerationjerkstdx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>51</td>
        <td>mean_fbodyaccelerationjerkmeany</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Mean Y values.</td>
    </tr>
    <tr>
        <td>52</td>
        <td>mean_fbodyaccelerationjerkstdy</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>53</td>
        <td>mean_fbodyaccelerationjerkmeanz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Mean Z values.</td>
    </tr>
    <tr>
        <td>54</td>
        <td>mean_fbodyaccelerationjerkstdz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>55</td>
        <td>mean_fbodygyromeanx</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Mean X values.</td>
    </tr>
    <tr>
        <td>56</td>
        <td>mean_fbodygyrostdx</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>57</td>
        <td>mean_fbodygyromeany</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Mean Y values.</td>
    </tr>
    <tr>
        <td>58</td>
        <td>mean_fbodygyrostdy</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>59</td>
        <td>mean_fbodygyromeanz</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Mean Y values.</td>
    </tr>
    <tr>
        <td>60</td>
        <td>mean_fbodygyrostdz</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>61</td>
        <td>mean_fbodyaccelerationmagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccMag Mean values.</td>
    </tr>
    <tr>
        <td>62</td>
        <td>mean_fbodyaccelerationmagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>63</td>
        <td>mean_fbodybodyaccelerationjerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyAccJerkMag Mean values.</td>
    </tr>
    <tr>
        <td>64</td>
        <td>mean_fbodybodyaccelerationjerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyAccJerkMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>65</td>
        <td>mean_fbodybodygyromagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Mean values.</td>
    </tr>
    <tr>
        <td>66</td>
        <td>mean_fbodybodygyromagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>67</td>
        <td>mean_fbodybodygyrojerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Mean values.</td>
    </tr>
    <tr>
        <td>68</td>
        <td>mean_fbodybodygyrojerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Standard Deviation values.</td>
    </tr>
</table>

There are 68 feature columns and 81 rows.
The first row is a header, then each subject/activity row

