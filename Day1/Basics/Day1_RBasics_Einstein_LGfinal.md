Introduction to Data Science & Reproducible Research in R
========================================================
author: Leah Guthrie
date: August 8, 2018
autosize: true
**Day 1 - Part 1**


Learning Goals
========================================================

- Why programming?
- Why R?
- **R basics**

Why learn to program as a biomedical scientist?
========================================================

* We work with heterogeneous biological data (sequences, images, clinical data, single cell measurements, ..)  
* Data management and sharing
* Data analysis and visualization

Why learn to program as a biomedical scientist?
========================================================
# Reproducible Research

> *Your single most important collaborator is you, six months from now.*

~ Many People

- Other important collaborators include your labmates, PI and research community


Why learn to program as a biomedical scientist?
========================================================

<img src="/Users/leahguthrie/Einstein/R_Workshop/My_Slides/images/useofhealthdatasci.png">

Why learn to program as a biomedical scientist?
========================================================

<img src="/Users/leahguthrie/Einstein/R_Workshop/My_Slides/images/venn.png">



Why R?
========================================================

- Why not?
- R and Python are “high level” languages with many libraries for biology.
- Master a language. 

Why R?
========================================================

- Open source and community-owned with many high quality packages (with good documentation)
- Data input and wrangling
- Simulation
- Visualization and presentation
- Easy to use interactive development environment = RStudio
- Reproducibilty and Collaborative environment
- Rich data structures


========================================================
<center> <h1>R Basics</h1> </center>



Setup
========================================================

<img src="/Users/leahguthrie/Einstein/R_Workshop/My_Slides/images/Rstudio_gui.png">

Thumbs System
========================================================

<img src="/Users/leahguthrie/Einstein/R_Workshop/My_Slides/images/thumbs.png">


What is R?
========================================================

- Open source language for statistical computing and graphics.
- An object-orientated language (Everything in R is an object)


R is an interactive calculator
========================================================


```r
14 + 15
```

```
[1] 29
```

Assign a value to a variable 
========================================================

- assignment operator (<-)
- Think of the assignment operator (<-) as an arrow

```r
a <- 14 + 15
```

## Note: R syntax is case-sensitive

```r
a <- 14 + 15
A
#Error in eval(expr, envir, enclos) : object 'A' not found'
```

To Do: 
========================================================

Assign the result of 4 + 6  to a new vaiable called b. 


To Do: 
========================================================

Assign the result of 4 + 6  to a new vaiable called b. 

```r
b <- 4 + 6
```

========================================================
# Creating objects and assinging values in R.


R Classes
========================================================
When we interact with R, we have different kinds of objects to store data. These are called classes.

<img src="/Users/leahguthrie/Einstein/R_Workshop/My_Slides/images/data_typesR.png">
** Modified from source: Jessica Mar Programming 1



Vectors and lists
========================================================

- Atomic vectors -  one data type
  - (numeric,logical, character, integer, complex)
- List - multiple data types

Create vectors using the c() function
========================================================

- c stands for concatenate or combine
- Note: to learn more about a function try ?c()
- NA (not available)

Numeric Vectors
========================================================


```r
 c(1, 0.24, 3, 40, -1.2)
```

```
[1]  1.00  0.24  3.00 40.00 -1.20
```

Numeric Vectors
========================================================
 - We can create a sequence of numbers in R is by using the `:` operator 

```r
 c(1:27)
```

```
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
[24] 24 25 26 27
```

Logical Vectors
========================================================

- TRUE
- FALSE
- NA (not available)


Logical Operators
========================================================

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
<caption>Logical Operators</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operator </th>
   <th style="text-align:left;"> Description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> &lt; </td>
   <td style="text-align:left;"> less than </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &lt;= </td>
   <td style="text-align:left;"> less than or equal to </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &gt; </td>
   <td style="text-align:left;"> greater than </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &gt;= </td>
   <td style="text-align:left;"> greater than or equal to </td>
  </tr>
  <tr>
   <td style="text-align:left;"> == </td>
   <td style="text-align:left;"> exactly equal to </td>
  </tr>
  <tr>
   <td style="text-align:left;"> != </td>
   <td style="text-align:left;"> not equal to </td>
  </tr>
  <tr>
   <td style="text-align:left;"> !x </td>
   <td style="text-align:left;"> Not x </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x|y </td>
   <td style="text-align:left;"> x OR y </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x&amp;y </td>
   <td style="text-align:left;"> x AND y </td>
  </tr>
  <tr>
   <td style="text-align:left;"> isTRUE(x) </td>
   <td style="text-align:left;"> test if X is TRUE </td>
  </tr>
</tbody>
</table>

Vector arithmetic
========================================================
- R performs many operations on an element-by-element basis ('vectorized' operations)


To Do: 
========================================================

1. Create a numeric vector called **my_num_vect** with the values 0.1, 0.24, 24, 190 and -120.
2. Create a variable called **mnv_1** that gets the result of my_num_vect < 1.
3. What will **mnv_1** look like?

