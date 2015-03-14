# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

library(dplyr)
library(ggplot2)

# Reading Data

setwd("~/Documents/Scientific Data/Exploratory Data/Project2")

unzip("exdata-data-NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

PM25_Balti<-NEI[NEI$fips=="24510",]
PM25_Balti<-select(PM25_Balti, Emissions:year)

byType_perYear<-aggregate(. ~type + year, PM25_Balti, sum)

byType_perYear<-transform(byType_perYear, type=factor(type))
qplot(year, Emissions, data=byType_perYear, facets=.~type, asp=3/4)+geom_smooth()


