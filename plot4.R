if (!file.exists("household_power_consumption.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
}
if (!file.exists("household_power_consumption.txt")) {
  unzip("household_power_consumption.zip","household_power_consumption.txt")
}
hpc<- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc[hpc=="?"]  <- NA
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

png(filename="figure/plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(hpc.3d$DateTime, hpc.3d$Global_active_power, type="l", xlab="", ylab="Global Active Power(killowatts)")
plot(hpc.3d$DateTime, hpc.3d$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(hpc.3d$DateTime, hpc.3d$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering", col="grey1")
lines(hpc.3d$DateTime, hpc.3d$Sub_metering_2, type="l", xlab="", ylab="Energy Sub metering", col="red")
lines(hpc.3d$DateTime, hpc.3d$Sub_metering_3, type="l", xlab="", ylab="Energy Sub metering", col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("grey1","red","blue"),cex=.75)
plot(hpc.3d$DateTime, hpc.3d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()