**A:** A single logical value

**B:** A vector of logical values

========================================================

```r
my_num_vec <- c(0.1, 0.24, 24, 190, -120)
tf <- my_num_vec < 1
tf
```

```
[1]  TRUE  TRUE FALSE FALSE  TRUE
```

Lists
========================================================

We can use the list function (list()) to create a list

```r
info.student <- list(firstName = "A", surName = "B",department = "Systems & Comp Bio", phone=c(1111111222, 6175828280))
```

Lists
========================================================


```r
info.student 
```

```
$firstName
[1] "A"

$surName
[1] "B"

$department
[1] "Systems & Comp Bio"

$phone
[1] 1111111222 6175828280
```


Functions
========================================================

- Definition: small pieces of reusable code that can be treated
like any other R object
- Functions are usually characterized by the name of the function followed by parentheses
- R has many builtin functions
    * seq()
    * length()
    * mean()
    * str()
    * help()
    
Functions
========================================================

```r
mean(c(20:25))
```

```
[1] 22.5
```

 - Inputs to functions are often called arguments.
 - Providing arguments to a function is also sometimes called passing arguments to that function.


To Do:
========================================================

Pass the arguement c(2:8) to the mean() function

```r
mean(c(2:8))
```

```
[1] 5
```


Writing your own functions
========================================================

### Structure of a function


```r
function_name <- function(arg1, arg2){
#	# Manipulate arguments in some way
#	# Return a value
# }
```
 - arg1, arg2 = arguements


Writing your own functions
========================================================

### Calling the function


```r
function_name <- function(arg1, arg2){
arg1 + arg2
}

function_name(1,4)
```

```
[1] 5
```

Writing your own functions
========================================================

###  Checkout the source code:
 
 ```r
 function_name
 ```
 
 ```
 function(arg1, arg2){
 arg1 + arg2
 }
 ```
 
 
Writing your own functions
========================================================
Write a function,fahrenheit_to_kelvin:

<img src="/Users/leahguthrie/Einstein/R_Workshop/My_Slides/images/ftoK.png">



Writing your own functions
========================================================

 
 ```r
 fahrenheit_to_kelvin <- function(temp_F) {
  temp_K <- ((temp_F - 32) * (5 / 9)) + 273.15
  return(temp_K)
 }
 ```
  
  
Writing your own functions
========================================================

 
 ```r
 fahrenheit_to_kelvin(34)
 ```
 
 ```
 [1] 274.2611
 ```


```r
args(fahrenheit_to_kelvin)
```

```
function (temp_F) 
NULL
```

Matrices and Dataframes
========================================================
- Both represent 'rectangular' data types (tabular data with rows and columns)
- A matrix is a 2D array of the same data type. 
- A dataframe can consist of many different classes of data

Matrices 
========================================================
Creating a matrix

There are usually multiple ways to create objects in R


```r
my_vector <- 1:20
dim(my_vector) <- c(4, 5)
class(my_vector)
```

```
[1] "matrix"
```


Matrices 
========================================================
Creating a matrix
There are usually multiple ways to create objects in r


```r
my_mat <- matrix( 
  c(2, 4, 3, 1, 5, 7), 
  nrow=3, 
  ncol=2)

rownames(my_mat) <- c("n1","n2","n3")
colnames(my_mat) <- c("a1","a2")

my_mat
```

```
   a1 a2
n1  2  1
n2  4  5
n3  3  7
```


Dataframes
========================================================
R comes with datasets

```r
data(Theoph)
head(Theoph,2)
```

```
  Subject   Wt Dose Time conc
1       1 79.6 4.02 0.00 0.74
2       1 79.6 4.02 0.25 2.84
```

Dataframes
========================================================
You can create dataframes

```r
names <- c("Andy","Angel","Alex","Eric")
height <- c(60.2,62,58,63)
weight <-  c(189,170,160,169)
bio.df <- data.frame(id = names, h = height, w = weight)
head(bio.df)
```

```
     id    h   w
1  Andy 60.2 189
2 Angel 62.0 170
3  Alex 58.0 160
4  Eric 63.0 169
```


```r
bio.df[,1]
```

```
[1] Andy  Angel Alex  Eric 
Levels: Alex Andy Angel Eric
```

Summary
========================================================
- Any object that contains data is called a data structure
- Functions are one of the fundamental building blocks of the R language
- Define a function using name <- function(...args...) {...body...}
- R syntax is case-sensitive
- Matrices can only contain a single class of data, while dataframes can consist of many different classes of data

Part 1 Wrap up Challenge 
========================================================

1. Define a function called 'my_mean' that computes the mean of a given vector of numbers.


========================================================

```r
my_mean <- function(my_vector) {
  sum(my_vector)/length(my_vector)
}
```


Part 1 Wrap up Challenge 
========================================================
1. Create a matrix with 4 rows and 2 columns called myMat.


========================================================

```r
my_mat <- matrix( 
  c(2, 4, 3, 1, 5, 7), 
  nrow=3, 
  ncol=2)
```
