## Big dataset
bigdata <- read.table("household_power_consumption.txt", header=T, sep=";")
bigdata$Date <- as.Date(bigdata$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(bigdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(bigdata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Plot 2
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab= " ")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


