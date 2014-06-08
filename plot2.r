

staging = read.table("household_power_consumption.txt", sep=";",header=TRUE)
power_consumption = cbind(staging, as.Date(staging$Date,"%d/%m/%Y"))
names(power_consumption)[10] = "date_adjusted"
power_consumption_filtered = power_consumption[power_consumption$date_adjusted=="2007-02-01" | power_consumption$date_adjusted=="2007-02-02",]
power_consumption_filtered = cbind(power_consumption_filtered,as.POSIXct(paste(power_consumption_filtered$date_adjusted,as.character(power_consumption_filtered$Time))))
names(power_consumption_filtered)[11]="date_time"


png(file="plot2.png",width=480,height=480,res=55)
with(power_consumption_filtered,plot(date_time,as.numeric(as.character(Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png,file="plot2.png")
dev.off()