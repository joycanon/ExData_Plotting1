#Filename:	plot4.R
#Data Set: January 2,2007 to February 2, 2007

## household_power_consumption.txt source file is removed in the directory.
## If you want to test/run the R files, download the file on this link
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## When you're done with the download, paste it to the directory where png and R files are located.
## plot4.png is generated using this file.

##Thanks.


powerConsumptionFile <- "household_power_consumption.txt"
data <- read.table(powerConsumptionFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
JanFebData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(JanFebData$Date, JanFebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(JanFebData$Global_active_power)
globalReactivePower <- as.numeric(JanFebData$Global_reactive_power)
voltage <- as.numeric(JanFebData$Voltage)
subMetering1 <- as.numeric(JanFebData$Sub_metering_1)
subMetering2 <- as.numeric(JanFebData$Sub_metering_2)
subMetering3 <- as.numeric(JanFebData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()