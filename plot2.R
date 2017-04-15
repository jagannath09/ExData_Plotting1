
## plot2
plot2<- function()
{
 plot(ds$Global_active_power~ds$datetime, type="l", xlab="", ylab="Global Active Power ( kilowatts)")
}
plot2()
file_nm <- "plot2.png"
save_file()
