##DOWNLOAD CRIME DATA##
download.file("https://data.phila.gov/api/views/sspu-uyfa/rows.csv", destfile ="phila_crimes_scraped",method ="curl")
phila_crimes<-read.csv("~/Downloads/phila_crimes_scraped")
