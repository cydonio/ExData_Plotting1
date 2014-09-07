#
# Exploratory Data Analysis Project
# Create Plot3.png

setwd("C:\\Coursera\\DataScience\\Exploratory\\Project1\\exdata-data-household_power_consumption")

# Read file
usage = read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, strip.white = TRUE, colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric", "numeric"), fill = FALSE)

# Get only data for required Dates
usagedays = subset(usage, Date == "1/2/2007" | Date == "2/2/2007")

# Concatenate date and time into first variable
usagedays[,1] = paste(usagedays[,1], usagedays[,2])

# Convert to date/time format
usagedays[,1] = dmy_hms(usagedays[,1])

# Draw the basic plot
plot(usagedays$Date, usagedays$Sub_metering_1, xlab="", ylab="Energy Sub metering", pch="")

# Add first set (black)
lines(usagedays$Date, usagedays$Sub_metering_1)

# Add second set (Red)
lines(usagedays$Date, usagedays$Sub_metering_2, col="Red")

# Add third set (blue)
lines(usagedays$Date, usagedays$Sub_metering_3, col="Blue")

# Add legends on top right corner
legend("topright", lwd=1, lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy plot to a PNG file
dev.copy(png, file = "plot3.png") 
dev.off()


