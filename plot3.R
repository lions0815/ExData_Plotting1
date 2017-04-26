# PLOT 3

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
epc$Sub_metering_1[epc$Sub_metering_1 == "?" ] = NA
epc$Sub_metering_2[epc$Sub_metering_2 == "?" ] = NA
epc$Sub_metering_3[epc$Sub_metering_3 == "?" ] = NA
# string to numeric
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
## plot
plot(x=epc$DT, y=epc$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(x=epc$DT, y=epc$Sub_metering_2, col="red")
lines(x=epc$DT, y=epc$Sub_metering_3, col="blue")
legend("topright", lty=1,  col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
dev.copy(png, file="plot3.png")
dev.off()
