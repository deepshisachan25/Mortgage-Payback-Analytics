##### *****************Mortgage Payback dataset****************
library(dplyr)
library(tidyverse)
library(lessR)
library(tidyr)
library(ggplot2)
library(corrplot)
library(fastDummies)
library(forecast)
mortgage_df <- read.csv("C:/Users/deeps/OneDrive/Documents/WEBSTER/Analytics Practicum/Mortgage Payback/Mortgage.csv")
dim(mortgage_df)
class(mortgage_df)
head(mortgage_df)
names(mortgage_df)
View(mortgage_df)
summary(mortgage_df)

# We can calculate how many NAs there are in each variable by using the map() in the purrr package
library(purrr)
mortgage_df %>% 
  map(is.na) %>%
  map(sum)

####Handling missing values NA's.
##install.packages("VIM")
library(VIM)
head(mortgage_df)
mortgage_df <- kNN(mortgage_df, imp_var = FALSE)
head(mortgage_df)

#checking for missing values
missing_values <- sum(is.na(mortgage_df))
missing_values
#checking for total zero values in a dataset
zero_values <- sum(mortgage_df == 0, na.rm = TRUE)
zero_values
###check for zero values column wise
colSums(mortgage_df==0)

###**************Exploratory Data Analysis *********************
###Visualizing the distribution of each variable.

###______________________*****DATA PREPARATION*****_____________________
library(dplyr)
##updating column based on observation time of the loan.
mortgage_df[,c("time")] <-  mortgage_df$time - mortgage_df$orig_time #updating time data
mortgage_df[,c("mat_time")] <- mortgage_df$mat_time - mortgage_df$orig_time
mortgage_df[,c("first_time")] <- mortgage_df$first_time - mortgage_df$orig_time #updating first time data
mortgage_df$loan_length<- mortgage_df[,c("mat_time")]
head(mortgage_df)

#keeping only the last row of each borrower as it contain most information on defaulting or payoff.
mortgage_lastaggregate_df <- mortgage_df %>%
  group_by(id) %>%
  slice_tail(n = 1) %>%
  ungroup()
head(mortgage_lastaggregate_df)

#factoring categorical variable.
mortgage_lastaggregate_df$investor_orig_time <- factor(mortgage_lastaggregate_df$investor_orig_time)
mortgage_lastaggregate_df$default_time <- factor(mortgage_lastaggregate_df$default_time)
mortgage_lastaggregate_df$payoff_time <- factor(mortgage_lastaggregate_df$payoff_time)
mortgage_lastaggregate_df$status_time <- factor(mortgage_lastaggregate_df$status_time)
mortgage_lastaggregate_df$REtype_CO_orig_time <- factor(mortgage_lastaggregate_df$REtype_CO_orig_time)
mortgage_lastaggregate_df$REtype_PU_orig_time <- factor(mortgage_lastaggregate_df$REtype_PU_orig_time)
mortgage_lastaggregate_df$REtype_SF_orig_time <- factor(mortgage_lastaggregate_df$REtype_SF_orig_time)
str(mortgage_lastaggregate_df)

library(ggplot2)
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = time), fill = "brown")
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = orig_time), fill = "brown")
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = first_time), fill = "brown")
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = mat_time), fill = "brown")
hist(mortgage_lastaggregate_df$gdp_time, main = "gdp_time distribution", xlab = "gdp_time", col = "skyblue", border = "black")
hist(mortgage_lastaggregate_df$LTV_time, main = "Loan-to-value ratio distribution", xlab = "LTV_time", col = "skyblue", border = "black")
hist(mortgage_lastaggregate_df$interest_rate_time, main = "interest_rate_time distribution", xlab = "interest_rate_time", col = "skyblue", border = "black")
hist(mortgage_lastaggregate_df$hpi_time, main = "House price index distribution", xlab = "hpi_time", col = "skyblue", border = "black")
hist(mortgage_lastaggregate_df$LTV_orig_time, main = "Loan-to-value ratio in origin distribution", xlab = "LTV_orig_time", col = "skyblue", border = "black")
hist(mortgage_lastaggregate_df$FICO_orig_time, main = "FICO_orig_time ratio distribution", xlab = "FICO_orig_time", col = "skyblue", border = "black")
hist(mortgage_lastaggregate_df$uer_time, main = "Unemployment rate distribution", xlab = "uer_time", col = "skyblue", border = "black")
hist(mortgage_lastaggregate_df$balance_orig_time, main = "Balance at origination time distribution", xlab = "balance_orig_time", col = "skyblue", border = "black")
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = investor_orig_time ), fill = "brown")
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = payoff_time), fill = "brown")
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = default_time), fill = "brown")
ggplot(data=mortgage_lastaggregate_df) + geom_bar(mapping = aes(x = status_time ), fill = "brown")

