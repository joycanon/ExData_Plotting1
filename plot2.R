# Filename:	plot2.R
# Data Set: January 2, 2007 to February 2, 2007

## household_power_consumption.txt source file is removed in the directory.
## If you want to test/run the R files, download the file on this link
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## When you're done with the download, paste it to the directory where png and R files are located.
## plot2.png is generated using this file.

## Thanks.

powerConsumptionFile <- "household_power_consumption.txt"

data <- read.table(powerConsumptionFile , header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

JanFebData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(JanFebData$Date, JanFebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot2Graph <- as.numeric(JanFebData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, plot2Graph, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()