#R Programming STRUCTURES
#Control Statements

#LOOPS

for (n in vector) { #That means there will be one iteration of the loop for each component of the specified vector
  #n takes on values of the components n=x[element 1 position];n=x[element 2 position] and so on
}

x <- c(5,13,13)
for (n in x) print(n^2)

#While and Repeat

l <- 1
while (l <= 10) l <- 1+4
l

#Similarly

l <- 1
while(TRUE){
  1 <- 1+4
  if(1 > 10) break
}

l <- 1
repeat{
  1 <- 1+4
  if(1 > 10) break
}


#Using Next

sim <- function(nreps) {
commdata <- list()
 commdata$countabsamecomm <- 0
  for (rep in 1:nreps) {
    commdata$whosleft <- 1:20
 commdata$numabchosen <- 0
 commdata <- choosecomm(commdata,5)
  if (commdata$numabchosen > 0) next
 commdata <- choosecomm(commdata,4)
  if (commdata$numabchosen > 0) next
  commdata <- choosecomm(commdata,3)
   }
 print(commdata$countabsamecomm/nreps)
}

#scan() 

for (fn in c("file1", "file2")) print(scan(fn))
#scan() function is used here to read in a file of numbers and store those values in a vector

#R does not support iteration over nonvector sets
#Ways to do it:

# Use lapply(), assuming that the iterations of the loop are independent of each other, thus allowing them to be performed in any order.
# Use get(). As its name implies, this function takes as an argument a character string representing the name of some object and returns the object of that name. It sounds simple, but get() is a very powerful function.

u <- matrix(c(1,2,3,1,2,4),nrow = 3)
u
v <- matrix(c(8,12,20,15,10,2), nrow = 3)
v

for(m in c("u", "v")) {
  z <- get(m)
  print(lm(z[,2]`z[,1]))
}

lm(formula = z[,2]`z[,1])

#if-else

if(r == 4){
  x <- 1
} else {
  x <- 3
  y <- 1
}

#An if-else statment works as a function call and returns the last value assigned

v <- if(condition) expression1 else expression2

#Therefore depeding on whether the condition is true v is set to expression 1 not expression 2
#example

x <- 2
y <- if(x == 2) x else x+1
y

x <- 3
y <- if( x == 2) x else x+1
y

#Arithmetic and Boolean Operators and Values
#lists the basic operators.
#Basic R Operators

#Operation Description

#x + y     Addition
#x - y     Subtraction
#x * y     Multiplication
#x / y     Division
#x ^ y     Exponentiation
#x %% y    Modular arithmetic
#x %/% y   Integer division
#x == y    Test for equality
#x <= y    Test for less than or equal to
#x >= y    Test for greater than or equal to
#x && y    Boolean AND for scalars
#x || y    Boolean OR for scalars
#x & y     Boolean AND for vectors (vector x,y,result)
#x | y     Boolean OR for vectors (vector x,y,result)
#!x        Boolean negation

