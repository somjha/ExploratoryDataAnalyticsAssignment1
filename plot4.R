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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_needed, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Copy plot as png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
