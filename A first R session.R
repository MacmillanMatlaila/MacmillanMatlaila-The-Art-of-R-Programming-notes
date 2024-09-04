x <- c(1,2,4) #making a simple data set,here we've assigned a vector to x. c stands for concatenate
q <- c(x,x,8) #including the duplicates the elements are all set to q

x  #Calling x outputs 1,2,4 which was set to x
x[3] #Calling x[3] which is with a index/subscript 3 outputs the 3rd element
mean(x) # We can easily find the mean and and standard deviation of our set
sd(x) #standard deviation
y <- mean(x) #We can also save the computed mean in a variable
y #This then should output the mean(x) as declared before
data() #loads on of Rs internal data sets
mean(Nile) #Mean of the data set on the flow of the river Nile
sd(Nile) #Standard deviation of the data set on the river Nile
hist(Nile) #Plotting a histogram of the data
hist(Nile, breaks=12) #Drawing a histogram of the data set Nile with 12 bins

