setwd("E:/DataScience/ExploratoryDataAnalysis")

## Read the full input datatset
data_complete <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                          check.names=FALSE, stringsAsFactors=FALSE)

## Select only the needed data from thee full input dataset
data_needed <- subset(data_complete, Date %in% c("1/2/2007","2/2/2007"))

## Convert date from char to datetime format
data_needed$Date <- as.Date(data_needed$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_needed$Date), data_needed$Time)
data_needed$Datetime <- as.POSIXct(datetime)

## Plot the needed graphical representation
with(data_needed, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy plot as png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()