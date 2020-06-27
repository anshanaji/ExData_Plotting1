# load dplyr package
library(dplyr) 

# get data
dat <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

# subsetting data
data <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")



# date and time conversion to proper formats
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")

# Line plot of global active power
png(file = "plot2.png", width = 480, height = 480)
plot(x = data$Time, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

# Sub metering line plots
png(file = "plot3.png", width = 480, height = 480)
plot(x = data$Time, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = data$Time, y = data$Sub_metering_2, type = "l", col = "red")
lines(x = data$Time, y = data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()