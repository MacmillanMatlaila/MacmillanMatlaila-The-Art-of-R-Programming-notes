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
