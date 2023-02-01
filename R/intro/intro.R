# Title: Introduction to R

# To print a value, use the print() function.
print("Hello, world!")

# To print a value without the print() function, use the value itself.

# to show the current working directory, use the getwd() function.
getwd()

# To create a new directory, use the dir.create() function.
# dir.create("data")
# dir.create("data/raw_data")

# R has 5 basic data types: logical, integer, numeric, complex, and character.
# To assign a value to a variable, use the assignment operator, <-.
x <- 1:10
t <- TRUE

# To create a sequence of numbers, use the colon operator, :.
z <- 1:10

# To create a sequence of numbers with a step size, use the seq() function.
w <- seq(1, 10, by = 2)

# Data types
# To check the data type of a variable, use the class() function.
class(x) # numeric
class(t) # logical
class(y) 

# To check the length of a variable, use the length() function.
length(x)

# R has 3 basic data structures: vectors, matrices, and data frames.
# To create a vector, use the c() function.
y <- c(1, 2, 3, 4, 5)

# To create a matrix, use the matrix() function.
m <- matrix(1:9, nrow = 3, ncol = 3)

# To create a data frame, use the data.frame() function.
df <- data.frame(x = 1:10, y = 1:10)

# R operators
# Mathematical operators: +, -, *, /, ^, %%
# Logical operators: >, <, >=, <=, ==, !=
# Logical operators: &, |, !




# Test your knowledge
# using iris dataset
data("iris")
View(iris)

plot(iris)

boxplot(iris$Sepal.Length ~ iris$Species)

setwd("/home/kurs/Desktop/biol217/R/intro")


# install.packages("ggplot2")
# install.packages(c("readxl", "plotly"))
install.packages("tidyverse")
install.packages("svglite", dependencies = TRUE)
library(ggplot2)
library(svglite)

setRepositories()

# Plotting with ggplot2
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, size = Petal.Length*Petal.Width)) +
  geom_point()

plot1 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, size = Petal.Length*Petal.Width)) +
  geom_point()

ggsave("Iris.tiff", plot1, width = 20, height = 10, unit = "cm", dpi = 300)

ggsave("Iris_compressed.tiff", plot1, width = 20, height = 10, unit = "cm", dpi = 300, compression = "lzw")

ggsave("Iris2.pdf", plot1)

ggsave("Iris2.svg", plot1)

svglite("Iris.svg", width = 20, height = 10, pointsize = 12)



# Reshaping data with tidyr
library(tidyr)
library(plotly)
library(readxl)

spread(iris, Species, ?)

# spread iris dataset to wide format using tidyr spread() function



new_table <- spread(iris, Petal.Length, Sepal.Length)
View(new_table)

wide_table <- pivot_wider(iris, names_from = Petal.Length, values_from = Sepal.Length)
View(wide_table)

long_table <- pivot_longer(iris, cols = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width), names_to = "Measurement", values_to = "Value")
View(long_table)


# visualizing distribution
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)

# visualizing outliers
boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width)
boxplot(iris$Petal.Length)
boxplot(iris$Petal.Width)

# Statistical analysis of normal distributed data
# 1 sample t-test
# 2 sample t-test
# more than 2 samples ANOVA



# More plotting with ggplot2
data()
View(DNase)

ggplot(DNase, aes(x = conc, y = density)) + geom_point()
 + xlab("Concentration") + ylab("Density") + ggtitle("DNase I activity")
  + ggsave("DNase.jpg")

ggplot(DNase, aes(x = conc, y = density)) + geom_point() + ggsave("DNase.jpg")
hist(DNase$density)
hist(DNase$conc)
