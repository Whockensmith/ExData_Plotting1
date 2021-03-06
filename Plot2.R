s## Read data set into memory
dataset <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)
## Trim data down to 1 January 2007 to 2 February 2007
data <- subset(dataset ,dataset$Date %in% c("1/2/2007","2/2/2007"))
## Fix date and time
data $Time <- strptime(paste(data$Date,data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date,"%d/%m/%Y")
## Fix/force other fields to numeric vaules
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
## Draw plot
png("Plot2.png",width= 480, height = 480,  units= "px")
plot(x = data$Time, y = data$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
