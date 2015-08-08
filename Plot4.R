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

## Plot 4
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(powerdata3, {
        plot(DateTime, Global_active_power, type="l", xlab="",ylab="Global Active Power") 
        plot(DateTime, Voltage, type="l", xlab="datetime",ylab="Voltage")

        plot(DateTime, Sub_metering_1, type="l", col="black",xlab="",ylab="Energy sub metering") ##,type="n"
        points(DateTime, Sub_metering_2, type="l", col ="red")
        points(DateTime, Sub_metering_3, type="l", col ="blue")
        legend("topright", lty=1, lwd=1, col = c("black", "red", "blue"), legend = names(powerdata3)[7:9])
        
        plot(DateTime, Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power") 
})
dev.off()
par(mfrow = c(1, 1))