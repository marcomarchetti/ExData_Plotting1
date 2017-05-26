##-------------------------------------------
## Marco Marchetti
## 26 May 2017
## 
## exploratory-data-analysis
## Peer-graded Assignment: Course Project 1
## 
## Plot4
##-------------------------------------------

library(ggplot2)

##--------------------------------------------------------------------
## Check if 'household_power_consumption.txt' is in the root directory
## otherwise download source data
##--------------------------------------------------------------------
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./household_power_consumption.txt")) {
  download.file(fileUrl, destfile = "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
  file.remove("household_power_consumption.zip")
}

##------------------------------------------------
## Read File: data from 2007-02-01 and 2007-02-02
##------------------------------------------------

hpcTwoDays <- read.table(text = grep("^[1,2]/2/2007", 
                         readLines("household_power_consumption.txt"), value = TRUE), 
                         col.names = c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage", 
                                       "Global_intensity", 
                                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                         sep = ";", header = TRUE, na.strings = "?")

# Date-time Conversion
hpcTwoDays$datetime <- strptime(paste(hpcTwoDays$Date, hpcTwoDays$Time), "%d/%m/%Y %H:%M:%S")
hpcTwoDays$Date <- as.Date(hpcTwoDays$Date, "%d/%m/%Y")
Sys.setlocale(category = "LC_ALL", locale = "english")

##------------------------------------------------
## PNG Plot
##------------------------------------------------

png("plot4.png", width=480, height=480)

# layout preparation
par(mfrow=c(2,2))
par(mar=c(4,4,4,4))

# 1st plot
plot(hpcTwoDays$datetime, hpcTwoDays$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

# 2nd plot
plot(hpcTwoDays$datetime, hpcTwoDays$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

# 3rd plot
plot(hpcTwoDays$datetime, hpcTwoDays$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
points(hpcTwoDays$datetime, hpcTwoDays$Sub_metering_2, type = "l", col = "red")
points(hpcTwoDays$datetime, hpcTwoDays$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", cex = 0.8)

# 4th plot
plot(hpcTwoDays$datetime, hpcTwoDays$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()