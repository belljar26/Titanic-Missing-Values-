# Titanic Springboard Missing Values Assignment
library(readxl)
titanicoriginal <- read_excel("~/Desktop/Stats/titanicoriginal.xls")
# Check for NA values 
summary(titanicoriginal)
#NA age= 264
x <- mean(titanicoriginal$age, na.rm = TRUE)
x
# mean age is 29.88
titanicoriginal$age[is.na(titanicoriginal$age)] <- mean(x, na.rm=TRUE)
head(titanicoriginal)
View(titanicoriginal)

#check NA on embarked column
titanicoriginal[is.na(titanicoriginal$embarked),]
# replace NA with S
titanicoriginal$embarked[is.na(titanicoriginal$embarked)] <- "S"
titanicoriginal[168,11]
# Life Boat NA--change to "NONE"-

titanicoriginal[is.na(titanicoriginal$boat),]

titanicoriginal$boat[is.na(titanicoriginal$boat)] <-"NONE"
View(titanicoriginal)
# Missing Values for Cabin #
titanicoriginal[is.na(titanicoriginal$cabin),]
cabinnum <- as.factor(titanicoriginal$cabin)
levels(cabinnum)
#Create new column : has cabin no--assign 1 if they have a cabin no and 0 if they don't have one
titanicoriginal$cabin[is.na(titanicoriginal$cabin)] <- "NONE"
titanicoriginal$has_cabin_no <-ifelse(titanicoriginal$cabin == "NONE",
                                      "0", "1")
View(titanicoriginal)
Titanic.Clean <- titanicoriginal
write.csv(Titanic.Clean, "Titanic.Clean.csv")
View(Titanic.Clean)
