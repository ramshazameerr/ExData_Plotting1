data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings= "?", header= TRUE)
my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" , ]
rm(data)


my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
my_data$DataTime <- paste(my_data$Date, my_data$Time) #pasting date and time together
my_data$DataTime <- as.POSIXct(my_data$DataTime) #coverting it into date object

png("plot3.png", height = 480, width = 480)
plot( my_data$DataTime, my_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(my_data$DataTime,my_data$Sub_metering_2 , col = "red" )
lines(my_data$DataTime,my_data$Sub_metering_3 , col = "blue" )
legend("topright",lty= 1, lwd=1 ,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
