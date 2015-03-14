# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# Reading Data

setwd("~/Documents/Scientific Data/Exploratory Data/Project2")

unzip("exdata-data-NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <-factor(NEI$year)

PM25_perYear<-aggregate(NEI$Emissions, list(NEI$year),sum)
names(PM25_perYear)<-c("year","TotalPM2.5")

png(file="plot1.png")  

plot(PM25_perYear$year, PM25_perYear$TotalPM2.5, xlab="year", ylab="Total PM2.5")

dev.off()