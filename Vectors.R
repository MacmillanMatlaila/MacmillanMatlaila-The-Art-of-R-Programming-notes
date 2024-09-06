###ALL R PROGRAMMERS MUST FIND THEIR OWN "HAPPY MEDIUM" IN TRADING BREVITY FOR CLARITY
###IT IS BOTH OKAY AND NOT OKAY TO FULLY UNDERSTAND THE CODE BUT TO GRASP THE IDEA AND USE CASE THE CODE COULD APPLY TO
###THIS WAY YOU WON'T GIVE UP DUE TO CONFUSION
###SO IF YOU ARE LOST IN THE DOMINION OF FUNCTIONS THINK OF HOW THIS COULD BE USED IN AN EXAMPLE FAMILIAR TO YOU


#The fundamental data type in R

#Recycling - The automatic lengthening of vectors in certain settings
#Filtering - The extraction of subsets of vectors
#Vectorization - Where functions are applied element-wise to vectors

#NOTE - The 3 operations above are central to R programming


#Scalars, Vectors, Arrays , and Matrices.

#SCALARS ARE ONE LEMNT VECTORS

#R variable types are called modes
#The modes: #Integer, Numeric(floating-point number)
            #Character(string)
            #Logical(Boolean)
            #Complex
            #and so on

#typeof #Your program checks the mode of a variable

#Arrays and Matrices are actually vectors too but with extra class attributes


#Adding and deleting Vector elements- Vectors are stored like arrays meaning it's size is determined at it's creation

#To add or delete elements the vector must be reassigned
#let’s add an element to the middle of a four-element vector:
x <- c(88,5,12,13) # concatenate
x <- c(x[1:3],168,x[4]) # insert 168 before the 13
x #Call x


#Obtaining the Length of a vector
#length() function outputs the length of a vector

x <- c(1,2,4)
length(x)

# Suppose that we wish to have a function that determines the index of the first 1 value in the function’s vector argument

first1 <- function(x) {
  for (i in 1:length(x)) {
    if (x[i] == 1) break #meaning BREAK out of loop
  }
  return(i)
}

#the above method is not very efficient

x <- c()
x       #Outputs NULL
length(x) #Outputs 0 
1:length(x) #Outputs 1 0 

#It's better to use seq()

#Arrays,Matrices are vectors and even lists in some sense 

#Declaratios

z <- 3 #perfectly legal however...

#If you reference specific elements of a vector you must warn R

#warn by first creating y

y <- vector(length = 2) #You've set y vector to have a length of 2
y[1] <- 5 #1st element is set to 5
y[2] <- 12 #2nd element is set to 12
y   #Calling y vector outputs 5 12 

#The reading and writing of individual vector elements are actually handled by functions
#If R doesn’t already know that y is a vector, these functions have nothing on which to act
#Hence we must first create y

#RECYCLING
#-R recycles or repeats the shortest vector until it is the same length as the longer one when applying an operation to 2 vectors that requires them to be the same length


c(1,2,4) + c(6,0,9,20,22) 
#Above will Output warning message after performing operation
#Since shorter vector is recycled operation is taken by R as:

c(1,2,4,1,2) + c(6,0,9,20,22)
#Notice in above operation the recycling happened at elements 1,2 
#Hence the output of "c(1,2,4) + c(6,0,9,20,22)" is the same as the output of "c(1,2,4,1,2) + c(6,0,9,20,22)"
#If you are confused remember how additions are done to elements in variables, just think a little Mac.

x <- vector(length = 6)
x+c(1,2) 
#In above example x has 6 elements therefore adding it to a 2 element vector forces the 2 element vector to repeat/recycle
#In other words c(1,2,1,2,1,2) until its also length 6

#AS MATRICES: #the book gives an examples





#Common vector Operators
x <- c(1,2,4)
x + c(5,0,-1)
x * c(5,0,-1)
x <- c(1,2,4)
x / c(5,4,-1)

