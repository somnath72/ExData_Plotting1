## plot3.r
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

days_in_feb$Sub_metering_1 <- as.numeric(as.character(days_in_feb$Sub_metering_1))
days_in_feb$Sub_metering_2 <- as.numeric(as.character(days_in_feb$Sub_metering_2))
days_in_feb$Sub_metering_3 <- as.numeric(as.character(days_in_feb$Sub_metering_3))

days_in_feb <- transform(days_in_feb, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## Draw the graph
plot(days_in_feb$timestamp, days_in_feb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(days_in_feb$timestamp,days_in_feb$Sub_metering_2,col="brown")
lines(days_in_feb$timestamp,days_in_feb$Sub_metering_3,col="blue")

## Add legend to the graph
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())
