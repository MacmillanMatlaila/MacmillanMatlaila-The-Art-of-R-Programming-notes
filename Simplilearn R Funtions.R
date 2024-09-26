hello_world <- function(){
  print('hello world in R!')
}
hello_world()  

hello_name <- function(name){
  print(paste('hello',name))
}

hello_name('Thato')


full_name <- function(name='Thato',title='Matlaila'){
  return(paste(name,' ',title))
} 
full_name() 

full_name1 <-full_name('Mamillan', 'Matlaila') 
full_name1 
 

normaldist <- rnorm(1000,0,1)
mean(normaldist)
hist(normaldist)


expoValue <- function(x, power=2){
  hist(x^power)
}  

expoValue(normaldist)

expoValue <- function(x, exp = 2, hist = FALSE, ...){
  if(hist == TRUE){
    hist(x ^ exp)
    x^exp
  }
}

expoValue(normaldist, power = 2, breaks = 50)


expoValue <- function(x, exp = 2,hist = FALSE, ...){
  if(hist == TRUE){
    hist(x ^ exp )
  }else{
    x^exp
  }
}

expoValue(normaldist)
expoValue(normaldist, hist = TRUE)


amount <- function(x=100){
  t=x+x*(20/100)
  return(t)
  }

amount(100)


amount1 <- function(amt){
  if(amt>0) famt=amt+amt*(20/100)
  if(amt<=0) famt=amt
  return(famt)
}

amount1(100)


f1 <- function(x){
  y = 10
  g1 = function(x){
    y+(x*x)
  }
  g1(x)
} 

f1(10)


g2 <- function(x){
  y+(x*x)
}

f2 <- function(x){
  y=10
  g2(x)
  }
f2(10)

g2 <- function(x,y){
  y+(x*x)
}


f2 <- function(x){
  y=10
  g2(x,y)
}

f2(10)





status <- function(marks)
{
  result = "Not Defined"
  if(marks>50) result = "Pass"
  message("Your result is"," ",result)
}
status(60)
status(30)



status <- function(age)
{
  ageGrp = "Not Defined"
  vote = "Not Defined"
  if(age>=18)
  {
    ageGrp = "ADULT"
    vote = "YES"
  }
  message("Your age group is ",ageGrp)
  message("Voting status is ",vote)
}

status(20)


status <- function(name)
{
  len <- nchar(name)
  if(len>5) name = toupper(name)
  message("User given name is ",name)
}
status("Macmillan")
status("Tshepo")


get_bonus <- function(salary,exp)
{
  if(exp>5)
  {
    bonus_per = 10
  }else
  {
    bonus_per = 5
  }
  bonus = salary*(bonus_per/100)
  return(bonus)
}

get_bonus(25000,6)
get_bonus(25000,3)


get_group <- function(age)
{
  if(age>0)
  {
    if(age<18)
    {
      ageGrp = "KIDS"
    }else if(age<60)
    {
      ageGrp = "ADULT"
    }else
    {
      ageGrp = "SENIOR"
    }
  }  else
    {
      ageGrp="Not defined"
      message("wrong Age")
    }
    message("Your age group is ",ageGrp)
}

get_group(10)
get_group(40)
get_group(65)
get_group(-10)


HRA <- function(city)
{
  hra_amt <- switch(toupper(city),
                    BLR = 7500,
                    MUM = 1000,
                    DEL = 8000,
                    CHN = 7500,
                    5000
                    )
  return(hra_amt)
}

HRA("BLR")
HRA("PUNE")
HRA("blr")


salary_range <- function(band)
{
  range <- switch(band,
                  L1 = "10000-15000",
                  L2 = "15000-25000",
                  L3 = "25000-4000",
                  )
  return(range)
}

salary_range("L1")
salary_range("B1")



time <-15
repeat
{
  message("Hello, Welcome to R tutorial for beginners!")
  if(time >= 20) break
  time = time+1
}

sqr <- function(n)
{
  repeat
  {
    square = n*n
    message("The square is ",square)
    if(square>=100) break
    n = n+1
  }
  return(n)
}

sqr(6)


get_finalbal <- function(amt,year,rate){
  for (i in 1:year) 
    {
      interest = round(amt*rate/100,2)
      finalamt = amt + interest
      message("year=", i ,"amt = ", amt, "interest=",interest, "final amt=", finalamt)
      amt = finalamt
  }
  return(finalamt)
}

get_finalbal(5000,5,8)
get_finalbal(10000,10,5)



req_years <- function(amount=550)
{
  famt = 0;month=0
  while(famt<=8000)
  {
    month=month+1
    famt=famt+amount
    message("Month=" ,month, "final_amount=" , famt)
  }
  year=month/12
  return(year)
}

req_years()
req_years(750)



