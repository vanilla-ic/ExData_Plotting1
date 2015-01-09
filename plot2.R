library(data.table)
datafile <- "household_power_consumption.txt"
dt=read.table(datafile,sep=";",na.strings="?",stringsAsFactors=F,header=T)

#subset 2 dates
dt <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")

#dateTime column
dt$datetime=paste(dt$Date,dt$Time)
dt$datetime=strptime(dt$datetime,format="%d/%m/%Y %H:%M:%S")

#create plot
plot(dt$datetime, dt$Global_active_power,
     type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")

#create png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()