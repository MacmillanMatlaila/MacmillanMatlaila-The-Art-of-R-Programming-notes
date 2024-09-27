installed.packages("datasets")
plot(ChickWeight)

library(MASS)
plot(UScereal$sugars,UScereal$calories)
title("plot(UScereal$sugars,UScereal$calories)")

x <- UScereal$sugars
y <- UScereal$calories
library(grid)

pushViewport(plotViewport())
pushViewport(dataViewport(x,y))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.points(x,y)
grid.text("UScereal$calories", x = unit(-3, "lines"), rot = 90)
grid.text("UScreal$sugars", y = unit(-3, "lines"), rot = 0)


x <- c(33, 45, 70, 110)
labels <- c("Soap", "Detergent", "Oil", "Shampoo")

pie(x, labels)

pie(x, labels, main = "City pie chart", col = rainbow(length(x)))

piepercent <- round(100*x/sum(x), 1)

pie(x, labels = piepercent, main = "City pie chart", col = rainbow(length(x)))
legend("topright", c("Soap", "Shampoo", "Oil", "Grocery"), cex = 0.8, fill = rainbow(length(x)))


install.packages("plotrix")
library(plotrix)

x <- c(33,45,70,110)
lbl <- c("Soap", "Detergent", "Oil", "Shampoo")

pie3D(x, labels = lbl, explode = 0.1, main = "Pie Chart of Countries")


v <- c(9,13,21,8,36,22,12,41,31,33,19)
hist(v,xlab = "Weight", col = "green", border = "red")
hist(v,xlab = "Weight", col = "green", border = "red", xlim = c(0,40), ylim = c(0,5), breaks = 5)

data("airquality")
View(airquality)

plot(airquality$Ozone, airquality$Wind)
plot(airquality$Ozone, airquality$Wind, col = "red")
plot(airquality$Ozone, airquality$Wind, type = "h", col = "blue")

plot(airquality)

plot(airquality$Ozone, xlab = "Ozone Concentration", ylab = "No Of Instanes", main = "Ozone levels in NY City", col = "green")

hist(airquality$Solar.R)
hist(airquality$Solar.R, main = "Solar Radiation in air", xlab = "Solar rad")

Temperature <- airquality$Temp
hist(Temperature)

h <- hist(Temperature, ylim = c(0,40))
text(h$mids,h$counts, labels=h$counts, adj=c(0.5, -0.5))


hist(Temperature,
     main = "Maximum daily temperature at La Guardia Airport",
     xlab = "Temperature in degrees Fahrenheit",
     xlim = c(50, 100),
     col = "Chocolate",
     border = "brown",
     breaks = c(55,60,70,75,80,100))


boxplot(airquality$Solar.R)
boxplot(airquality[,0:4], main = "Multiple Box plots")


install.packages("ggplot2")
library(ggplot2)
attach(mtcars)

pl <- ggplot(mtcars, aes(factor(cyl), mpg))
pl + geom_boxplot()

pl+ geom_boxplot() + coord_flip()

pl + geom_boxplot(aes(fill = factor(cyl)))

mtcars$gear <- factor(mtcars$gear, levels = c(3,4,5),
                      labels = c("3gears", "4gears", "5gears"))

mtcars$am <- factor(mtcars$am, levels = c(0,1),
                     labels = c("Automatic", "Manual"))

mtcars$cyl <- factor(mtcars$cyl, levels = c(4,6,8),
                     labels = c("4cyl", "6cyl", "8cyl"))

mtcars$cyl
mtcars$gear
View(mtcars)


ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point()

ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = "red")) + geom_point()

ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, col = "red", size = qsec)) + geom_point()

ggplot2::mpg
View(ggplot2::mpg)

ggplot(data = ggplot2::mpg, aes(class)) + geom_bar()


ggplot(data = ggplot2::mpg, aes(class)) + geom_bar(aes(fill = drv))


ggplot(data = ggplot2::mpg, aes(class)) + geom_bar(aes(fill = drv), position ="dodge")


ggplot(data = ggplot2::mpg) + geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = ggplot2::mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))


install.packages("plotly")
library(plotly)

p <- plot_ly(data = mtcars, x = ~hp, y = ~wt, marker = list(size = 10, color = "rgba(255, 182, 193, .9)", line = list(color = "rgba(152, 0, 0, .8)", width =2)))
p

p <- plot_ly(data = mtcars, x = ~hp, y = ~wt, color = ~hp, size = ~hp)
p

