
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