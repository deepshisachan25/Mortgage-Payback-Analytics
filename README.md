# Mortgage-Payback-Analytics

## Introduction
The goal of this project is to find borrowers will default on their mortgage loans or not. This helps investors make smart choices about where to put their money to make the most profit. In the realm of mortgage analytics, understanding how borrowers behave and how loans perform is crucial for the banking industry and investors. This project contains 50,000 residential U.S. mortgage borrowers over 60 different time periods. Using this dataset, we can see patterns and trends in how mortgages work overtime. It’s important to know why people pay back their home loans on time, or why sometimes they don't. Using this project, it can be found why this happens. Using analytics to figure out what makes people pay back their home loans, and what might cause them to have trouble. By doing this, banks and investors can get benefitted and they can make smarter decisions about lending money to borrowers for homes and managing their risks.

## Business Goals
This project is for businesses who lead in banking or financial institution. 

•	The goal of this project is to find out whether loan borrowers will pay back their mortgage loans or not. This helps investors make smart choices about where to put their money to make the most profit.

•	The business seeks to identify if borrowers are defaulting on their loans, then at what time of the loan length (i.e., at what time percentage of their loan period) they are defaulting i.e., in the early stage or later stage of the loan lifecycle. Financial institutions, by identifying early-stage defaulters, can take proactive measures to mitigate or reduce the risk. In this way, business can find good and bad borrowers and make strategies.

•	Identify different combinations of borrowers’ financial features and find what factors determine if a customer will default or pay off the loan. This helps investors make smart choices about where to put their money to make the most profit and what factors lead borrowers to default on loan.
By achieving these business goals, the banking organization can enhance its competitiveness in the mortgage market, improve risk management practices, and ultimately, increase profitability and stakeholder value.

## Analytical Approach
To analyze a comprehensive dataset of residential U.S. mortgage borrowers over time predictor analysis and relevancy will be done. Factors such as credit scores (FICO), balance remaining at origin time, employment history, and loan-to-value ratios, etc. can play a significant role in predicting defaults or paid off borrower. To develop predictive models that can accurately forecast borrowers mortgage payback outcomes, with a specific focus on default and payoff observations. Using predictive models, we will find what factors or predictors make borrowers pay back their home loans, and regression will help business find out at what time of the loan time customer default on loan so that business can identify good customers which will be payoff customers, defaulting in later stage customers. 

•	To develop classification models for classifying the likelihood of borrowers paying off their mortgages. Model will forecast whether borrowers will pay off their mortgages (1) or not (0). Status time will be an outcome variable (it contains default (1), payoff (2) & non-default/non-payoff (0)) and will filter out our dataset into active and non-active customers. Non-Active customers are those who defaulted and pay-off their loan and Active customers are those who did not default/non-pay off which tells they are still active and will pay or maybe default in future. For performing analytics, only non-active customers’ record will be taken and will be trained on it. 

•	Regression model will find at what time of the loan lifecycle will customer default on loan (which is time percentage) that is calculated from time at observation and loan lifecycle. From this bank and financial institution can identify customer will default in early stage (low time percentage will be denote early-stage defaulter) or later stage and can take proactive actions.

•	The business goal for implementing a clustering model in mortgage analytics revolves around identifying distinct groups of borrowers based on their financial features and understanding the factors that contribute to defaulting on loans or paying off the loan. To perform analytics, will utilize K-means clustering to segment borrowers into distinct groups based on their financial characteristics. Clustering analysis will help identify homogeneous groups of borrowers who share similar attributes and find what factors lead borrowers to default on loan so that business can identify those types of customer and make decision.
Models will be trained on non-active customers record which are (Default (1) or Payoff (2)) and will later predict whether active customer will default on loans or not and if defaulted then at what time of their loan period i.e. in early stage or later stage of their loan lifecycle.

