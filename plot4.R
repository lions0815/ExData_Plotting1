
# PLOT4

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
epc$Global_reactive_power[epc$Global_reactive_power == "?"] = NA
epc$Voltage[epc$Voltage == "?"] = NA   
epc$Sub_metering_1[epc$Sub_metering_1 == "?" ] = NA
epc$Sub_metering_2[epc$Sub_metering_2 == "?" ] = NA
epc$Sub_metering_3[epc$Sub_metering_3 == "?" ] = NA
# string to numeric
epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)
epc$Voltage <- as.numeric(epc$Voltage)   
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
## plot
par(mfcol = c(2,2))
# plot1
plot(x=epc$DT, y=epc$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type="l")
# plot 2
plot(x=epc$DT, y=epc$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(x=epc$DT, y=epc$Sub_metering_2, col="red")
lines(x=epc$DT, y=epc$Sub_metering_3, col="blue")
legend("topright", lty=1,  col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot 3
plot(x=epc$DT, y=epc$Voltage, xlab="", ylab="Voltage", type="l")
# plot 4
plot(x=epc$DT, y=epc$Global_reactive_power, xlab="", ylab="Global_reactive_power", type="l")
#
dev.copy(png, file="plot4.png")
dev.off()