#VECTOR INDEXING - FORMING A SUBVECTOR BY PICKING ELEMENTS OF GIVEN VECTOR FOR SPECIFIC INDICES


y <- c(1.2,3.9,0.4,0.12)
y[c(1,3)] # extract elements 1 and 3 of y
y[2:3]
v <- 3:4 #Sets elements number 3 through 4 of y to v 
y[v]  #calls the y elements set to v

#duplicates are allowed

x <- c(4,2,17,5) #From this I understand that concatenated elements were set to x
y <- x[c(1,1,3)] #Extraction of element 1, element 1, element 3 of y are set to x
y                #As such calling y should output extraction variable[c(element number,element number)]

#Just as we can extract elements we can also exclude element

z <- c(5,12,13)  #Concatenated elements are set to z
z[-1] # element 1 in z is excluded

z[-1:-2] # exclude elements 1 through 2 in z

#Picking up all elements of a vector except the last element 

z <- c(5,12,13)
z[1:length(z)-1] #Picks all elements in z from 1 through the entire length of z but not the last element

#Colon operator produces a vector consisting of a range of numbers
5:8 # Produces a vector from 5 through 8 ascending
5:1 #Produces a vector from 5 through 1 descending

#NOTE: 
# 1:i-1 is not the same as 1:(i-1) as the colon will take precedence over the subtraction in the first one but parenthesis take precendence over the colon operator in the second one

#Using seq() to generalize the colon operator
#seq() generates a sequence in arithmetic progression

seq(from=12, to=30, by=3) #Outputs 12:30 but sort of like : "a+3,b+3,c+3, d+3 and so on" until 30
x <- c(5,12,13)
x
seq(x) #Outputs the sequential order of the x elements 
1:length(x) #Outputs same as seq(x) but from 1st element
integer(0)

#Repeating vector constraints with rep()
#The rep() function allows us to put the same constant into long vectors
#You call it with rep(x,times) with x being the variable the data has been set to

x <- rep(8,4) #The rep() function is assigned to x ,the element to be repeated is 8 and 4 is the number of repetitions 
x

rep(c(5,12,13),each=12) #Repeats concatenated elements each 12 times

#Using all() and any to report if arguments are true

x <- 1:10
any(x>8) #Outputs TRUE if there are ANY elements in x greater than 8
all(x>8) #Outputs FALSE if ALL elements in x are not  greater than 8

#EXTENDED EXAMPLS PAGE 61 - PAGE 65 BEFORE VECTORISED OPERATIONS

#- Finding runs  of consecutive 1s in vectors consisting of only 1s and 0s
#the vector(1,0,0,1,1,1,0,1,1) has a run of 1s of length 3 starting at index 4 and length 2 starting at index 5 and another run of 1s of length 2 starting at index 8

findruns <- function(x,k){
  n <- length(x)
  runs <- NULL
  for (i in 1:(n-k+1)) {
    if(all(x[i:(i+k-1)]==1)) runs <- c(runs,i)
    
  }
  return(runs)
}

findruns(c(1,0,0,1,1,1,0,1,1),2) #Outputs the runs 

#The expression x[i:(i+k-1)] gives us a range in x
#applying all() then tells us if there is a run there

y <- c(1,0,0,1,1,1,0,1,1)
findruns(y,3) #Find the index of 3 runs in y, it will output th index
findruns(y,2)
findruns(y,6)

#Preallocating memory space to avoid code slowing down

findruns1 <- function(x,k){
  n <- length(x) #Set up a space of vector length n which avoids new allocation during loop execution
  runs <- vector(length=n)
  count <- 0
  for (i in 1:(n-k+1)){
    if (all(x[i:(i+k-1)]==1)){
      count <- count +1
      runs[count] <- i #Merely fill runs
    }
  }
  if (count > 0) {
    runs <- runs[1:count] #Redefine runs to remove unused portion of the vector
  } else runs <- NULL
  return(runs)
}


