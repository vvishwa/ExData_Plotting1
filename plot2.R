if (!file.exists("household_power_consumption.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
}
if (!file.exists("household_power_consumption.txt")) {
  unz("household_power_consumption.zip","household_power_consumption.txt")
}
hpc<- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc[hpc=="?"]  <- NA
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

png(filename="figure/plot2.png", width=480, height=480)
hpc.3d <- subset(hpc, hpc$DateTime >= strptime("2007-02-01", "%Y-%m-%d") & hpc$DateTime <= strptime("2007-02-03", "%Y-%m-%d"))
plot(hpc.3d$DateTime, hpc.3d$Global_active_power, type="l", xlab="", ylab="Global Active Power(killowatts)")
dev.off()