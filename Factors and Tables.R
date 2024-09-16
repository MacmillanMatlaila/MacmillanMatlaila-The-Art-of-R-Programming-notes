#Factors in R is just a vector with a bit more information
#The extra information: record of the distinct values in the vector

x<- c(5,12,13,12)
xf <- factor(x)
xf
str(xf)
length(xf)
xff <- factor(x,levels=c(5,12,13,88)) #how to add a new element to a factor
#You cannot do it using the traditional index method as it would mean sneaking in an illegal level

tapply(vector,factor,function)

ages <- c(25,26,55,37,21,42)
affils <- c("R","D","D","R","U","D")
tapply(ages,affils,mean)


#Subgroups:

#subgroups:
• Male and under 25 years old
• Female and under 25 years old
• Male and over 25 years old
• Female and over 25 years old

#Here’s a toy example of that setting:

d <- data.frame(list(gender=c("M","M","F","M","F","F"),
                     age=c(47,59,21,32,33,24),income=c(55000,88000,32450,76500,123000,45650)))
d
#LOOK AT WHAT CALLING d DID

d$over25 <- ifelse(d$age > 25,1,0) @Adds a column for the over 25
d

tapply(d$income,list(d$gender,d$over25),mean)

split(vector,factor)

split(d$income, list(d$gender, d$over25))

#The output of split is a list 

by() #Works like tapply but is applied to objects rather than vectors

#Working with tables

u <- c(22,8,33,6,8,29,-2)
fl <- list(c(5,12,13,12,13,5,13),c("a","bc","a","a","bc","a","a"))
tapply(u,fl,length)
table(fl)
#Typically a data frame serves as the table() data argument

table(c(5,12,13,12,8,5)) #one dimensional count, therefore counts on a single vector.

t <- data.frame(list(gender=c("M","M","F","M","F","F"), race=c("W","W","A","O","B","B"),pol=c("L","L","C","L","L","C")))
t
vt <- table(t)
vt

#Matrix/Array operations on tables
#The cell counts portion of a table object is an array

#subtable() performs subtable extraction
#tb1 : the table of interest of class "table"
#subnames : A list specifying the desired subtable extraction, each section named  after a dimension of tb1 and the value of that component is a vector of the names of the desired levels.

subtable <- function(tbl,subnames) {
 # get array of cell counts in tbl
tblarray <- unclass(tbl)
 # we'll get the subarray of cell counts corresponding to subnames by
 # calling do.call() on the "[" function; we need to build up a list
 # of arguments first
dcargs <- list(tblarray)
ndims <- length(subnames) # number of dimensions
for (i in 1:ndims) {
dcargs[[i+1]] <- subnames[[i]]
}
subarray <- do.call("[",dcargs)
 # now we'll build the new table, consisting of the subarray, the
 # numbers of levels in each dimension, and the dimnames() value, plus
 # the "table" class attribute
dims <- lapply(subnames,length)
subtbl <- array(subarray,dims,dimnames=subnames)
class(subtbl) <- "table"
return(subtbl)
}

#To get the desired subarray, I needed to form a subsetting expression on the array tblarray 

tblarray[some index ranges here]


do.call(f, argslist)

#tabdom() function allows you to focus on calls with largest frequencies

tabdom(tbl,k)

d <- c(5,12,13,4,3,28,12,12,9,5,5,13,5,4,12)
d
dtab <- table(d)
dtab
tabdom(dtab,3)

#Presenting tables in a data frame format

# finds the cells in table tbl with the k highest frequencies; handling
 # of ties is unrefined
tabdom <- function(tbl,k) {
   # create a data frame representation of tbl, adding a Freq column
   tbldf <- as.data.frame(tbl)
   # determine the proper positions of the frequencies in a sorted order
   freqord <- order(tbldf$Freq,decreasing=TRUE)
   # rearrange the data frame in that order, and take the first k rows
   dom <- tbldf[freqord,][1:k,]
   return(dom)
}

#The aggregate() function calls tappply once for each variable in a group
aggregate(aba[,-1],list(aba$Gender),median)

#The cut() function generates factors especially for tables

y <- cut(vector x,bins,labels=FALSE)

