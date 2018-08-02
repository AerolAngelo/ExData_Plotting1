#loading data
data <- read.table(".~/household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "NA")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Plot 1
attach(data)

hist(as.numeric(as.character(data$Global_active_power)),
main="Global ActivePower",
xlab="Global ActivePower (kilowatts)",
col="red")

# Saving PNG file
dev.copy(png, file="plot1.png", height= 480, width = 480)
dev.off()