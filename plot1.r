## plot1.r
## Downloaded the file "exdata-data-household_power_consumption.zip"
## and extracted the text file "household_power_consumption.txt" and place it
## in the working directory - that is commented out: for the person to place the same file
## in the local directory that (s)he prefers
############################################################################################
rm(list=ls())
setwd("C:/Exploratory Data Analysis/Course Projects/Assignment 1")
master_table <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
master_table$Date <- as.Date(master_table$Date, format="%d/%m/%Y")
days_in_feb <- master_table[(master_table$Date=="2007-02-01") | (master_table$Date=="2007-02-02"),]
days_in_feb$Global_active_power <- as.numeric(as.character(days_in_feb$Global_active_power))
hist(days_in_feb$Global_active_power, main = paste("Global Active Power"), col="green", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())