## DATA PREPROCESSING
This dataset contains 62,2490 records and 23 variables. In this dataset, there are records of 50,000 borrowers. 
Attributes definition:
1.	Id: Borrower ID, which is a unique identifier, assigned to each borrower. It distinguishes individual borrowers within the dataset.
2.	time: Timestamp of Observation which means the exact time (in months) when the specific observation was recorded. It provides a chronological reference for the data associated with the borrower.
3.	orig_time: Timestamp for Loan Origination which tells the time when the loan was initially issued. It marks the beginning of the loan lifecycle.
4.	first-time: Timestamp for the First Observation tells the earliest recorded timestamp for any observation related to the borrower. It may coincide with the loan origination time or precede it.
5.	mat_time: Timestamp for Loan Maturity is the time when the loan is scheduled to mature or be fully paid off. It represents the end of the loan term.
6.	balance_time: This variable tells the outstanding Balance at observation time which is the remaining principal balance on the loan at the specific observation timestamp. It reflects the amount still owed by the borrower.
7.	LTV_time: Loan-to-Value Ratio at Observation Time- The ratio of the outstanding loan balance to the appraised value of the collateral (usually a property). It assesses the risk associated with the loan.
8.	interest_rate_time: Interest Rate at Observation Time tells the annual interest rate charged on the loan at the specific observation timestamp. 
9.	hpi_time: House Price Index at Observation Time- It is a measure of changes in property prices in the market where the collateral property is located. It may affect the loan’s risk and value.
10.	gdp_time: GDP Growth at Observation Time- The rate of economic growth in the borrower’s region or country. It can impact loan performance and borrower financial stability.
11.	uer_time: Unemployment Rate at Observation Time is the percentage of unemployed individuals in the borrower’s region or country. It influences the borrower’s ability to repay the loan.
12.	REtype_CO_orig_time: Real estate type condominium at origination time. This indicates the type of property used as collateral for the loan at origination. Real estate type condominium = 1, otherwise= 0.
13.	REtype_PU_orig_time: Real estate type planned urban development at origination time. Real estate type planned urban development = 1, otherwise = 0.
14.	REtype_SF_orig_time: Single-family home at origination time. Single-family home = 1, otherwise = 0.
15.	investor_orig_time: Investor Borrower at Origination Time: It is a binary indicator (1 or 0) representing whether the borrower is an investor (purchasing the property for investment purposes) at loan origination.
16.	balance_orig_time: Outstanding balance at origination time.
17.	FICO_orig_time: It is the borrower’s credit score at the time of loan origination. It reflects their creditworthiness and ability to manage debt. The overall FICO score range is between 300 and 850. In general, scores in the 670 to 739 range indicate “good” credit history, and most lenders will consider this score favorable.
18.	LTV_orig_time: Loan-to-value ratio at origination time
19.	Interest_Rate_orig_time: Interest rate at origination time
20.	hpi_orig_time: House price index at origination time
21.	default_time: It is a binary indicator (1 or 0) representing whether the borrower defaulted on the loan at the specific observation timestamp. Will be 1 if loan is defaulted, otherwise Zero. This will be the target variable for classification model. 
22.	payoff_time: A binary indicator (1 or 0) representing whether the borrower paid off the loan at the specific observation timestamp. Will be 1 if loan is paid off, otherwise Zero.
23.	status_time: It is a categorical variable indicating the loan status at the specific observation timestamp (e.g., default (1), payoff (2), or non-default/non-payoff (0)).


## Data Exploration

