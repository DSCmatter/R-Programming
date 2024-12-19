# demographic.csv

stats <- read.csv(file.choose())
stats 
getwd()
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
str(stats)
summary(stats)
stats[3, "Birth.rate"]
stats$Internet.users[2]
stats[, "Internet.users"]
labels(stats$Income.Group)
stats[1:10,]
stats[, 1:5]
is.data.frame(stats[1, drop=F])
stats$cal <- stats$Birth.rate*stats$Internet.users
stats
head(stats)
