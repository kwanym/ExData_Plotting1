## Read dataset
basedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
basedata$Date <- as.Date(basedata$Date, format="%d/%m/%Y")

## Subset the data
mydata <- subset(basedata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(basedata)

## Convert dates
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time))

## Plot 1
hist(mydata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()