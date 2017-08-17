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
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

## Copy plot as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()