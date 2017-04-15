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