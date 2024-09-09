#Matrices - special cases of objects arrays , a matrix is a vector with 2 additional attributes, number of rows and columns.
#remember the elements of a vector must all have the same mode/data type
#Therefore a matrix must also have the same mode but with 2 attributes - rows & columns
              
y <- matrix(c(1,2,3,4),nrow=2,ncol=2)
y

#Above code creates a matrix with 2 rows and 2 columns

#Remember the order is (column 1 row 1, column 1 row 2, column 2 row 1, column 2 row 2)

y <- matrix(nrow,ncol=2)
y[1,1] <- 8 #puts element 8 in row 1 column 1
y[2,1] <- 4 #puts element 4 in row 2 column 1
y[1,2] <- 7 #puts element 7 in row 1 column 2
y[2,2] <- 9 #puts element 9 in row 2 column 2
y

#byrow=T

m <- matrix(c(1,2,3,4,5,6),nrow=2, byrow=T)
#sets concatenated matrix to m and forces R to go byrow instead of columns


