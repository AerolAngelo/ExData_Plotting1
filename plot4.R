#Plot 4
#loading data
data <- read.table(".~/household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "NA")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data$datetime <- as.POSIXct(data$datetime)

attach(data)

par(mfrow = c(2, 2))

plot(as.numeric(as.character(Global_active_power)) ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")

plot(as.numeric(as.character(Voltage)) ~ datetime, type = "l", ylab = "Voltage")

plot(as.numeric(as.character(Sub_metering_1)) ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(as.numeric(as.character(Sub_metering_2)) ~ datetime, col = "Red")
lines(as.numeric(as.character(Sub_metering_3)) ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", lwd=2)

plot(as.numeric(as.character(Global_reactive_power)) ~ datetime, type = "l", ylab = "Global_active_power")

# Saving PNG file
dev.copy(png, file="plot4.png", height= 480, width = 480)
dev.off()