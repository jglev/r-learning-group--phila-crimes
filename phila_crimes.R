##INSTALL PACKAGES##

if(!require(data.table) |
   !require(RCurl) |
   !require(curl)) {
  install.packages(c('data.table','RCurl','curl'))
}

library(data.table)
library(RCurl)
library(curl)

##DOWNLOAD CRIME DATA##

url <- "https://data.phila.gov/api/views/sspu-uyfa/rows.csv"
phila_crimes<-fread(url)


