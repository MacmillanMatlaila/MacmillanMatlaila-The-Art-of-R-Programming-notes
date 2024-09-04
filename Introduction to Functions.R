#The heart of R programming consists of writing functions 
#Functions are grouped instructions that take inputs , uses them to compute other values, and returns results.

#Example: counting the number of odd integers in x
oddcount <- function(x) { #storing the function in variable oddcount
  k <- 0 #assign 0 to k
  for (n in x) {
    if (n %% 2 == 1) k <- k+1 #%% is the modulo operator
    
  }
  return(k)
  
}

oddcount(c(1,3,5)) #Calls the  function on concatenated data set 

#%% modulo operator in R, e.g 38 %% 7 outputs 3 because 3 is the remainder
38 %% 7 #Outputs remainder of 38 divided by 7

for (n in x) {    #n is first set to x
  if (n %% 2 == 1) #tests value for being odd or even
    k <- k+1 #if odd the count is incremented  and n is set to x[2] and test for odd or even and so on

} 
return(k) #At the end of the code we use the return statement

#Variable scope- variable which is only visible within function body is said to be local(scope)
#Variables created outside the functions are global

#Default arguments

g <- function(x,y=2,z=t) {...} #y is initialized to 2 if not specified in call, similarly z is initialized to TRUE 

g(12,z=FALSE) #12 is the actual argument for x, y remains 2 as initialized above but z is overwritten to FALSE

#R Data Structures

#VECTORS ELEMENTS OF A VECTOR MUST ALL HAVE THE SAME MODE/DATA TYPE
#A vector CAN consist of 3 character strings (the mode/data type is character)
#A vector CAN consist of 3 integer elements(the mode is integer)
#A vector CANNOT consist of an integer element and a character string(2 differing modes)

#Scalars are individual numbers but in R they appear as one-element vectors

#Character strings are single element vectors of mode character
 
z <- c("abc","29 88") #assigning z to concatenated data with 2 strings ("1st string","2nd string")
length(z)  #length will output 2 as there are 2 strings
mode(z)   #mode will output be character as data was written as string ""   

#Matrices are vectors with 2 dimensional attributes

m <- rbind(c(1,4),c(2,2)) #rbind() function is row bind combining rows to build a matrix
m
m %*% c(1,1) #%% is the matrix-manipulation operator

#Lists are containers for values but the contents can be different data types
#List elements are accessed using 2-part names indicated with the $ sign

x <- list(u=2, v="abc") #In x I have assigned the list with numeric and charater  
x

#A common use of lists is to combine multiple values into a single package that can be returned by a function
hist(Nile)        #Outputs a graph
hn <- hist(Nile)   # hist(Nile) is assigned to hn
hn           #Outputs hist(Nile) \\list of components describing the characteristics of the histogram
str(hn) #str stands for structure 
        #str outputs a more compact alternative to simply calling hn 

#Data frames are lists with each component of the list being a vector corresponding to a column in our matrix of data
d <- data.frame(list(kids=c("Jack","Jill"),ages=c(12,10)))
d

#Classes - Objects are instances of classes -their instances are simply lists but with an extra attribute : the class name

print(hn)

#Classes are used for generic functions
#Generic functions are family of functions serving a similar purpose but each appropriate to a specific class
#e.g. summary()
summary(hn)
plot()
#Classes are used to organize objects

#example() runs examples of help() entries
example(persp) 
