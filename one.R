mydata <- read.csv(file.choose())

install.packages("ggplot2")

library(ggplot2)

ggplot(data = mydata, mapping = aes(x = clarity, y = price))

ggplot(data = mydata, mapping = aes(x = clarity, y = price)) + geom_point()

ggplot(data = mydata, mapping = aes(x = carat, y = price)) + geom_point()

ggplot(data = mydata, mapping = aes(x = carat, y = price, color = clarity)) + geom_point()

# normal dist 
# rnorm(10)

# create a R script that will count how many of these numbers 
# fall between n-1 and 1 and dividie by the total quantity of n.
# pass value of rnorm in n.

# Function to calculate proportion of numbers between -1 and 1

n = 10
a = rnorm(n)

count = 0 
for(i in a) {
  if( i>1 & i<1){
    count = count + 1 
  }
}
print(count/n)
#########

char_vector <- c("apple", "banana", 26)
print(char_vector)

seq(1,15,3)

rep("a",10) # value, no of times (value)

y <- c(2,3)
a= z <- rep(y,5)
print(a)

vec <- c(1, 2, 3, 4, 5)

result <- vec[c(-3,1,5)]
print(result)

vec1 <- c(1,2)
vec2 <- c(5,6,7)
result1 <- vec1 + vec2
print(result1)

for(i in 1:5){
  random_num <- rnorm(1)
  print(random_num)
}

# vector of size n 
n <- 100
a <- numeric(n)

for(i in 1:n){
  a[i] <- rnorm(1)
}
print(a)

# rnorm, seq, rep, isnum, isint, isbool, sqrt, vector, typeof

?rnorm() # to know the definition.
rnorm(n, mean = 5, sd = 10)

?seq()
vec <- c(1,2,3)
seq(1,20)
seq(from = 10, to = 20, along.with = vec[1] )

?rep()

rep(5:6, each = 10)

?package.skeleton()
# It is a collection of R function data and compiled code in a well defined format.
# The directory where packages are stored in all the library

x =c(1:4)
y =c(6,3)
x *y

counter <- 1
while(counter < 5){
  print("MITS")
  counter = counter + 1;
}
