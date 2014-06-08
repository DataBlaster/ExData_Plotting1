

staging = read.table("household_power_consumption.txt", sep=";",header=TRUE)

power_consumption = cbind(staging, as.Date(staging$Date,"%d/%m/%Y"))

names(power_consumption)[10] = "date_adjusted"

power_consumption_filtered = power_consumption[power_consumption$date_adjusted=="2007-02-01" | power_consumption$date_adjusted=="2007-02-02",]


png(file="plot1.png",width=480,height=480,res=55)
hist(as.numeric(as.character(power_consumption_filtered$Global_active_power)),col="red",breaks=15,xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()

