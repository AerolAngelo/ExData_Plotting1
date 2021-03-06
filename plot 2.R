#Plot 2
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

plot(as.numeric(as.character(data$Global_active_power)) ~ data$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Saving PNG file
dev.copy(png, file="plot2.png", height= 480, width = 480)
dev.off()
