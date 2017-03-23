##DOWNLOAD CRIME DATA##

library(data.table)

library(RCurl)

library(curl)



url <- "https://data.phila.gov/api/views/sspu-uyfa/rows.csv"



phila_crimes<-fread(url)


