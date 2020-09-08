# Imput the data from csv files
mydf<- read.csv(file.choose())

# Explore the data frame
head(mydf)
summary(mydf)
str(mydf)
tail(mydf)
factor(mydf$Year)

#Data Framing
mydf1960<-data.frame(CountryCode=Country_Code,LifeExpectation1960 = Life_Expectancy_At_Birth_1960 )
mydf2013<-data.frame(CountryCode=Country_Code,LifeExpectation2013 = Life_Expectancy_At_Birth_2013 )

# Merged the values to mydf seperating years into two data frames 
mynewdf1960<- merge(mydf,mydf1960,by.x= "Country.Code", by.y="CountryCode")
mynewdf2013<- merge(mydf,mydf2013,by.x= "Country.Code", by.y="CountryCode")

# Explore mynewdf1960 and visulizing it by qplot
head(mynewdf1960)
visulizationdf1960<-mynewdf1960[mynewdf1960$Year==1960,]
visulizationdf1960$Year<-NULL
head(visulizationdf1960)
summary(visulizationdf1960)
install.packages("ggplot2")
qplot(data=visulizationdf1960, x=Fertility.Rate, y= LifeExpectation1960, size = I(3),color = Region,main ="Fertility Rate VS LifeExp(1960)")

# Explore mynewdf2013 and visulizing it by qplot
head(mynewdf2013)
visulizationdf2013<-mynewdf2013[mynewdf2013$Year==2013,]
visulizationdf2013$Year<-NULL
head(visulizationdf2013)
summary(visulizationdf2013)
qplot(data=visulizationdf2013, x=Fertility.Rate, y= LifeExpectation2013, size = I(3),color = Region,main ="Fertility Rate VS LifeExp(2013)")