## Create a basic correlation plot
correlation_matrix <- cor(mortgage_df[,-1])
corrplot(correlation_matrix, method = "number")
corrplot(correlation_matrix, method = "color")

##Predictor relevancy
ggplot(mortgage_lastaggregate_df,aes(y=balance_time, x=payoff_time))+geom_point()
ggplot(mortgage_lastaggregate_df,aes(y=LTV_orig_time,x=status_time))+geom_point()

#REtype_CO_orig_time vs Status time 
ggplot(data = mortgage_lastaggregate_df, aes(x = as.factor(REtype_CO_orig_time), fill = as.factor(status_time))) +
  geom_bar(position = "dodge", color = "black") +
  labs(x = "REtype_CO_orig_time", y = "Count", fill = "Status Time") +
  ggtitle("Frequency Plot of REtype_CO_orig_time vs Status Time") +
  theme_minimal()

ggplot(data= mortgage_lastaggregate_df, aes(x = as.factor(REtype_PU_orig_time), fill = as.factor(status_time))) +
  geom_bar(position = "dodge", color = "black") +
  labs(x = "REtype_PU_orig_time", y = "Count", fill = "Status Time") +
  ggtitle("Frequency Plot of REtype_PU_orig_time vs Status Time") +
  theme_minimal()

ggplot(data = mortgage_lastaggregate_df, aes(x = as.factor(REtype_SF_orig_time), fill = as.factor(status_time))) +
  geom_bar(position = "dodge", color = "black") +
  labs(x = "REtype_SF_orig_time", y = "Count", fill = "Status Time") +
  ggtitle("Frequency Plot of REtype_SF_orig_time vs Status Time") +
  theme_minimal()

ggplot(data = mortgage_lastaggregate_df, aes(x = as.factor(investor_orig_time), fill = as.factor(status_time))) +
  geom_bar(position = "dodge", color = "black") +
  labs(x = "Investor Origination Time", y = "Count", fill = "Status Time") +
  ggtitle("Frequency Plot of Investor Origination Time vs Status Time") +
  theme_minimal()


###________________Dimension Reduction___________________
##removing sequence_number column
mortgage.df<- mortgage_df[,-c(1)]
names(mortgage.df)
str(mortgage.df)
pca_result <- prcomp(mortgage.df, scale. = T)
names(pca_result)
#Performing PCA
# PCA 
plot(pca_result)
library(factoextra)
fviz_eig(pca_result, 
         addlabels = TRUE,
         ylim = c(0, 40),
         main="PCA plot")

# Get loadings from the rotation matrix
loadings <- pca_result$rotation
# Summary
summary(pca_result)
pca_result
# Select top loaded features
k <- 15  # Number of principal components to consider
top_loaded_features <- colnames(mortgage.df)[order(abs(loadings[, 1]), decreasing = TRUE)[1:k]]
top_loaded_features ## top loaded variables of PCA
### all variables are important.
head(mortgage_lastaggregate_df)
str(mortgage_lastaggregate_df) 

###*****DATA PREPARATION***
##removing default and payoff as same information is in status time variable & dropping original time as we have already updated the time with reference to original time.
mortgage_lastaggregate_df <- mortgage_lastaggregate_df[,-c(3,21,22)] 
mortgage_lastaggregate_df <- as.data.frame(mortgage_lastaggregate_df)
head(mortgage_lastaggregate_df)
mortgage_activecustomer <- mortgage_lastaggregate_df[mortgage_lastaggregate_df$status_time %in% c(0), ]

mortgage_nonactivecustomer <- mortgage_lastaggregate_df[mortgage_lastaggregate_df$status_time %in% c(1,2), ]
mortgage_nonactivecustomer$timepercent <-  mortgage_nonactivecustomer$time/mortgage_nonactivecustomer$mat_time *100
summary(mortgage_nonactivecustomer)
hist(mortgage_nonactivecustomer$timepercent) ##distribution

mortgage_activecustomer$timepercent <-  mortgage_activecustomer$time/mortgage_activecustomer$mat_time *100

head(mortgage_nonactivecustomer)
mortgage_nonactivecustomer$status_time <- factor(mortgage_nonactivecustomer$status_time,levels = c("1", "2"),labels = c("Default","Payoff"))

