## Read dataset
basedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
basedata$Date <- as.Date(basedata$Date, format="%d/%m/%Y")

## Subset the data
mydata <- subset(basedata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(basedata)

## Convert dates
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time))

## Plot 2
plot(mydata$Global_active_power~mydata$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saves plot to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()