#Observing 0 and 1 data values 
#1 for rain
#0 for no rain
#For some number k, predict tomorrow's weather based on the weather record of the last k days 
#Using majority rule: if 1s in previous k days is k/2, next value is predicted to be 1 otherwise its predicted to be 0
# for example if k = 3 meaning its 3 days and the data is 1,0,1 next is predicted as 1
#A training set is known data which increases reliability of data by helping us choose a range for k

#Suppose we have 500 days of data and k=3
#Predict each day in our data from previous 3 days
#Compare prediction with known values
#Error rate is k = 3
#do the same for k = 1, k = 2, k = 4 and so on

preda <- function(x,k) {
  n <- length(x)
  K2 <- K/2
  pred <- vector(length=n-k) #The vector pred will contain our predicted values
  for (i in 1:(n-k)) {
    if (sum(x[i:(i+(k-1))]) >= k2) pred[i] <- 1 else pred[i] <- 0 
  } #This predicts day i+k and stores the prediction in pred[i] from k days previous to it
  return(mean(abs(pred-x[(k+1):n]))) #here pred contains predicted values and x[(k+1):n] contains the actual values of those days
} #Subtracting x[(k+1):n] from pred gives us 0,1 or -1 with 1 and -1 corresponding to prediction error
  #abs() gives us 0 and 1, the latter corresponding to errors
  #mean() calculates the proportion of errors
#Among those days we need to count the 1s
sum(x[i:(i+(k-1))]) #The number of 1s

#rewriting the above code to take advantage of previous computation
predb <- function(x,k) {
  n <- length(x)
  k2 <- k/2
  pred <- vector(vector=n-k)
  sm <- sum(x[1:k])
  if (sm >= k2) pred[1] <- 1 else pred[1] <- 0
  if (n-k >= 2) {
    for (i in 2:(n-k)) {
      sm <- sm + x[i+k-1] - x[i-1] #Here, we are updating sm, by subtracting the oldest element making up the sum (x[i-1]) and adding the new one (x[i+k-1])
      if (sm >= k2) pred[i] <- 1 else pred[i] <- 0
    }
  }
  return(mean(abs(pred-x[(k+1):n])))
}

#We can alternatively also use cumsum()

y <- c(5,2,-3,8)  
cumsum(y) #Outputs 5 7 4 12. 5=5; 7=5+2; 4=7-3; 12=4+8

#Expression sum(x[i:(k-1)]) in preda() uses differences of cumsum()

predc <- function(x,k) {
  n <- length(x)
  k2 <- k/2
  # the vector red will contain our predicted values
  pred <- vector(length=n-k)
  csx <- c(0,cumsum(x))
  for (i in 1:(n-k)) {
    if (csx[i+k] - csx[i] >= k2) pred[i] <- 1 else pred[i] <- 0
  } #(csx[i+k] - csx[i] instead of sum(x[i:(i+(k-1))]
  return(mean(abs(pred-x[(k+1):n])))
} 

csx <- c(0,cumsum(x)) # in order to handle the case i=1 correctly, there's the prepending of a 0 in the vector of cumulative sums


#Vectorized Operations help us achieve speed in R
#function applied to a vector is actually applied individually to each element

#Vector in/ Vector out

u <- c(5,2,8)
v <- c(1,3,9)
u > v  #Outputs TRUE/FALSE depending on if element meets argument

w <- function(x) return(x+1)
w(u)  #R function uses vectorized operations, it, too, is vectorized, thus enabling a potential speedup

#Let’s apply the function for rounding to the nearest integer

y <- c(1.2,3.9,0.4)
z <- round(y) #Rounds to the nearest integer
z


y <- c(12,5,13)
'+'(y,4) #Adds 4 element wise, 4 is a single element therefore it was recycled until it was the same length as y

#Let’s consider vectorized functions that appear to have scalar arguments

f <- function(x,c) return((x+c)^2)
f(1:3,0)
f(1:3,1) #Through recycling x+c for f(1:3,1)becomes 1 2 3 + 1 1 1

f(1:3,1:3) #Through recycling this becomes (x(1 2 3 + 1 1 1) + c(1  2 3 + 1 1 1))^2 

