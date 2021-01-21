data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings= "?", header= TRUE)
my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" , ]
rm(data)


my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
my_data$DataTime <- paste(my_data$Date, my_data$Time) #pasting date and time together
my_data$DataTime <- as.POSIXct(my_data$DataTime) #coverting it into date object

plot(my_data$Global_active_power~my_data$DataTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
