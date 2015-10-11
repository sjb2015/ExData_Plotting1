# Read Data File
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert datetime
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# data for plotting
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# set plotting device and plot the graph
png("plot4.png", width=480, height=480)
# two rows and two cols for 4 charts
par(mfrow = c(2, 2)) 
# plot Global Active Power chart
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# plot Voltage chart
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# plot Energy Submetering chart
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# add legend to top right corner
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# plot Global_reactive_power chart
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#close the device
dev.off()