#INSTALL/LOAD NECESSARY PACKAGES#

if(!require(data.table) |
   !require(RCurl) |
   !require(curl) |
   !require(dplyr) |
   !require(readr) |
   !require(tidyr) |
   !require(ggplot2)) {
  install.packages(
    c('data.table','RCurl','curl','dplyr','readr','tidyr','ggplot2'))
}

library(data.table)
library(RCurl)
library(curl)
library(dplyr)
library(readr)
library(ggplot2)
library(tidyr)

##IMPORT##

phila_crimes_10percent <- read_csv("C:/Users/BrookSte/Desktop/Learning R/r-learning-group--phila-crimes/phila_crimes_10percent.csv")
View(phila_crimes_10percent)

##CLEAN + ADD VARs##

phila_crimes_10percent$X1<-NULL

summary(phila_crimes_10percent)

phila_crimes_10percent$District=as.numeric(phila_crimes_10percent$District)

summary(phila_crimes_10percent)

  #Create a variable to collapse Police Districts into Court Divisions#

phila_crimes_10percent$CourtDivision <- NA

attach(phila_crimes_10percent)
phila_crimes_10percent$CourtDivision[District==12|District==77|District==18|District==19|District==16] <- "Southwest" 
phila_crimes_10percent$CourtDivision[District==22|District==9|District==6|District==17|District==3|District==1] <- "Central & South"
phila_crimes_10percent$CourtDivision[District==2|District==15|District==7|District==8] <- "Northeast" 
phila_crimes_10percent$CourtDivision[District==5|District==14|District==35|District==39] <- "Northwest" 
phila_crimes_10percent$CourtDivision[District==25|District==24|District==26] <- "East" 
detach(phila_crimes_10percent)

  #check to make sure variable is working properly#
table(phila_crimes_10percent$District, phila_crimes_10percent$CourtDivision)
  #Can see that not all Districts got mapped onto a Crime Division...Why?#

##DESCRIBE##
summary(phila_crimes_10percent)

  #how many unique categories of crime do we have#
n_distinct(phila_crimes_10percent$`UCR Code`, na.rm=TRUE)

n_distinct(phila_crimes_10percent$`General Crime Category`, na.rm=TRUE)
  
  #UCR Code and Gen. Crime Category don't match exactly#
  #For which UCR Codes do we have multiple Crime Categories?#
crimetypes<-data.frame(table(phila_crimes_10percent$`UCR Code`,phila_crimes_10percent$`General Crime Category`))
crimetypes$Freq[crimetypes$Freq==0]<-NA
crimetypes<-drop_na(crimetypes)
  #Or, Alternatively, we Could Graph it to find out...#
crimetype<-ggplot(
phila_crimes_10percent,
aes(x=phila_crimes_10percent$`UCR Code`, y=phila_crimes_10percent$`General Crime Category`))

crimetypescatter<-crimetype+geom_point()+theme_classic()
crimetypescatter

  #When do Crimes Happen?#




