#
# Exploratory Data Analysis Project
## Create Plot1.png 

setwd("C:\\Coursera\\DataScience\\Exploratory\\Project1\\exdata-data-household_power_consumption")

# Read file
usage = read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, strip.white = TRUE, colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric", "numeric"), fill = FALSE)

# Get data only for required Dates
 usagefeb = subset(usage, Date == "1/2/2007" | Date == "2/2/2007")
 
# Convert dates
usagefeb[,1] = as.Date(usagefeb[,1],format="%d/%m/%Y") 

#Plot 1
hist(usagefeb$Global_active_power, breaks = 12, xlab = "Global Active Power (kilowatts)", col="red", main="Global Active Power") 

## Copy plot to a PNG file
dev.copy(png, file = "plot1.png") 
dev.off()


