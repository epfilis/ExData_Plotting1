## Big dataset
bigdata <- read.table("household_power_consumption.txt", header=T, sep=";")
bigdata$Date <- as.Date(bigdata$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(bigdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(bigdata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Plot 1
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red" , cex.lab=1.1, cex.main=1.1, cex.axis=1.1)

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