ggplot(data = mortgage_nonactivecustomer, aes(x = (status_time), fill = as.factor(status_time))) +
  geom_bar(position = "dodge", color = "black") + labs(x = "status_time", y = "Count", fill = "Status Time") +
  ggtitle("Frequency Plot of Non active customer") + theme_minimal()

mortgage_nonactivecustomer<- mortgage_nonactivecustomer[-1] #dropping customer id column
head(mortgage_nonactivecustomer)

##_________Data Partioning__________________________
set.seed(123)
##Partition the data randomly into training (60%), validation (20%), holdout (20%)
# randomly sample 60% of the row IDs for training
train.rows <- sample(rownames(mortgage_nonactivecustomer), nrow(mortgage_nonactivecustomer)*0.6)

# sample 20% of the row IDs into the validation set, drawing only from records
# not already in the training set
# use setdiff() to find records not already in the training set
valid.rows <- sample(setdiff(rownames(mortgage_nonactivecustomer), train.rows),
                     nrow(mortgage_nonactivecustomer)*0.2)
# assign the remaining 20% row IDs serve as holdout
holdout.rows <- setdiff(rownames(mortgage_nonactivecustomer), union(train.rows, valid.rows))

# Dividing all non-active customer record into the train,test and valid set for classification. 
mortgage_train.df <- mortgage_nonactivecustomer[train.rows, ]
mortgage_valid.df <- mortgage_nonactivecustomer[valid.rows, ]
mortgage_test.df <- mortgage_nonactivecustomer[holdout.rows, ]

dim(mortgage_train.df)
dim(mortgage_valid.df)
dim(mortgage_test.df)
# Subsetting non-active customers record from train, valid and test set where customer defaulted 
#for regression model analysis
train_default <- subset(mortgage_train.df, status_time == "Default")
valid_default <- subset(mortgage_valid.df, status_time == "Default")
test_default <- subset(mortgage_test.df, status_time == "Default")

dim(train_default)
dim(valid_default)
dim(test_default)

##********************Classifier model selection****************************************
#--->> To identify customer will payoff the loan or not
#Logistic Regression Model
trControl <- caret::trainControl(method="cv", number=5, allowParallel=TRUE)
logit.regression_mortgage <- caret::train(status_time~.-(timepercent+time+first_time+mat_time),
                                          data = mortgage_train.df, trControl=trControl,method="glm", family="binomial")
logit.regression_mortgage
summary(logit.regression_mortgage)
logitreg.pred <- predict(logit.regression_mortgage, mortgage_valid.df,type="raw")
confusionMatrix(as.factor(logitreg.pred), as.factor(mortgage_valid.df$status_time),positive = "Payoff")

### ******Classification tree*****
library(rpart)
library(rpart.plot)
# classification tree
mortagageclassify_tree <- rpart(status_time~.-(timepercent+time+first_time+mat_time), data = mortgage_train.df, method="class")
mortagageclassify_tree
# Plot tree
rpart.plot(mortagageclassify_tree, extra=1, fallen.leaves=TRUE)
###Evaluating performance on validation dataset.
pred.Ctree<- predict(mortagageclassify_tree,mortgage_valid.df,type = "class")
confusionMatrix(pred.Ctree, as.factor(mortgage_valid.df$status_time), positive = "Payoff")

#####*********************fit the Random Forest model**************************
library(randomForest)
randommortgage.model <- randomForest(status_time~.-(timepercent+time+first_time+mat_time),  data = mortgage_train.df)
randommortgage.model

library(forecast)
## variable importance plot
var_importance <- varImp(randommortgage.model)
# Print variable importance summary
print(var_importance)

# Plot the variable importance
randomForest::varImpPlot(randommortgage.model, 
                         sort=TRUE, 
                         main="Variable Importance Plot")

##Evaluating performance of validation data using confusion matrix
rf.pred <- predict(randommortgage.model, mortgage_valid.df)
confusionMatrix(data= as.factor(rf.pred), as.factor(mortgage_valid.df$status_time), positive = "Payoff")

##Selected model i.e., Random Forest model performance will be evaluated on Holdout set
rf.predtest <- predict(randommortgage.model, mortgage_test.df)
confusionMatrix(data= as.factor(rf.predtest), as.factor(mortgage_test.df$status_time), positive = "Payoff")


