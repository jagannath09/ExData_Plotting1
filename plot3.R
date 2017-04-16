## Run required libraries
library(lubridate)
library(dplyr)

## download, format, and read the file
## set the destination file path
f <- file.path(getwd(), "hpc.zip")
## downoad file to given destination
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",f)
## unzip household power consumption data file
uzf <- unzip(f)
## read the file into array using semicolon as a separator
Power <- read.table(uzf, header = TRUE, sep = ";",na.strings = "?")
## format date
Power$Date <- as.Date(Power$Date,"%d/%m/%Y")
## filter data set. This step takes more time
ds <- subset(Power, Power$Date>="2007-02-01"& Power$Date<="2007-02-02")
## add datetime column and format 
ds <- transform(ds, datetime=as.POSIXct(paste(ds$Date,ds$Time)), "%d/%m/%Y %H:%M:%S")
## remove incomplete datasets
ds <- ds[complete.cases(ds),]

save_file <- function ()
{
  ## save PNG file to disk
  dev.copy(png, file_nm, width=480, height=480)
  ## close device
  dev.off()
  
}

##plot 3
plot3<- function()
{ 
  plot(ds$Sub_metering_1~ds$datetime, type="l", xlab="",  ylab="Energy sub metering")
  lines(ds$Sub_metering_2~ds$datetime, col="red")
  lines(ds$Sub_metering_3~ds$datetime, col="blue")
  legend("topright", col=c("black","red","blue"), 
        c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1))
}

plot3()
file_nm <- "plot3.png"
save_file()