Checking missing values
It was found that there were 270 missing values in LTV_time column. Using KNN imputation method, handled missing values were handled. KNN imputation estimates missing values based on the characteristics of neighboring data points. It will consider multiple variables of our dataset and leverage the concept of nearest neighbors. By examining the values of nearby instances, KNN imputation provides a robust way to fill in missing data.
After filling in the missing data, the summary statistics were checked which shows the mean, median, range of each variable in mortgage dataset. The summary statistics provide the information like at what original time was loan issued, what is the maturity time of the loans which on an average is 142 days, varibles like interest_rate_orig_time tells the interest rate charegd on borower in starting was on an average of 5.65 and median was 6.29 which means that most of the borower have paid 6.29 interest rate and many did not have any interest rate at origination. Variables like default_time tells that borrower have defaulted or not which is a binary variable and seeing at the minimum, mean, and maximum we can interpret that not many loan borower defaulted on loan. 
![image](https://github.com/user-attachments/assets/8cbf8b61-b957-495a-86b4-410a28f75dab)
![image](https://github.com/user-attachments/assets/9b340e10-0a8e-4ecf-bb2a-c20e8c66d70f)

![image](https://github.com/user-attachments/assets/e7a11051-a75f-4027-a4cf-d840d9532d29)
Time variable histogram indicates the time at which borrower a right-skewed distribution with a peak around time 30. This tells the time at which specific observation was recorded. This is the time when loan borrower time was recorded. Most of the customers’ time was recorded starting from 20 to 40 time period.
![image](https://github.com/user-attachments/assets/845ebd26-271e-45d9-afe2-71bd81a75e6f)
This distribution shows Origin time variable tells the time when the loan was initially issued, it can be same as first time or before the first date as loan can be transferred to another banking institution for securitization purpose. orig_time before 0 means many customer loans were started before the observation time. 

![image](https://github.com/user-attachments/assets/d77c542e-26d7-427d-8f59-16794f9d51ca)
This distribution shows first_time of observation from 0 to 60 months. This variable is updated in reference to orig_time so that all borrowers are in same scale as a current time of observation (for customer whose loan was started before the first time) by subtracting first time with origination time.
![image](https://github.com/user-attachments/assets/5c333458-5147-4e74-910d-ff6c2a92964f)
This distribution tells at what time will customer loan lifecycle will mature. After adjusting loan lifecycle by subtracting maturity time from orig_time got the actual length of the loan period. Plot shows many loan borrowers loan lifecycle is about 110 to 125 months.
![image](https://github.com/user-attachments/assets/9e8f32c2-bca0-4753-8982-d7208d9c7fac)
This variable tells the GDP growth rate in the borrower’s region or country at the time of observation. Here, it is found that gdp growth rate is maximum between 1 to 3%.
![image](https://github.com/user-attachments/assets/47f80626-2c7f-49b5-9685-71d54394f0fd)
This variable shows the ratio of loan to the value of property at the time of observation. In our dataset, the LTV ratio is between 0 to 150 and maximum at 100.
![image](https://github.com/user-attachments/assets/a414f59a-1bf6-4b51-881d-03524850e6e7)
This variable tells the annual interest rate charged on property at the time of observation. Here distribution shows the maximum annual interest rate charged on borrower is around 6 to 8.
![image](https://github.com/user-attachments/assets/4733cba8-7f6c-451f-82ca-7468c8bc4f46)
This variable tells the house price index at the observation time which tells the changes in property prices in the market where the property is located. It may affect the loan’s risk and value. Here, in our dataset house price index is between 150 to 220.
![image](https://github.com/user-attachments/assets/bc5a1a20-3e77-4a2c-a1e4-69ef5f8a3eee)
This tells that LTV ratio at origin time was between 50 to 100 for all the borrowers in our dataset. A lower LTV ratio is better in the eyes of lenders because it means the borrower has more equity in the property and the loan is less risky.
![image](https://github.com/user-attachments/assets/f1d0c373-795a-414b-b3e2-82dd10b12be4)
This plot of FICO_orig_time displays the distribution of borrowers’ credit scores. Most borrowers’ credit scores fall within a specific range of 450 to 800, which can provide valuable information for lenders and investors. A credit score in the range of 670 to 739 indicates good credit history and we have much data of borrowers who have good credit scores. Businesses can make decisions on lending loans to customers by reviewing their credit scores.
![image](https://github.com/user-attachments/assets/d06d66f2-f42a-4f25-a3f2-3f38023ac605)
This plot shows the unemployment rate during the observation time which tells the unemployed individual in particular region or country during the time of loan observation. The plot shows that the unemployment rate at observation time was between 4 to 10.
![image](https://github.com/user-attachments/assets/c17b4bd5-cab3-4f47-9e45-203818b8df02)
This plot shows the balance that borrower has during the origination time. It was seen that most of the loan borrowers’ balance during the origination time was between 0 to 100000.
![image](https://github.com/user-attachments/assets/2d425da7-04b5-4857-a351-2b6f3022bee0)
This plot of investor_orig_time shows whether the borrower is purchasing the property for investment purposes (1) or not (0). Seeing the plot, we can say that most of the mortgage borrowers are not using it for investment purposes.
![image](https://github.com/user-attachments/assets/a8d60c20-30a3-4a91-8e9a-3a258412ce4e)
This variable tells whether borrower paid off the loan on time or not. The above distribution shows that many borrowers did not pay off the loan on time and very few paid off the loan on time (1).
![image](https://github.com/user-attachments/assets/dd9959c2-8de9-4615-a8d5-11d1b55db47d)
This shows whether the borrower defaulted on the house loan or not. Seeing the graph, we can tell in our data very few borrowers defaulted on the loan (1) when compared with the borrower who did not default = 0.
This variable indicates the loan status at the specific observation timestamp (e.g., default, payoff, or non-default/non-payoff). Here 1 status_time shows default, 2 is payoff and 0 is non-default and non-paid off. We can see many data is of non-default and non-paid off and very few data are of defaulting a loan and very few borrowers paid off the loan on time.
![image](https://github.com/user-attachments/assets/b3ea872a-4c4e-4ab0-95ab-4f128da5fd78)

## PREDICTOR ANALYSIS AND RELEVANCY 

### Correlation Matrix
![image](https://github.com/user-attachments/assets/1ad5ed9c-473b-4001-b175-89300079309d)
•	Seeing the correlation plot we can tell, house price index at original time is highly correlated with original time. Which means at original time of observation the value of house price may remain high.
•	LTV_time is highly correlated with hpi_originated_time which means house price index at original time of offering the loan is directly related with Loan to value ratio which suggests that house price will typically remain high.
•	Variables like uer_time are negatively correlated with hpi_time which tells that at house price index at observation time will increase if unemployment rate is low.
•	Maturity_time and hpi_original time are positively correlated which tells that longer the loan maturity period, the house price index might remain high.
•	Payoff_time and status_time are correlated which is obvious because status_time is derived from payoff_time and default_time.
There is no multicollinearity between our variables except status_time, and payoff_time. Status_time variable is derived from default_time and payoff_time which will be removed during model building because both the variables serve the same purpose. 

![image](https://github.com/user-attachments/assets/ad423f5d-a143-4363-9651-d3c26644a93e)
This plot shows that customers will pay off their loan when balance at observation time is low and will default or non-payoff if balance is higher than 6000000.
![image](https://github.com/user-attachments/assets/3c8039e6-60b3-4ff4-9ac5-89bb6d98a7f3)
This plot shows with less LTV_original_time the chances of customer getting default (1) is higher whereas higher Loan to value ratio at original time will lead to borrower paying off the loan or non-payoff and non-default which means customers will payoff soon or will default.
![image](https://github.com/user-attachments/assets/3205145b-8db4-404e-9ebb-f31f97be1954)
This plot shows that the customer will pay off loan when house property is not Real estate type condominium (0), and many are non-payoff / non-default customers which are active customers and comparatively less customer will default when property is not condominium.
![image](https://github.com/user-attachments/assets/da41bb69-039f-4bf9-8c47-f1ea7c2df5ad)
This shows that that the customer will pay off loan when house property is not Real estate type planned urban development (0) and many are payoff / default customers and few non-payoff/non-defaults which are active customers and comparatively less customer will default when property is not planned urban development. The data for property type-planned urban development is comparatively less and has almost same ratio for customer going default and paying off the loan with respect to planned urban development as 0.
![image](https://github.com/user-attachments/assets/16ca31d2-6261-44f9-b0a8-545f6f48a599)
This plot shows that the customer will pay off loan when house property is for single family (1) when compared to not a single-family property and comparatively less customer will default when property is single-family and not a single-family real estate type. The data for property type is single-family real estate type is comparatively higher than non-single-family type.   
![image](https://github.com/user-attachments/assets/4d0125e0-4729-4331-a97d-c6a9f9f96752)
This plot shows that home loans are taken by customers who planned to purchase the property for investment purposes. Here in our dataset, there is less records for investment purpose property and comparatively less borrower will default when property is not for investment purposes whereas when property is for investment purpose loan borrower will likely to pay off the loan and few customers will default on loan.

## DIMENSION REDUCTION
Dimension Reduction is done to preserve the most important information in the data while reducing its dimensionality. We have used the Principal Component Analysis and Boruta features selection method, and it was found all variables are important in our dataset and no variable deemed unimportant. So, for this mortgage dataset according to Boruta feature selection, dimension reduction is not required.
Tried Boruta feature selection and it showed all the variables are important and dimension reduction is not required. 
PCA shows the proportion of total variance explained by each principal component. The cumulative proportion value shows how much variance is explained by including a certain number of principal components. 
![image](https://github.com/user-attachments/assets/12951ea0-827b-4a55-8027-04ea29e0450f)

![image](https://github.com/user-attachments/assets/2e16f3dc-d33d-4503-82aa-165954890adc)
Generally, researchers often choose a subset of principal components that capture most of the variance (e.g., 95% or more) which is here up to PC15. To see those features, we get these variables:
![image](https://github.com/user-attachments/assets/ab46f3a3-d8b1-427d-b3d2-393b3fc3554f)

## DATA PREPARATION
For performing analytics will update columns like time, and mat_time with reference to origin time. Here, Maturity time “mat_time” column denotes the lifecycle or length of the loan from the time of origin of the loan. To update the mat_time, will subtract the mat_time with origin time which is in reference to origin time. Will also update the “time” by subtracting time with original time which will be the time of observations. 
After updating time and mat_time(loan lifecycle), orig_time column will be removed from the dataset.
![image](https://github.com/user-attachments/assets/248ecd1d-b9ec-4c80-a2ed-e97f0171679e)
To optimize data for analytics, the whole dataset will be aggregated by customer id using each borrower last records because that contains maximum information of customer which shows whether that customer will default or payback their loan.
The "status_time" column will be filtered into two categories as: active and non-active customers. Active customers are those nondefault/nonpayoff (Class 0 of status_time) who neither defaulted nor paid off the loan till now, indicating they are current customers likely to repay their loans soon, or may default at some point in time, though this remains uncertain. 
![image](https://github.com/user-attachments/assets/37ad3039-ec93-4f29-83dc-0ff16298bfa6)
Created new variable as time percent in non-active customers dataset that will show the customer defaulting or paying off the loan at what time of their loan lifecycle. Then will remove the borrowers’ id before data partition and will normalize the data so that all variables come in same scale.
![image](https://github.com/user-attachments/assets/06d018ff-148e-4ef5-b5c7-8389dc71f6c3)
This plot shows the time percentage of non-active customers (i.e., defaulted or loan pay off customers) and shows most of the customer paid off or defaulted on their loan in between 0 to 35%. Using this variable, it can also be found which customers defaulted in early stage or later stage based on the time percentage value and can multiply this percentage with loan lifecycle.
For analytics purposes, the focus will be on non-active customers, allowing the model to learn trends or patterns among these borrowers and forecast whether future borrowers will default or not. The ultimate business goal is to identify customers who pay off their mortgage loans and or will default and will find at what time of the loan lifecycle those customers will default i.e., in early stage or later stage so that business can make decisions on lending money to pay off customer and those borrowers who default in later stage. 
![image](https://github.com/user-attachments/assets/e4d45d66-f6d5-4b7b-9362-0fc8c66e0ac7)

This plot shows that there are less customers who defaulted on loan in our dataset compared to payoff customers.

## DATA PARTITION
For data partitioning, only non-active customers (i.e., customers who defaulted and paid off the loan) records will be taken which will be divided into training, validation and holdout set in the ratio of 60:20:20. Models will be trained in non-active customers (i.e., customers who defaulted and paid off the loan) to analyze patterns and trends from historical data of borrowers who did and did not successfully pay off their loans. Validation set will be used to test the performance of model on validation set and choose the best performing classifier and regression model out of all. Then will evaluate the chosen model performance on holdout dataset.
For classification will use whole non-active customers data for partitioning to predict whether customer will pay off their loan or not. For regression will choose the subset of customer who defaulted on loan from training, validation, and test dataset to predict at what time percentage of the loan period will customer default. 

## CLASSIFIER SELECTION MODEL
To develop classification models for classifying whether borrowers will pay off their mortgages
(1) or not (0) the classifier will categorize borrowers into two classes: those who pay off their
mortgages (class 1) and those who do not (class 0). Classification Model will be trained on
selected non-active customers to analyze patterns and trends from historical data of borrower. Using this data to understand factors associated with borrower paying off the loan and will predict new borrowers will default on loan or will pay off. For classification model, we will identify the customer who pays off their home loans Status_time = Payoff_time is the important class. Using this classification model, business will identify trustable customers (payoff) and high-risk default customers.
Model for classification will be-
•	Logistic Regression model
•	Classification Tree
•	Random Forest

### Logistic Regression Model
Using the logistic regression model, a classifier model will be built to classify whether a customer will pay off the loan or will default. Positive coefficient on predictors is associated with a higher probability of customer paying off the loan.
The logistic model performance was checked on validation dataset, and it gave an accuracy of 77.84% and found that model gave a sensitivity of 0.8721 which means model is able to accurately identify customers who will pay off their mortgage loan.  
Goal: This model was built to classify borrowers who will pay off the loan or will default. From the model above, we can identify the significant variables of this model. It will predict the default and payoff probability of a customer and based on threshold value which is 0.5 will classify whether each borrower will pay off the loan or not. Based on this classification, will suggest businesspeople to target those customers with higher predicted probability of paying off the loan so that business can make decisions on lending loan to trustable borrowers who will not default.

### DECISION TREE
A decision tree is one of the most powerful tools of supervised learning algorithms used for both classification and regression tasks. Using decision trees, we can predict whether a customer will default on a mortgage loan or not. 
Goal: Using Classification tree, it can be found the important predictors of this model which can classify new customers will pay off the loan or not using classification tree. Important variables were LTV_time, time, hpi_time. Based on important features of this model, those borrowers/customers can be classified based on the classification rule. For example, customers whose Loan to value ratio is less than 88, will pay off the loan and customer with LTC_time greater than equal to 88 and hpi_orig_time was less than 215 are more likely to default on the loan.
![image](https://github.com/user-attachments/assets/06932ec4-cd74-4a00-8132-fe62fbe6fafd)
The model gave an accuracy of 77.26% with a sensitivity of 0.8353 which tells model can accurately predict important class i.e., payoff customers with 83.53% on validation dataset. 

### RANDOM FOREST
To build random forest model, will train the model on training dataset and will check its performance on validation dataset. The goal of using a Random Forest model in mortgage payoff analytics is to predict whether a loan borrower will default on the mortgage loan or will pay off. An important class is Payoff because it is important to identify which customer will pay off their loan.
Goal: The plot below of Random Forest tells the important variables that play major roles in the model. Variables are LTV_time, FICO_orig_time, time, hpi_orig_time, balance_time, balance_orig_time, interest_rate_time and gdp_time. But it does not show how that variable is having an impact on the model (positive or negative). Using these features, we can improve our model performance by only keeping important variables in our model.
![image](https://github.com/user-attachments/assets/243abbd8-de9d-4cd2-b4cc-f9d4cc4b011c)
The performance of the model will be checked on validation dataset and out of all the classifiers model will choose best performing model to check its performance on holdout data i.e. new, unseen data.
Out of all classifier models, random forest model performed better on classifying payoff or default customer so will choose this model to classify customer as defaulter or not on new, unseen data (holdout data).

## REGRESSION MODEL
Using the regression model, will be predicting the time at which a customer defaults on a mortgage loan which tells the time percentage of the entire loan lifecycle, where the target variable in regression model will be the time percentage (timepercent) at which the default occurs. Business can identify early-stage defaulters or later stage defaulters from time percentage variables (that will tell low time percentage are early-stage default customers). Using this information, business can make lending decisions and can mitigate upcoming risk. Business will not face huge loss with customer who will default in later-stage and can take risk on lending loan. Financial institutions can work with early-stage defaulters to restructure their loan terms in a way that makes repayment more manageable. This could involve extending the loan term, reducing the interest rate, or deferment programs. 
Time percent will be the outcome variable. 
Model performance was evaluated using RMSE and Mean absolute error (MAE). The linear model gave MAE error of 3.2638 and RMSE of 4.9883. Then will compare Mean absolute error with other regression models. The linear model predicted the time at which customer will default on validation set and gave correlation of 79.911% between actual validation value and predicted value.

### STEPWISE BACKWARD MODEL
Stepwise backward model uses a subset of variables using backward selection method. It uses only important variables for the analysis.
Stepwise backward regression model gave almost the same error on validation set like linear regression model.

### Regression Tree model
Regression tree is a type of decision tree which will predict the time at which customer will default on loan based on time percentage and can identify whether they are defaulting in early stage or later stage by looking into percentage. We can identify the most important features for predicting time percentage while defaulting on loans. By examining the splits in the tree and the corresponding feature important scores, we can gain insights into which features are most influential in determining the defaulting on loans in the early or later stage. 

![image](https://github.com/user-attachments/assets/8176c0fc-9ecb-4595-bed7-eebdcb41ebe8)
The Regression Tree model gave an error of 2.5464 which is comparatively lower than linear regression model which means regression tree model is performing better on predicting percentage time when customers default on loan. 
To evaluate its performance on holdout set, will use test_default dataset which was a subset of non-active holdout dataset where customer defaulted.

## MODEL PERFORMANCE
#### Validation Accuracy
Model performance will be evaluated on validation dataset for both classification and regression model. Based on the classification models which have classified customers as defaulters or will pay off the loan. 
![image](https://github.com/user-attachments/assets/8205a5e2-31ae-42fb-b6b2-d41007181c1c)
Decision: Seeing the performance of the model, we can tell the random forest model is working good in classifying loan borrowers as defaulter or not a defaulter with highest accuracy. So will choose random forest model to predict future customers or active customers in our dataset to classify them as defaulters or pay off customers. Random forest model also tells the important variable of the model that impact the outcome variables. 
For Regression model, only default customers were chosen to predict at what time they will default on loan. Outcome Variable is Time Percent which tells at what percentage of loan time customer defaulted.
Decision: Here, we can see that regression tree models show a low error which means it can give correct prediction of time at which customer defaulted on loan. 
#### Holdout Accuracy of Selected Models
As we have already checked model performance on validation dataset for both classification and regression model for classifying customer will pay off the loan or not and predicting at what time borrowers will default on loan. The selected model performance on holdout set is:
![image](https://github.com/user-attachments/assets/c234e59b-ef06-4f6e-b3a4-4571af3d0f09)
![image](https://github.com/user-attachments/assets/1a5456cd-2901-4463-8448-d9971e3fb506)

It was found random forest and regression tree model also performed better on holdout dataset. 
With the help of random forest model, we can also predict active customers in our data that they will default on loan or not and if defaulted then at what time percentage they will default.
Using time percentage, we can find exact time when customer will default in their loan lifecycle.
 
Comparison chart shows that model is almost predicting accurate time when customer will default on their loan.
![image](https://github.com/user-attachments/assets/92e869e6-7d6c-43d2-862e-34559a80c1ca)
This plot shows most of the loan borrowers in the holdout set are defaulting in the early stage.
![image](https://github.com/user-attachments/assets/bc2a4853-3b5d-48ed-86e6-7e684e6b52f6)
         
When a random forest model was run on active customer dataset, it was predicted that approx. 80% of customers will pay off the loan and only 1071 customers will default on loan. Using this information and from clustering k-means method business can find the factors that lead customer on defaulting on loan.

## UNSUPERVISED LEARNING ALGORITHM 
### K-Means Clustering
Clustering can aid in customer segmentation within the mortgage market. By grouping borrowers with similar characteristics or needs, lenders can tailor their marketing strategies and product offerings to different segments.
Utilizing the k-means algorithm, business aims to segment borrowers based on their financial attributes and loan behavior, thereby facilitating the identification of distinct borrower groups with similar repayment patterns. Such segmentation enables lenders to tailor their strategies and services to the specific needs of each borrower segment. Various factors like as Loan-to-Value ratio (LTV_time), borrower's credit score at loan origination (FICO_orig_time), outstanding balance on the loan (balance_time), loan payoff status (payoff_time), house price index (hpi_index), interest rate at observation time (interest_rate_time), loan maturity timestamp (mat_time), etc. 
Both active and non-active customers’ data will be utilized in the clustering method to ensure comprehensive representation across borrower groups. To determine the optimal number of clusters, we will employ the Elbow-curve method, this will help us find the best number of groups for our analysis. 
 ![image](https://github.com/user-attachments/assets/64d4bb5a-e792-4366-8be7-2d7db9a82607)
The Elbow curve helps determine the optimal number of clusters for a given dataset. Taking k=4 as a cutoff point which means there will be 4 number of clusters. 
When choosing k=4 from the elbow curve chart we found the avg silhouette width as 0.26 and size of the cluster as follow:
![image](https://github.com/user-attachments/assets/2fabbdd7-9eba-431d-ab4a-c8c94c3383fd)
##### Performing clustering-
-	To determine what are the different combinations of customer financial features that will segment them into categories of defaulter, or payoff.
![image](https://github.com/user-attachments/assets/4e5f53f9-a85b-4f62-b706-2e9defc9fd89)
![image](https://github.com/user-attachments/assets/4db66839-17f2-4304-9854-9842348fb70d)
![image](https://github.com/user-attachments/assets/6abafab1-5b7c-4912-8683-024946471001)
Above clustering plot shows 4 clusters:
•	Cluster 1 contains those loan borrowers who defaulted on loan. These customers defaulted in the early stage as time was low, length of the loan (lifecycle) was high, Low gdp_time which tells that if gdp will be low then there is a high chance that customer may default on loan, high house price index at origin is linked with chances of customer getting default.
•	Cluster 2 does not provide any significant information.
•	Cluster 3 contains those loan borrowers who might pay off the loan and will not default. These customers’ loan length (lifecycle) was very low, Loan to value ratio is low, interest rate at origin time was high, and low house price index at origin time, low balance at origin time.
•	Cluster 4 contains those loan borrowers who will pay off the loan. These customers’ gdp_time was high which tells that if country gdp is better, then customer will pay off the loan. The unemployment rate was low, length of the loan (lifecycle) was high, interest rate at origin time was low, house price index at origin was low.
Overall, this process will give lenders valuable insights into their borrowers' behaviors and help them make better decisions about lending the mortgage loan.

##### Further performing clustering on customers who defaulted on loan to better understand “what factors lead them to default in loan.”
Performing further k-means clustering on only default customers data to find what combination of factors lead customers to default on loan.
To find the best number of k-means cluster, elbow method was used and got k=5 cluster.
![image](https://github.com/user-attachments/assets/da2a3109-f306-43e6-a9f7-9cf8d8916713)
Below are the centers of each cluster.
 ![image](https://github.com/user-attachments/assets/19558f57-8236-4f1b-a5b6-4405c8227aaa)

 ![image](https://github.com/user-attachments/assets/da0f9c96-dd75-43c0-84d1-4273cfb2bab8)

Cases when customer can default, when:
-	Cluster 1 tells those customers whose balance loan at origin is high and unemployment rate is little higher while GDP is low then a customer can default.
-	Cluster 2 tells if unemployment rate is high and GDP is low, and if customer is using this property for investment purpose, then customer can default on loan. 
-	Cluster 3 shows that even though GDP is high, and balance is low but if fico score of the loan borrower is low and house price index is low then customers might default on loan as the overall credit score is low and price of the house is not high in the market.
-	Cluster 4 shows that when interest rates at origin is high even though if GDP is high, chances of customer defaulting on loan will rise.
-	Cluster 5 shows if LTV at origin is high which suggests that customer has less equity that means loan is risky.

## CONCLUSION
The goal of this project is to identify customers who will pay off their mortgage loans successfully. Also to understand the factor that leads borrowers to default on their mortgages and at what time percentage (can define it as early or later stage) they default on loan. By identifying these risk factors, banks and investors can make informed lending decisions and reduce their exposure to potential losses. Advanced analytics can help identify patterns and trends related to default risk. Using machine learning models, it can be classified whether borrowers will pay off their mortgages or not. This information will help investors allocate their funds strategically to maximize their profits. Using KNN imputation the missing value were handled and found there were some multicollinearities between our variables like status_time, default_time and payoff_time which was removed during data preparation. Using PCA and boruta feature selection method it was found dimension reduction is not required in this dataset. New variables were created like loan_length(length of the loan), time percentage (at what time customers default or pay off the loan based on the length of the loan). Data preparation was done for the purpose of data analytics, variables like time, and maturity_time were updated to set the time from origination time for easy analysis. All the records of borrowers were aggregated and data from status_time column was filtered out based on active(non-payoff/non-default) and non-active customer (default and payoff). For modelling purposes, the non-active customers data was used so that the model learns trends and patterns from past customers who defaulted or paid off their loan. Dataset is partitioned into training, validation, and test dataset in the ratio of 60:20:20. The training, validation and test data was filtered out from non-active customers’ training, validation and holdout set by keeping only default customers to perform regression analytics to predict at what time percentage customers are defaulting. This will help business in identifying early and later stage default customers so that they can take action on lending loan and can reduce or mitigate their risk.
Status_time is used as the outcome variable in classification model and payoff time is used as a positive class because business wants to identify customer who will pay the loan for the purpose of lending loan decision and regression model was built to identify at what time customers will default on loan i.e. early stage of the loan lifecycle or later. After model building, the performance of the model was evaluated on validation set and chose the best performing model and checked its performance on holdout dataset. Using this predictive modeling it can be found which combination of factors affect the borrowers pay off their loan. 
Performed k-means clustering to identify distinct groups of borrowers based on their financial features and their loan payment behavior to understand the factors that contribute to defaulting on loans. First ran unsupervised learning algorithms on the complete dataset of 50000 customers. It provided contributing factors for a person to be able to pay off the loan or default. This provided insights into ways that smaller loans might have a higher chance of getting paid off. Built another unsupervised model that was focused on people who defaulted. This has given us insights into factors that could contribute to default e.g.-
-	High loan at origin, high unemployment with low GDP 
-	High GDP, low balance with low fico score
-	High interest rates at origin with high GDP is high.
Understanding these factors can help a bank make better decisions on what kind of customers might be at risk of defaulting on a loan.
This information will give lenders valuable insights into their borrowers' behaviors and help them make better decisions about lending the loan.







