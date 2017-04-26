
# PLOT 1

# read dates
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character"))
# date conversion
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
# subset
epc <- subset(epc, Date>="2007-02-01" & Date<="2007-02-02")
# ? to NA
epc$Global_active_power[epc$Global_active_power == "?"] = NA   
# string to numeric
epc$Global_active_power <- as.numeric(epc$Global_active_power)   
# hist
hist(epc$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", ylab="Frequency", main="Global Active Power", xlim=c(0,6), ylim=c(0,1200))
#
dev.copy(png, file="plot1.png")
dev.off()

