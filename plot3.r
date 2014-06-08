

staging = read.table("household_power_consumption.txt", sep=";",header=TRUE)
power_consumption = cbind(staging, as.Date(staging$Date,"%d/%m/%Y"))
names(power_consumption)[10] = "date_adjusted"
power_consumption_filtered = power_consumption[power_consumption$date_adjusted=="2007-02-01" | power_consumption$date_adjusted=="2007-02-02",]
power_consumption_filtered = cbind(power_consumption_filtered,as.POSIXct(paste(power_consumption_filtered$date_adjusted,as.character(power_consumption_filtered$Time))))
names(power_consumption_filtered)[11]="date_time"

png(file="plot3.png",width=480,height=480,res=55)

with(power_consumption_filtered,plot(date_time,as.numeric(as.character(Sub_metering_1)),type="l",ylab="Energy sub metering",xlab=""))
lines(power_consumption_filtered$date_time,as.numeric(as.character(power_consumption_filtered$Sub_metering_2)),type="l",col="red")
lines(power_consumption_filtered$date_time,as.numeric(as.character(power_consumption_filtered$Sub_metering_3)),type="l",col="blue")

 legend(x = "topright",  
                   #bty = "n",  
                   y.intersp = 1, 

                   #xjust = 0,  
                   #inset = 0.07,   
                   #yjust = 1,  

                   c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   
                   lty=c(1, 1),   
                   lwd=c(2.5, 2.5, 2.5),  
                   col=c("black", "red", "blue")

            )

dev.off()