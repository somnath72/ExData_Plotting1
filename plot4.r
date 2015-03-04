## plot4.r
## Downloaded the file "exdata-data-household_power_consumption.zip"
## and extracted the text file "household_power_consumption.txt" and place it
## in the working directory - that is commented out: for the person to place the same file
## in the local directory that (s)he prefers
## All of them
############################################################################################
rm(list=ls())
setwd("D:/Nijer/Somnath/Somnath/Books_Pers/MISC - VERY USEFUL/Backed Up/COURSERA/JHDSS - John Hopkins Course/4 - Exploratory Data Analysis/Course Projects/Assignment 1")
master_table <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
master_table$Date <- as.Date(master_table$Date, format="%d/%m/%Y")
days_in_feb <- master_table[(master_table$Date=="2007-02-01") | (master_table$Date=="2007-02-02"),]

days_in_feb$Sub_metering_1 <- as.numeric(as.character(days_in_feb$Sub_metering_1))
days_in_feb$Sub_metering_2 <- as.numeric(as.character(days_in_feb$Sub_metering_2))
days_in_feb$Sub_metering_3 <- as.numeric(as.character(days_in_feb$Sub_metering_3))
days_in_feb$Global_active_power <- as.numeric(as.character(days_in_feb$Global_active_power))
days_in_feb$Global_reactive_power <- as.numeric(as.character(days_in_feb$Global_reactive_power))
days_in_feb$Voltage <- as.numeric(as.character(days_in_feb$Voltage))

days_in_feb <- transform(days_in_feb, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## The frame - 2 by 2 display of graphs
par(mfrow=c(2,2))

## First graph
plot(days_in_feb$timestamp,days_in_feb$Global_active_power, type="l", xlab="", ylab="Global Active Power", col="green")

## Second graph
plot(days_in_feb$timestamp,days_in_feb$Voltage, type="l", xlab="datetime", ylab="Voltage", col="brown")

## Third graph
plot(days_in_feb$timestamp,days_in_feb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="purple")
lines(days_in_feb$timestamp,days_in_feb$Sub_metering_2,col="red")
lines(days_in_feb$timestamp,days_in_feb$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

plot(days_in_feb$timestamp,days_in_feb$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png has been saved in", getwd())
