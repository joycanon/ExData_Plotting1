powerConsumptionFile <- "household_power_consumption.txt"

data <- read.table(powerConsumptionFile , header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

JanFebData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


plot1Graph <- as.numeric(JanFebData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(plot1Graph, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()