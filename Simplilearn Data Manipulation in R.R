#DPLYR

install.packages("dplyr")
library(dplyr)
install.packages('nyflights13')
library('nycflights13')
View(flights)
head(flights)

f1 <- filter(flights, month==07)
View(f1)

f2 <- filter(flights, month==07, day==3)
f2
View(f2)

View(filter(flights, month==09, day==2, origin=='LGA'))


slice(flights, 1:5)
slice(flights, 5:10)

over_delay <- mutate(flights,overall_delay=arr_delay-dep_delay)
View(over_delay)

summarise(flights,avg_air_time=mean(air_time,na.rm=T))
summarise(flights,tot_air_time=sum(air_time,na.rm=T))
summarise(flights,avg_air_time=sd(air_time,na.rm=T))
summarise(flights,avg_air_time=mean(air_time,na.rm=T),tot_air_time=sum(air_time,na.rm = T))


head(mtcars)
by_gear <- mtcars %>% group_by(gear)
by_gear
View(by_gear)


a <- summarise(by_gear,gear1=sum(gear), gear2=mean(gear))
a


summarise(group_by(mtcars,cyl), mean(gear, na.rm = TRUE))

b <- by_gear %>% summarise(gear1=sum(gear),gear2=mean(gear))
b
View(b)


by_cyl <- mtcars %>% group_by(cyl)

by_cyl %>% summarise(
  gear = mean(gear),
  hp = mean(hp)
)
head(by_cyl)


sample_n(flights,15)
sample_frac(flights,0.4)

View(arrange(flights,year,dep_time))
head(arrange(flights, desc(dep_time)))

df <- mtcars
df
View(mtcars)


result <- arrange(sample_n(filter(df,mpg>20),size = 5),desc(mpg))
View(result)


a <- filter(df,mpg>20)
b <- sample(a,size = 5)
result <- arrange(b,desc(mpg))
result

result <- df %>% filter(mpg>20) %>% sample_n(size=10) %>% arrange(desc(mpg))
result


df_mpg_hp_cyl = df %>%  select(mpg,hp,cyl)
df
head(df_mpg_hp_cyl)


#TIDYR

install.packages('tidyr')
library('tidyr')

n=10

wide <- data.frame(
  ID = c(1:n),
  Face.1 = c(411,723,325,456,579,612,709,513,527,379),
  Face.2 = c(123,300,400,500,600,654,789,906,413,567),
  Face.3 = c(1457,1000,569,896,956,2345,780,599,1023,678)
)
View(wide)


long <- wide %>%  gather(Face, ResponseTime,Face.1:Face.3)
View(long)

long_separate <- long %>% separate(Face, c("Target", "Number"))
View(long_separate)


long_unite <- long_separate %>% unite(Face, Target, Number, sep = ",")
View(long_unite)

back_to_wide <- long_unite %>% spread(Face, ResponseTime)
View(back_to_wide)



