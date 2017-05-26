##-------------------------------------------
## Marco Marchetti
## 26 May 2017
## 
## exploratory-data-analysis
## Peer-graded Assignment: Course Project 1
## 
## Plot1
##-------------------------------------------

library(ggplot2)

##-------------------------------------------------------------------------
## 'household_power_consumption.txt' must be present on the root directory 
## otherwise uncomment this code to download source data
##-------------------------------------------------------------------------
# fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileUrl, "household_power_consumption.zip")
# unzip(zipfile = "household_power_consumption.zip")
# file.remove("household_power_consumption.zip")

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

##------------------------------------------------
## PNG Plot
##------------------------------------------------

png("plot1.png", width=480, height=480)

hist(hpcTwoDays$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", 
     breaks = 13,  xlim = c(0, 6), ylim = c(0,1200))

dev.off()



