
# Exploratory Data Analysis (EDA) Handout
## Day 2
## Einstein Intro to R and data analysis workshop


# EDA

*  Definition: exploratory techniques for summarizing data in a systematic way 
*  Goal of EDA is to get you thinking about your data quality, the questions that your data can answer and the appropriate statistical approaches for your dataset.

Note: You should think about the type and how much data you need as well as potential analysis approaches when designing your experiment (Don't wait until you have collected your data to think about data complexity, power, etc.,).


# EDA Checklist

1. Read in your data.
2. Check dimensions and data structure.
3. Identify missing values.
4. Check the distribution of your variables.
5. Explore the relationship between variables.
6. Formulate questions.



# Today's Goal

Today you are going to go through an EDA checklist in your groups. This will require the use of some of the skills that you learned yesterday. Please note that the components of the EDA checklist above in not comprehensive. It is an example of a set of observations to make about your data that are important to your downstream analyses. In Part 2 of today's workshop you will specifically consider how transform the RNASeq gene expression data that we will use today.

# About the Dataset

* The Cancer Genome Atlas (TCGA) dataset
* What is it?
	* Two petabytes of genomic data, has been made publically available, and this genomic information helps the cancer research community to improve the prevention, diagnosis, and treatment of cancer.
* Our dataset
    * [TCGA](https://portal.gdc.cancer.gov/projects/TCGA-BRCA)
    
    * RNAseq expression data for individuals with breast cancer and controls


# Specific Goals and Check Points

At each checkpoint, we will discuss your progress going through the tutorial as a full group. I will also share some hints to proceed with the next session. 

# Functions to look up 
- sapply
- which
- colSums
- prcomp

1. Read in your data.
2. Check dimensions and data structure.

Make a vector called numeric_var for numeric variables in your clinical metadata data frame and a vector called cat_var for the qualitative/categorical variables in your metadata data frame.

Hint: You may want to use which or sapply functions for this task.

## Checkpoint 1

3. Identify missing values in your clinical metadata data frame.
Hint: Consider using these functions: colSums, sapply and is.na.


## Checkpoint 2

4. Check the distribution of your variables and create exploratory graphics.
We have shown you how to use the base functions in R. The Day2_EDA.R script has an example of how to do this using a popular visualization library called ggplot2.

- How many samples are normal vs tumor?
- How might this impact our analysis?

## Checkpoint 3

5. Explore the relationship between variables in the clinical metadata data frame.

Also use PCA to explore the gene expression dataset.


## Checkpoint 4

6. Formulate questions. Also discuss what you would add to your own EDA checklist.

## Checkpoint 5.

Your done with part 1!!  Water Break!





