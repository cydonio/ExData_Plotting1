#
# Exploratory Data Analysis Project
# Create Plot2.png 

setwd("C:\\Coursera\\DataScience\\Exploratory\\Project1\\exdata-data-household_power_consumption")

# Read file
usage = read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, strip.white = TRUE, colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric", "numeric"), fill = FALSE)

# Get data only for required Dates
usagedays = subset(usage, Date == "1/2/2007" | Date == "2/2/2007")

# Concatenate date and time into first variable
usagedays[,1] = paste(usagedays[,1], usagedays[,2])

# Convert to date/time format
library(lubridate)
usagedays[,1] = dmy_hms(usagedays[,1])

# Draw the plot
plot(usagedays$Date, usagedays$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

## Copy plot to a PNG file
dev.copy(png, file = "plot2.png") 
dev.off()


