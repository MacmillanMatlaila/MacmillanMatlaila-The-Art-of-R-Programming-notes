#Structure of a list can combine different data modes or types
#Common operation is indexing remember []
#Lists are referred to as recursive vectors because they can be broken down into smaller components
#Creating a list with employee name(char) , salary(numerical), and Boolean(logical) indicating union membership
#we basically create a list of lists

m <- list(name="MacMillan", salary="55000", union=TRUE)
k <- list(name="Kate", salary="65000", union=FALSE)
t <- list(name="Thato", salary="70000", union=FALSE)
p <- list(name="Pretty", salary="100000", union=TRUE)

#List indexing
#We use double brackets to index lists

m[["name"]]
k[["salary"]]
t[["union"]]

#Adding list elements

z <- list(a="abc", b=12)
z$c <- "sailing"    Adds element "sailing" to list z
z

z[[4]] <- 28 #Adds element 28 at index 4 of list z
z[5:7] <- c(FALSE,TRUE,TRUE) #adds logical elements from indices 5 through 8
z

z$b <- NULL #Deletes a list component
z

length(z) #length of list

#Example for Contextual analysis- finding words and their locations in a text file

findwords("testconcorda.txt")
read 68 items

findwords <- function(tf){
  #This reads in the words from the file into a vector of mode char
  txt <- scan(tf,"")
  wl <- list()
  for (i in 1:length(txt)) {
    wrd <- txt[i] #ith word in input file
    wl[[wrd]] <- c(wl[[wrd]],i)
  }
  return(wl)
  
}

#Accessing list components and values

Pretty straight-forward

#Applying functions to lists 

lapply(list(1:3,25:29),median)
sapply(list(1:3,25:29),median)

#Example for Contextual analysis
#Code to list in alphabetical order by word:

alphawl <- function(wrdlst){
  nms <- names(wrdlst) #The words
  sn <- sort(nms) #Same words in alpha order
  return(wrdlst[sn]) #return rearranged version

}

#MacMillan Matlaila's ELITE quotes - 

#There are many ways to hammer a nail, you can use a hammer, a brick or even your bare hands.
#programming is about understanding the functionality of each solution when applied to your use case
#therefore at first you may not understand the pain that comes  with hammering a nail with your bare hands and that becomes your go to solution
#but as time spent studying and experience accrues you will discover you can also hammer a nail with a brick, and as more time accrues you will understand how and why using a hammer is the better solution

#Sorting by word frequency

freqwl <- function(wordlst){
  freqs <- sapply(wrdlst,length) #get word frequencies
  return(wrdlst[order(freqs)])
}