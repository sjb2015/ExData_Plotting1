# Read Data File
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert datetime
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# data for plotting
globalActivePower <- as.numeric(subSetData$Global_active_power)

# set plotting device and plot the graph
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the device
dev.off()