## Getting full dataset
data_full <- read.table("C:/Users/Nur 'aini munirah/Desktop/Coursera Data Scientist/Module 4 Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
plot(data$Datetime, data$Sub_metering_1, 
     type="l",
     col="black",
     xlab="",
     ylab = "Energy sub metering")

lines(data$Datetime, data$Sub_metering_2, col="Red")
lines(data$Datetime, data$Sub_metering_3, col="Blue")

legend("topright", col=c("black","red","blue"), lty=1,lwd=2, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