### _________________________REGRESSION MODEL_____________________________
#### Fitting Multiple linear regression model  
mortgage_linear <- lm(timepercent~.-(time+first_time+mat_time),data = train_default[,-19])
summary(mortgage_linear)

##model performance on validation
predvalid_lmmodel <- predict(mortgage_linear, valid_default)
library(forecast)
accuracy(predvalid_lmmodel,valid_default$timepercent)
cor(predvalid_lmmodel,valid_default$timepercent)

##Improving model performance
###By Stepwise regression
backward=step(mortgage_linear,direction = "backward")
summary(backward)
predvalid_stepmodel <- predict(backward, valid_default)
accuracy(predvalid_stepmodel,valid_default$timepercent)
cor(predvalid_stepmodel,valid_default$timepercent)

##********Training a Regression Tree Model On the Data
library(rpart)
mortgage.rpart<-rpart(timepercent~.-(time+first_time+mat_time),data = train_default)
mortgage.rpart

# Visualizing Regression Trees
library(rpart.plot)
rpart.plot(mortgage.rpart, digits=3)
rpart.plot(mortgage.rpart, digits = 4, fallen.leaves = T, type=3, extra=101)
library(rattle)
fancyRpartPlot(mortgage.rpart, cex = 0.8)

###Evaluating performance on validation dataset
library(caret)
pred.rpart_used<- predict(mortgage.rpart,valid_default)
accuracy(pred.rpart_used,valid_default$timepercent)

###Holdout accuracy on Regression Tree model
library(caret)
pred.rpart_test<- predict(mortgage.rpart,test_default)
accuracy(pred.rpart_test,test_default$timepercent)

###______Find exact time when customer is defaulting by multiplying predicted time percentage with maturity time of test data______
predicted_values<- pred.rpart_test*(test_default$loan_length)/100

comparison_df <- data.frame(Actual = test_default$time, Predicted = predicted_values)
head(comparison_df,10)

summary(predicted_values)
hist(predicted_values)
hist(pred.rpart_test, main = "Predicted Time percentage")

##Finding active customer will default or not
active.predtest <- predict(randommortgage.model, mortgage_activecustomer)
summary(active.predtest)
plot(active.predtest, main="Active customer prediction")

#**********************************************************************************************
#************************Unsupervised k-means Clustering*******************************************
library(cluster)
require(cluster)
library(fastDummies)

# Clustering to determine the different combination of customer financial features that will segment them into categories of defaulter, or payoff customer.
set.seed(123)
mortgage_cluster <- mortgage_df %>%
  group_by(id) %>%
  summarize(
    time = last(time),
    loan_lifecycle= mean(mat_time),
    interest_rate_orig = mean(Interest_Rate_orig_time),
    FICO_score_Orig = mean(FICO_orig_time),
    LTV_origin = mean(LTV_orig_time),
    balance_original = mean(balance_orig_time),
    orig_hpi = mean(hpi_orig_time),
    gdp = mean(gdp_time),
    uer = mean(uer_time),
    status_time = last(status_time)
  )
class(mortgage_cluster)

mortgage_cluster<- data.frame(mortgage_cluster)
head(mortgage_cluster)
mortgage_cluster$status_time <- factor(mortgage_cluster$status_time,levels=c(0,1,2),labels=c("Non-default/Non-payoff","Default","Payoff"))
mortgage_cluster <- mortgage_cluster %>% dummy_cols(select_columns=c('status_time'), remove_selected_columns=TRUE, remove_first_dummy=TRUE)
mortgage_scale_df <- scale(mortgage_cluster[,-c(1)])
dim(mortgage_scale_df)

#elbow curve
wss <- numeric(10)
for (i in 1:10) {
  wss[i] <- sum(kmeans(mortgage_scale_df, centers = i)$withinss)
}
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares (WSS)", main = "Elbow Curve")

## Perform K-means clustering_______
k <- 4  # Number of clusters
set.seed(123)  # For reproducibility
kmeans_result <- kmeans(mortgage_scale_df, centers = k)
kmeans_result$size
dis = dist(mortgage_scale_df)
sil = silhouette(kmeans_result$cluster, dis)
summary(sil)
plot(sil, col=c(1:length(kmeans_result$size)))
plot(sil, col=c(1:length(kmeans_result$size)), border = NA)
factoextra::fviz_silhouette(sil, label=T, palette = "jco", ggtheme = theme_classic())
kmeans_result$centers

