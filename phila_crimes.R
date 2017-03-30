#INSTALL/LOAD NECESSARY PACKAGES#

if(!require(data.table) |
   !require(RCurl) |
   !require(curl) |
   !require(dplyr) |
   !require(readr)) {
  install.packages(
    c('data.table','RCurl','curl','dplyr','readr'))
}

library(data.table)
library(RCurl)
library(curl)
library(dplyr)
library(readr)

##IMPORT DATA##

phila_crimes_10percent <- read_csv("#YOUR WD#/r-learning-group--phila-crimes/phila_crimes_10percent.csv")
View(phila_crimes_10percent)