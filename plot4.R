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
##plot 4
plot4<- function()
{
 # plot the diagrams in 2 X 2 matrix form
 par(mfrow=c(2,2))
 # plot1
 plot(ds$Global_active_power~ds$datetime, type="l", xlab="", ylab="Global Active Power")
 # plot2
 plot(ds$Voltage~ds$datetime, type="l", xlab="datetime", ylab="Voltage")
 # plot3
 plot(ds$Sub_metering_1~ds$datetime, type="l", xlab="",  ylab="Energy sub metering")
 lines(ds$Sub_metering_2~ds$datetime, col="red")
 lines(ds$Sub_metering_3~ds$datetime, col="blue")
 legend("topright", col=c("black","red","blue"), 
        c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
        inset=c(-0.35,-0.2),xpd=TRUE,
        x.intersp=0.5, y.intersp = .4,
        lty=1, lwd=2, cex= .8, bty="n")
 # bty removes the box, cex shinks the text
 # plot4
 plot(ds$Global_reactive_power~ds$datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
}

plot4()
file_nm <- "plot4.png"
save_file()