##---#Operations on Vectors and Matrices----##

#Operation subscript/indexing [] on Vectors

#Vectors have the same mode/data type elements
x <- c(element at index 1,element at index 2,element at index 3) ----#Assign

x[element index/posession]-----#Foundation to always refer to
  
#Matrix and arrays have multiple attributes --- rows and columns

y <- matrix(c(element at index 1,element at index 2,element at index 3),nrow=2,ncol=2)----#Assign created matrix to y

y[row number,] or y[,column number]

y[1:10,] or y[,1:3] #Sequences data by row or column e,g row 1 to row 10 or column 1 to column 3

y[row number,column number] <- Elements I want to inser at row number, column number

y[c(first row, other row), ] <- matrix(c(element to insert in row 1, element to insert in other row, element to insert in row 1, element to insert in other row))


####---------------------------------------#############

#
