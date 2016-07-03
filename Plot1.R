## script:      Plot1.R
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

dtPowerCompSub$numGlobalActivePower <- as.numeric(dtPowerCompSub$Global_active_power)

#Plot
hist(dtPowerCompSub$numGlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off() 


