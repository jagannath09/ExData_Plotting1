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


