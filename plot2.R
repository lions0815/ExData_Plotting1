# PLOT 2

library(dplyr)

# read dates
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character"))
# add Datetime
epc <- mutate(epc, DT=paste(Date, Time))
# Date conversion
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
# subset
epc <- subset(epc, Date>="2007-02-01" & Date<="2007-02-02")
# Datetime conversion
epc$DT <- strptime(epc$DT, "%d/%m/%Y %H:%M:%S")
# ? to NA
epc$Global_active_power[epc$Global_active_power == "?"] = NA   
# string to numeric
epc$Global_active_power <- as.numeric(epc$Global_active_power)   
# plot
plot(x=epc$DT, y=epc$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type="l")
#
dev.copy(png, file="plot2.png")
dev.off()