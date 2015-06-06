## Read dataset
basedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
basedata$Date <- as.Date(basedata$Date, format="%d/%m/%Y")

## Subset the data
mydata <- subset(basedata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(basedata)

## Convert dates
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time))

## Plot 3
with(mydata, {
  plot(Sub_metering_1~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()