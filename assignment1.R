# Assignment 1 
# Ques 1 

vec1 <- seq(5, 160, by = 5)
vec2 <- seq(87, 56, by = -1)

result <- vec1*vec2 
print(result)

# a. 
result[19:21]

# b
result[result < 2000]

# c 
sum(result > 6000)

# Ques 2 

A <- matrix(c(7,9,12,2,4,13), nrow = 2, byrow = TRUE)
B <- matrix(c(1,7,12,19,2,8,13,20,3,9,14,21), nrow = 3, byrow = TRUE)

mult_matrix <- A %*% B
print(mult_matrix)

# Ques 3 

n <- 5 
k <- 2 

generate_matrix <- function(n,k) {
  matrix <- matrix(0, nrow = n, ncol = n)
  
  diag(matrix) <- k 
  
  matrix[row(matrix) == col(matrix) - 1] <- 1 
  
  matrix[row(matrix) == col(matrix) + 1] <- 1 
  
  return(matrix)
}

result1 <- generate_matrix(5, 2)
print(result1)

# Ques 4 
weekday <- function(day, month, year) {
  if (month == 1) {
    month <- 11
    year <- year - 1
  } else if (month == 2) {
    month <- 12
    year <- year - 1
  } else {
    month <- month - 2
  }
  c <- floor(year / 100)
  y <- year %% 100
  
  f <- (floor(2.6 * month - 0.2) + day + y + floor(y / 4) + floor(c / 4) - 2 * c) %% 7
  
  if (f <= 0) {
    f <- f + 7
  }
  
  return(f)
}
day1 <- weekday(21, 2, 1963)
print(day1)
