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

#AS MATRICES:





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


