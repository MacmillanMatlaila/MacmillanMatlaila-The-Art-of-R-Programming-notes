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


#Return values

oddcount
function(x) {
  k <- 0 # assign 0 to k
  for (n in x) {
    if (n %% 2 == 1) k <- k+1 # %% is the modulo operator
  }
  return(k) #Returns the count of odd numbers set to k
}

#Preferably and alternatively in R we do not use the return but we do call at th end , return is not necessarry but it helps you understand.
#The code above with return() and the code below without it accomplish the same thing in R

oddcount <- function(x) {
  k <- 0
  pagebreak
  for (n in x) {
    if (n %% 2 == 1) k <- k+1
  }
  k
}

#Returning complex Objects

function(){
  t <- function(x) return(x^2)
  return(t)
}


#Functions are Objects

g <- function(x){#First argument here is just x
  return(x+1)#Second argument of the class expression
}

#The right hand side above creates a function object assigned to g on the left hand side

#Since objects are functions you can assign them and use them as arguements

f1 <- function(a,b) return(a+b)
f2 <- function(a,b) return(a-b)
f <- f1
f(3,2) #a=3 and b=2 remember function(a,b) and that f1 was stored in f

g <- function(h,a,b) h(a,b)
g(f1,3,2) #f1 returns a+b a=3 and b=2 therefore does the same thing

#You can loop through a list consisting of several functions since functions are objects

#A loop to plot the same functions on a graph

g1 <- function(x) return(sin(x))
g2 <- function(x) return(sqrt(x^2+1))
g3 <- function(x) return(2*x -1)
plot(c(0,1),c(-1,1.5)) #X AND Y RANGES SPECIFIED???
for (f in c(g1,g2,g3)) plot (f,0,1, add = T) #add plot to existing graph


#Environment and Scope

#The top level is known as the interpreter command prompt

#Scope Hierarchy

w <- 12
f <- function(y){ #function f() has been created at top level
  d <- 8 #d is local to f()
  h <- function(){ #h is local to f()
         return(d*(w+y)) #y, d and h are global to each other within their locality f()
}    return(h())
}

#Functions have almost no side effects

#This is because functions do not change non local variables

#A function to DISPLAY the contents of a call frame

f <- function(){
  a <- 1
  return(g(a)+a)
}

g <- function(aa){
  b <- 2
  aab <- h(aa+b)
  return(aab)
}

h <- function(aaa){
  c <- 3
  return(aaa+c)
}

#showframe() to g()

g <- function(aa){
  b <- 2
  showframe(0)
  showframe(1)
  aab <- h(aa+b)
  return(aab)
}

#The showframe() function has one argument, upn, which is the number of frames to go up the call stack

#--------------------

x <- c(13,5,12)
x <- sort(x)
x

#An example is the following function, which determines the indices of odd and even numbers in a vector of integers

oddevens
function(v){
  odds <- which(v %% 2 == 1)
  evens <- which(v %% 2 == 1)
  list(o=odds,e=evens)
}

#Writing to Nonlocals with assign()

function(u) {
  assign("u",2*u,pos=.GlobalEnv)
  z <- 2*z
}

#Discrete-Event simulation in R

