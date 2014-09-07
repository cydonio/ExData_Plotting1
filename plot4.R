#
# Exploratory Data Analysis Project
# Create Plot4.png

setwd("C:\\Coursera\\DataScience\\Exploratory\\Project1\\exdata-data-household_power_consumption")

# Read file
usage = read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, strip.white = TRUE, colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric", "numeric"), fill = FALSE)

# Get only data for required Dates
usagedays = subset(usage, Date == "1/2/2007" | Date == "2/2/2007")

# Concatenate date and time into first variable
usagedays[,1] = paste(usagedays[,1], usagedays[,2])

# Convert to date/time format
usagedays[,1] = dmy_hms(usagedays[,1])

# Define the four plotting sub-areas
par(mfrow=c(2,2))

# Draw top left
plot(usagedays$Date, usagedays$Global_active_power, xlab="", ylab="Global Active Power ", pch="")
lines(usagedays$Date, usagedays$Global_active_power)

# Top right
plot(usagedays$Date, usagedays$Voltage, xlab="", ylab="Voltage", pch="")
lines(usagedays$Date, usagedays$Voltage)

# Bottom left
plot(usagedays$Date, usagedays$Sub_metering_1, xlab="", ylab="Energy Sub metering", pch="")
lines(usagedays$Date, usagedays$Sub_metering_1)
lines(usagedays$Date, usagedays$Sub_metering_2, col="Red")
lines(usagedays$Date, usagedays$Sub_metering_3, col="Blue")
legend("topright", lwd=1, lty=1, bty="n", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right
plot(usagedays$Date, usagedays$Global_reactive_power, xlab="", ylab="Global_reactive_power", pch="")
lines(usagedays$Date, usagedays$Global_reactive_power, lwd=1.1)

## Copy plot to a PNG file
dev.copy(png, file = "plot4.png") 
dev.off()
par(mfrow=c(1,1))


