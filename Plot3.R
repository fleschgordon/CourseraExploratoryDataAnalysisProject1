## script:      Plot3.R
##
##              Peer Graded Assignment: Course Project 1
##              https://github.com/rdpeng/ExData_Plotting1
## 
## usage:       (run all)
## 
## changelog:
##              20160702 MF intial version
##


#Prereq

#packages
library(data.table)

#data dir
if (!file.exists("data")){
        dir.create("data")
}

#file download
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile ="./data/hpc.zip")

#data stuff
unzip("./data/hpc.zip", exdir = "./data")
dtpowercomp <- fread("./data/household_power_consumption.txt")
dtPowerCompSub <- dtpowercomp[dtpowercomp$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dtPowerCompSub$Date, dtPowerCompSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
dtPowerCompSub$numGlobalActivePower <- as.numeric(dtPowerCompSub$Global_active_power)

dtPowerCompSub$subMetering1 <- as.numeric(dtPowerCompSub$Sub_metering_1)
dtPowerCompSub$subMetering2 <- as.numeric(dtPowerCompSub$Sub_metering_2)
dtPowerCompSub$subMetering3 <- as.numeric(dtPowerCompSub$Sub_metering_3)

#Plot
plot(datetime, dtPowerCompSub$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, dtPowerCompSub$subMetering2, type="l", col="red")
lines(datetime, dtPowerCompSub$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file = "plot3.png")
dev.off()



