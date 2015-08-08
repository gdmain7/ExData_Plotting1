## Exploratory Data Analysis
## Week 1 Project - Plot 1

rm(list = ls())

## download and unzip files
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./exdata-data-household_power_consumption.zip")
unzip(zipfile="./exdata-data-household_power_consumption.zip")
    
## read in data
powerdata<-read.table("./household_power_consumption.txt",sep=";",na.strings='?',stringsAsFactors=FALSE,header=TRUE)

## create a new column and convert dates and time
powerdata$DateTime<-strptime(paste(powerdata$Date,powerdata$Time),"%d/%m/%Y %H:%M:%S") 

## take only data between 2007-02-01 and 2007-02-02.
powerdata3<-subset(powerdata, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

## Plot 3
png(file="plot3.png", width=480, height=480)
with(powerdata3, plot(DateTime, Sub_metering_1, type="l", col="black",xlab="",ylab="Energy sub metering")) ##,type="n"
with(powerdata3, points(DateTime, Sub_metering_2, type="l", col ="red"))
with(powerdata3, points(DateTime, Sub_metering_3, type="l", col ="blue"))
legend("topright", lty=1, lwd=2.5, col = c("black", "red", "blue"), legend = names(powerdata3)[7:9])
dev.off()