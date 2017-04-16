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
## plot2
plot2<- function()
{
 plot(ds$Global_active_power~ds$datetime, type="l", xlab="", ylab="Global Active Power ( kilowatts)")
}
plot2()
file_nm <- "plot2.png"
save_file()
