##setting my working directory and grabbing the data
setwd("C:/Users/Andrew/Documents/Data Science/Course 4/Week 1/")
info <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetting <- info[info$Date %in% c("1/2/2007","2/2/2007") ,]

##creating objects and png file
meter1 <- as.numeric(subsetting$Sub_metering_1)
meter2 <- as.numeric(subsetting$Sub_metering_2)
meter3 <- as.numeric(subsetting$Sub_metering_3)
date <- strptime(paste(subsetting$Date, subsetting$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##creating the graph and adding the other 2 lines of data
png("plot3.png", width=480, height=480)
plot(date, meter1, type="l", ylab="Energy Submetering", xlab="")
lines(date, meter2, type="l", col="red")
lines(date, meter3, type="l", col="blue")

##creating the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.off()