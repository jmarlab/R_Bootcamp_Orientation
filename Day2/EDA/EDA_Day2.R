# EDA on the TCGA BRCA dataset

## Load Libraries/Packages
load.libraries <- c('data.table', 'testthat', 'gridExtra', 'GGally', 'ggplot2', 'dplyr')
install.lib <- load.libraries[!load.libraries %in% installed.packages()]
for(libs in install.lib) install.packages(libs, dependences = TRUE)
sapply(load.libraries, require, character = TRUE)

## Load datasets

dat <- read.csv("testDataforPCA.csv")
clinicalData <- read.csv("mock_clinicalData.csv")
BRCA <- read.csv("BRCA_RNAseq.csv")


## Check dimensions and data structure.



## Make a vector called numeric_var for numeric variables in your clinical metadata 
## data frame and a vector called cat_var for the qualitative/categorical variables
## in your metadata data frame.

numeric_var <- names(clinicalData)[which......]
cat_var <- names(clinicalData)[which.....]

## Identify missing values in your clinical metadata data frame.


## Check the distribution of your variables and create exploratory graphics.


### How many tumor verus non tumor people are included?
### What problems might arise from the differences in group size?

### Hint: The column called shortLetterCode has 3 unique values that refer to different
### sample types. unique(clinicalData$shortLetterCode) [1] "NT" "TP" "TM"
### NT = Solid Tissue Normal TP = Primary Solid Tumor TM =Metastatic
### Reference: https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/sample-type-codes

### Let's visualize this. shortLetterCode is a categorical variable.

pTumorType <- ggplot(clinicalData) + 
  geom_bar(mapping = aes(x = shortLetterCode))

### Find the distribution for numeric and integer variables and a categorical variable?  
### Do you think that this is a representative sample of individuals with BRCA?
  
pBMI <- ggplot(clinicalData) + 
  geom_histogram(mapping = aes(x = bmi), binwidth = 0.5)

pBMI

pBMIcor <- ggplot(clinicalData) + 
  geom_point(mapping = aes(x = bmi, y=age))

pBMIcor 

### how does the BMI of a BRCA study partcipant vary with tumortype?
BMI_type <- ggplot(data = clinicalData, mapping = aes(x = bmi)) + 
  geom_freqpoly(mapping = aes(colour = shortLetterCode))
BMI_type

BMI_type2 <- ggplot(data = clinicalData, mapping = aes(x = bmi, y = ..density..)) + 
  geom_freqpoly(mapping = aes(colour = shortLetterCode))
BMI_type2


### Expression data
### PCA using  prcomp
head(dat)
model = prcomp(dat[,2:6], scale=TRUE)
model$sdev
model$rotation
model$center
model$scale

par(mfrow=c(2,2))


plot(model$x[,1], col=dat[,1])
plot(model$x[,2], col=dat[,1])
plot(model$x[,3], col=dat[,1])
plot(model$x[,4], col=dat[,1])

## Now apply PCA to the gene expression dataset
  
head(BRCA)
dim(BRCA)
model1 = prcomp(,) scale=TRUE)
model1$sdev
model1$rotation
model1$center
model1$scale

par(mfrow=c(2,2))


