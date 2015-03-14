# Have total emissions from PM2.5 decreased in the Baltimore City,  (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Reading Data

setwd("~/Documents/Scientific Data/Exploratory Data/Project2")

unzip("exdata-data-NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

PM25_Balti<-NEI[NEI$fips=="24510",]
PM25_perYear<-aggregate(PM25_Balit$Emissions, list(PM25_Balit$year),sum)

names(PM25_perYear)<-c("year","TotalPM2.5")

png(file="plot2.png")
plot(PM25_perYear$year, PM25_perYear$TotalPM2.5, xlab="year", ylab="Total PM2.5")
dev.off()