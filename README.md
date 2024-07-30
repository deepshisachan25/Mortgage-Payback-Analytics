# Mortgage-Payback-Analytics
The goal of this project is to find borrowers will default on their mortgage loans or not. This helps investors make smart choices about where to put their money to make the most profit.
## Introduction
In the realm of mortgage analytics, understanding how borrowers behave and how loans perform is crucial for the banking industry and investors. This project contains 50,000 residential U.S. mortgage borrowers over 60 different time periods. Using this dataset, we can see patterns and trends in how mortgages work overtime. It’s important to know why people pay back their home loans on time, or why sometimes they don't. Using this project, it can be found why this happens. Using analytics to figure out what makes people pay back their home loans, and what might cause them to have trouble. By doing this, banks and investors can get benefitted and they can make smarter decisions about lending money to borrowers for homes and managing their risks.

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

[Mortgage payback analytics.docx](https://github.com/user-attachments/files/16430394/Mortgage.payback.analytics.docx)