#To restrict c to scalars

f <- function(x,c) {
  if (length(c) != 1) stop("vector c not allowed")
  return((x + c)^2)
}

f(1:3,1)

#Vector In/Matrix Out
# Calling sqrt() on a number gives us a number. If we apply this function to an eight-element vector, we get eight numbers, thus another eightelement vector, as output

z12 <- function(z) return(c(z,z^2))
z12(5) #Outputs a 2 element vector instead of the 1 we usually get
z12(1:8) #Applied to an 8 element (1:8) it outputs 16 numbers
matrix(z12(1:8),ncol=2) #Outputs a matrix of 8 rows and 2 columns

z12 <- function(z) return(c(z,z^2))
sapply(1:8,z12) #sapply(x,f) applies the function f() to each element of x and then converts the result to a matrix

#NA and NULL
#In statistical data sets, we often encounter missing data, which we represent in R with the value NA
#NULL, on the other hand, represents that the value in question simply doesn’t exist, rather than being existent but unknown

#instruct the function to skip over any missing values, or NAs

x <- c(88,NA,12,168,13)
x  #Outputs each element as is including NA

mean(x) #Outputs NA because not all data is known therefore mean cannot be calculated
mean(x,na.rm = T) #na removed equals to true
x <- c(88,NULL,12,168,13)
mean(x) #Outputs mean as NULL means element does not exist 

#Filtering allows us to extract a vector's elements that satisfy certain conditions that satisfy a certain condition
z <- c(5,2,-3,8)
w <- z[z*z > 8]  #Our intent is to extract all elements whose squares are greater than 8
w
z*z > 8 #Our intent here is to evaluate the code, this will output boolean true or false per element the argument is applied to.

#NOTE Z*Z > 8 IS THE SAME AS ">"(Z*Z,8)

z[c(TRUE,FALSE,TRUE,TRUE)]


z <- c(5,2,-3,8)
j <- z*z > 8
j


y <- c(1,2,30,5)
j <- z*z > 8
y[j]
#OR
y[z*z > 8] #Remember z*z > 8 was set to j

#In above vector z was used to determine the indices to use in filtering vector y

x[x > 3] <- 0 #All elements set to x and  > 3 are now set to 0 

#Filtering can also be done with the subset() function

x <- c(6,1:3,NA,12)
x #Outputs everything including NA
x[x > 5] #Outputs elements set to x and greater than 5 including NA
subset(x,x > 5) #Outputs elements set to x and greater than 5, excluding NA.

#The selection function finds the position at which the condition occurs

z <- c(5,2,-3,8)
which(z*z > 8) #Outputs position of elements where z*z is greater than 8

#determining the location within a vector at which the first occurrence of some condition holds
first1 <- function(x) {
  for (i in 1:length(x)) {
    if (x[i] == 1) break # break out of loop
  }
  return(i)
} #OR

first1a <- function(x) return(which(x == 1)[1])


#VECTORIZED IF-THEN-ELSE

ifelse(b,u,v)  #b is a Boolean vector, u and v are vectors

x <- 1:10
x
y <- ifelse(x %% 2 == 0, 5,12) #produces a 5 wherever x is even or 12 wherever x is odd
y

x <- c(5,2,9,12)
x
ifelse(x > 6, 2*x,3*x) #Outputs elements of x multiplied by 2 or 3 depending on where the element is greater than 6 
#REMEMBER IN ABOVE THE X>6 AND X%%2==0 IS A VECTOR OF BOOLEANS 

#A measure of Association on Page 75

#In assessing the statistical relation of two variables,measures have various motivations, such as  robustnessto outliers.
#The standard correlation measure (Pearson product-moment correlation)
#Alternatives include the Spearman rank correlation

#E.g vector x and vector y are time series for measurements of air temperature once per hour

findud() #converts vector v to 1s and 0s representing an element increasing or not increasing relative to th previous
#Output length is 1 less than input

#The measure of association action time x and y increase or decrease together

