##setting my working directory and grabbing the data
setwd("C:/Users/Andrew/Documents/Data Science/Course 4/Week 1/")
info <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetting <- info[info$Date %in% c("1/2/2007","2/2/2007") ,]

##creating object and png file
globalactivepower <- as.numeric(subsetting$Global_active_power)
png("plot1.png", width=480, height=480)

##creating the histogram
hist(globalactivepower, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()