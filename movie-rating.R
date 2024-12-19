movie<- read.csv(file.choose())
summary(movie)
str(movie)
colnames(movie)<-c("Film","Genre","Critics Rating", "Audience Ratings","Budget_m","year")
head(movie)
str(movie)
movie$year<- factor(movie$year)
str(movie)

library(ggplot2)
ggplot(data=movie,aes(x=`Audience Ratings`,y=`Critics Rating`, colour=year))+geom_point()
p <- ggplot(data=movie,aes(x=`Audience Ratings`,y=`Critics Rating`, colour=`Genre`, size=`Budget_m`))+geom_point()

p + geom_point()+geom_line()   
p+geom_point(aes(color='DarkGreen'))

q <- ggplot(data=movie, aes(x=`Budget_m`))
q + geom_histogram(aes(fill=`Genre`))
# q + geom_density(aes(fill=`Genre`, position='stack'))

r <- ggplot(data=movie, aes(x=`Audience Ratings`))
r + geom_histogram(fill='White', color='Black')

ls()