par(mfrow=c(1,1), mar=c(4, 4, 4, 2))
myColors <- c("darkgreen", "red", "green", "pink", "purple", "yellow","skyblue","blue","gray","black","orange")
barplot(t(kmeans_result$centers), beside = TRUE, xlab="cluster", 
        ylab="value", col = myColors)
legend("bottomleft", ncol=2, legend = c("time","loan_lifecycle", "interest_rate_orig","FICO_score_Orig", "LTV_origin", "balance_origin", "orig_hpi", "gdp_time", "uer","status_time_Default ","status_time_Payoff"), fill = myColors)

kmt <- as.data.frame(t(kmeans_result$centers))
rowNames <- rownames(kmt)
colnames(kmt) <- paste0("Cluster",c(1:4))
library(plotly)
plot_ly(kmt, x = rownames(kmt), y = ~Cluster1, type = 'bar', name = 'Cluster1') %>% 
  add_trace(y = ~Cluster2, name = 'Cluster2') %>% 
  add_trace(y = ~Cluster3, name = 'Cluster3') %>%   add_trace(y = ~Cluster4, name = 'Cluster4') %>%  
  layout(title="Explicating Derived Cluster Labels",
         yaxis = list(title = 'Cluster Centers'), barmode = 'group')

###*******************To Identify “what factors lead to defaulting in loan”*********
#______Performing further k-means clustering to identify- what factors lead customer to default on loan_______
set.seed(123)
mortgage_cluster.df <- mortgage_df %>%
  group_by(id) %>%
  summarize(
    time = last(time),
    loan_lifecycle= mean(loan_length),
    balance_time = last(balance_time),
    interest_rate_orig = mean(Interest_Rate_orig_time),
    FICO_score_Orig = mean(FICO_orig_time),
    LTV_origin = mean(LTV_orig_time),
    balance_original = mean(balance_orig_time),
    orig_hpi = mean(hpi_orig_time),
    gdp = mean(gdp_time),
    uer = mean(uer_time),
    investor_orig_time = last(investor_orig_time),
    status_time = last(status_time)
  )
str(mortgage_cluster.df)

mortgage_cluster.df<- data.frame(mortgage_cluster.df)
head(mortgage_cluster.df)
mortgage_cluster_further <- mortgage_cluster.df[mortgage_cluster.df$status_time %in% c(1), ]
head(mortgage_cluster_further)
mortgage_default_scaling <- scale(mortgage_cluster_further[,-c(1,13)]) #removing id and status time column that has all default customer.
head(mortgage_default_scaling)

#elbow curve
wss <- numeric(10)
for (i in 1:10) {
  wss[i] <- sum(kmeans(mortgage_default_scaling, centers = i)$withinss)
}
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares (WSS)", main = "Elbow Curve")

#Perform K-means clustering_______
set.seed(1234)  # For reproducibility
kmeans_defaultresult <- kmeans(mortgage_default_scaling, centers = 5)
kmeans_defaultresult$size
dist = dist(mortgage_default_scaling)
silhouete = silhouette(kmeans_defaultresult$cluster, dist)
summary(silhouete)
factoextra::fviz_silhouette(silhouete, label=T, palette = "jco", ggtheme = theme_classic())
kmeans_defaultresult$centers

par(mfrow=c(1,1), mar=c(4, 4, 4, 2))
myColors <- c("darkgreen", "red", "green", "pink", "purple", "yellow","skyblue","blue","gray","orange","brown")
barplot(t(kmeans_defaultresult$centers), beside = TRUE, xlab="cluster", 
        ylab="value", col = myColors)
legend("bottomleft", ncol=2, legend = c("time","loan_lifecycle", "balance_time","interest_rate_orig","FICO_score_Orig", "LTV_origin", "balance_original", "orig_hpi", "gdp_time", "uer","investor_orig_time"), fill = myColors)

kmt_default <- as.data.frame(t(kmeans_defaultresult$centers))
rowNames <- rownames(kmt_default)
colnames(kmt_default) <- paste0("Cluster",c(1:5))
library(plotly)
plot_ly(kmt_default, x = rownames(kmt_default), y = ~Cluster1, type = 'bar', name = 'Cluster1') %>% 
  add_trace(y = ~Cluster2, name = 'Cluster2') %>% 
  add_trace(y = ~Cluster3, name = 'Cluster3') %>%   add_trace(y = ~Cluster4, name = 'Cluster4') %>%  
  add_trace(y = ~Cluster5, name = 'Cluster5') %>% 
  layout(title="Explicating Derived Cluster Labels",
         yaxis = list(title = 'Cluster Centers'), barmode = 'group')
