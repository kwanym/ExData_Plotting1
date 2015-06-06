## Read dataset
basedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
basedata$Date <- as.Date(basedata$Date, format="%d/%m/%Y")

## Subset the data
mydata <- subset(basedata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(basedata)

## Convert dates
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time))

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(2,0,2,0))
with(mydata, {
  plot(Global_active_power~datetime, type="l", ylab="Global Active Power", xlab="")

  plot(Voltage~datetime, type="l", ylab="Voltage", xlab="datetime")

  plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  plot(Global_reactive_power~datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
})

## Save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()