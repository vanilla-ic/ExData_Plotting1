library(data.table)
datafile <- "household_power_consumption.txt"
dt=read.table(datafile,sep=";",na.strings="?",stringsAsFactors=F,header=T)

#subset 2 dates
dt <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")

#dateTime column
dt$datetime=paste(dt$Date,dt$Time)
dt$datetime=strptime(dt$datetime,format="%d/%m/%Y %H:%M:%S")

#create png
png("plot4.png")

#layout
par(mfrow=c(2, 2))

#plot1
plot(dt$datetime, dt$Global_active_power,
     type = "l", 
     xlab = "", ylab = "Global Active Power")

#plot2
plot(dt$datetime, dt$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#plot3
plot(dt$datetime, dt$Sub_metering_1,
     type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dt$datetime, dt$Sub_metering_2,
      type ="l", col = "red")
lines(dt$datetime, dt$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", bty='n', lty=c(1,1,1),cex=.7,pt.cex = 1,col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4
plot(dt$datetime, dt$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()