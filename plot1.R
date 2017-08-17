setwd("E:/DataScience/ExploratoryDataAnalysis")

## Read the full input datatset
data_complete <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      check.names=FALSE, stringsAsFactors=FALSE)

## Select only the needed data from thee full input dataset
data_needed <- subset(data_complete, Date %in% c("1/2/2007","2/2/2007"))

## Convert date from char to date format
data_needed$Date <- as.Date(data_needed$Date, format="%d/%m/%Y")

## Plot the needed graphical representation
hist(data_needed$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Copy plot as png file
png("plot1.png", width=480, height=480)
dev.off()