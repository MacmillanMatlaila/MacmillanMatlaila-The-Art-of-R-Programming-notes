#Data frames are like matrices but each column may be a different data mode
#Data frames are heterogeneous analogs of matrices(2 dimensional)

#Creating data frames

kids <- c("Jack","Jill")
ages <- c(12,10)
d <- data.frame(kids,ages,stringsAsFactors = FALSE)
d
# created above a matrix with kids in column 1 and ages in column 2

#A salary study------STUDY THE PROCESS

all2006 <- read.csv("2006.csv", header=TRUE,as.is = TRUE)
#example of reading in a data frame

#First we perform data cleaning
all2006 <- all2006[all2006$Wage_Per=="Year",] # exclude hourly-wagers
all2006 <- all2006[all2006$Wage_Offered_From > 20000,] # exclude weird cases
all2006 <- all2006[all2006$Prevailing_Wage_Amount > 200,] # exclude hrly prv wg

# Create a new column for the ratio between actual wage and prevailing wage
all2006$rat <- all2006$Wage_Offered_From / all2006$Prevailing_Wage_Amount

#To calculate the median in this new column for many subsets of data
medrat <- function(dataframe) {
  return(median(dataframe$rat,na.rm=TRUE))
}

#Choose occupations to be particularly interested in
#Extract subdata frames for them for convenient analyses
se2006 <- all2006[grep("Software Engineer",all2006),]
prg2006 <- all2006[grep("Programmer",all2006),]
ee2006 <- all2006[grep("Electronics Engineer",all2006),]

#In above grep() function in R identifies the rows containing the given job title 

#Analysis by firm
makecorp <- function(corpname) {
  t <- all2006[all2006$Employer_Name == corpname,]
  return(t)
}

#Creating subdata frames for a number of firms
corplist <- c("MICROSOFT CORPORATION","ms","INTEL CORPORATION","intel","
 SUN MICROSYSTEMS, INC.","sun","GOOGLE INC.","google")
for (i in 1:(length(corplist)/2)) {
  corp <- corplist[2*i-1]
  newdtf <- paste(corplist[2*i],"2006",sep="")
  assign(newdtf,makecorp(corp),pos=.GlobalEnv)
}

#Merging Data Frames

merge(data frame x, data frame y)
merge(x,y) #How it's actually written

#Example on employee database---follow the process

#Perform code cleaning to to check that each record contains the proper number of fields
count.fields("DA",sep=",")
#Alternatively
all(count.fields("DA",sep=",") >= 5)
#Alternatively
table(count.fields("DA",sep=","))
#Then read in the files as data frames:
da <- read.csv("DA",header=TRUE,stringsAsFactors=FALSE)
db <- read.csv("DB",header=FALSE,stringsAsFactors=FALSE)
#To check for possible spelling errors in the various fields
for (col in 1:6)
  print(unique(sort(da[,col])))
#Merge the two data frames, matching by employee ID
mrg <- merge(da,db,by.x=1,by.y=1) #You can use field names here instad of numbers

#Running a logistic regression model,predicting gender from the other eight variables: height, weight,rings, and so on, one at a time.
aba <- read.csv("abalone.data",header=T)
abamf <- aba[aba$Gender != "I",] # exclude infants from the analysis
lftn <- function(clmn) {
  glm(abamf$Gender ~ clmn, family=binomial)$coef
}
loall <- sapply(abamf[,-1],lftn)