#The proportion of i for which y[i+1]-y[i] has the same sign as x[i+1]-x[i]:

findud <- function(v){
  vud <- v[-1] -v[-length(v)]
  return(ifelse(vud > 0,1, -1))
}

udcorr <- function(x,y){
  ud <- lapply(list(x,y),findud)
  return(mean(ud[[1]] == ud[[2]]))
}

x <- c(5,12,13,3,6,0,1,15,16,8,88)
y <- c(4,2,3,23,6,10,11,12,6,3,2)

#Reading the data pay attention to where the values in x increasing from the previous corresponds to the same association with a similar thing happening in y
#For example at index 2 to 3 of x, elements are:12 to 13 increase
#Similarly at index 2 to index 3 of y there was an increase from element 2 to element 3
#This shows a corresponding increase at the same indices and that is what we are paying attention to

#In terms of decreasing together, meaning in correspondence to each other

#That increase from index 2 to index 3 matches that there is also an increase in y from index 2 to 3
#lapply returns a list
#return(mean(ud[[1]] == ud[[2]])) finds the fraction of matches
#Watch youtube videos to understand the code above

#Recoding an Abalone Data Set

g <- c("M","F","F","I","M","M","F") #Gender is coded as "M","F" or "I"
ifelse(g == "M",1,ifelse(g == "F",2,3)) #We recode the characters "M","F","I" AS 1, 2, 3
args(ifelse) #Finds the formal argument names in function ifelse()
#Outputs functon(test, yes, no) NULL
#ifelse() executed first testing g == "M", yes is 1
#No is result of executing ifelse(g== "F", 2,3)
#Executing ifelse(g == "M") test 1 is true so the generated answer is 1
#Test 2 is false so R looks for number 2 thus executes inner ifelse(g == "F",2,3))

#Say our abalone data is stored in the matrix ab
#with gender in the first column

ab[,1] <- ifelse(ab[,1] == "M",1,ifelse(ab[,1] == "F",2,3))

#Suppose we wish to form subgroups according to gender 
#We could use which() to find the element numbers corresponding to M, F, and I:

m <- which(g == "M")
f <- which(g == "F")
i <- which(g == "I")

#Saving the groups in a list

grps <- list()
for (gen in c("M","F","I")) grps[[gen]] <- which(g==gen)
grps


#Using our recoded data to draw some graphs, exploring the various variables in the abalone data set:
#Adding headers to file:
#Headers are: Gender,Length,Diameter,Height,WholeWt,ShuckedWt,ViscWt,ShellWt,Rings

#Plot diameter versus length 
#with a separate plot for males and females

aba <- read.csv("abalone.data",header = T,as.is = T)
grps <- list()
for (gen in c("M","F")) grps[[gen]] <- which(aba==gen)
abam <- aba[grps$M,]
abaf <- aba[grps$F,]
plot(abam$Length,abam$Diameter)
plot(abaf$Length,abaf$Diameter,pch="x",new=FALSE)

#aba <- read.csv("abalone.data",header = T,as.is = T) reads in the data set and sets it to variable aba
#abam <- aba[grps$M,] and abaf <- aba[grps$F,] are form to correspond to male and female
#THEN WE CREATE THE PLOTS
#To superimpose new=FALSE
#This instructs R to not create a new graph


#TESTING WHETHER 2 VECTORS ARE EQUAL

x <- 1:3
y <- C(1,3,4)

x==y #The NAIVE approach

all(x==y)
#Applying all() to the result of == asks whether all of the elements of the latter are true
#which is the same as asking whether x and y are identical

identical(x,y)

#BEWARE
#applying identical() to 1:3 and c(1,2) will yield false because int are not the same as floating-point numbers


#VECTOR ELEMENT NAMES KINDA EASY AND STRIGHTFORWARD

> x <- c(1,2,4)
> names(x) <- c("a","b","ab") #Sets "a" as name of 1 in x and so on
> x["b"] #outputs name b and the element in x it has been assigned to 
b #Name assigned to 2 in x
2 #2 in x