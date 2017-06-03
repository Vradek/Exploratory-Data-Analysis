##getting and subsetting data
setwd("C:/Users/Andrew/Documents/Data Science/Course 4/Week 1/")
info <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetting <- info[info$Date %in% c("1/2/2007","2/2/2007") ,]


##all objects for each graph
globalactivepower <- as.numeric(subsetting$Global_active_power)
globalreactivepower <- as.numeric(subsetting$Global_reactive_power)
date <- strptime(paste(subsetting$Date, subsetting$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
voltage<-as.numeric(subsetting$Voltage)
meter1 <- as.numeric(subsetting$Sub_metering_1)
meter2 <- as.numeric(subsetting$Sub_metering_2)
meter3 <- as.numeric(subsetting$Sub_metering_3)

##setting up graphical image
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

##plot 1
plot(date, globalactivepower,type="l",xlab="", ylab="Global Active Power (kilowatts)")

##plot 2
plot(date, voltage,type="l",ylab="Voltage", xlab="datetime")

##plot 3
plot(date, meter1, type="l", ylab="Energy Submetering", xlab="")
lines(date, meter2, type="l", col="red")
lines(date, meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="n")

##plot 4
plot(date, globalreactivepower,type="l",xlab="datetime", ylab="Global_reactive_power")

dev.off()