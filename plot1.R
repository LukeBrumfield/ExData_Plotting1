data <- read.delim(file = "household_power_consumption.txt", header = TRUE, sep = ";")
dates <- as.Date(c("2007-02-01","2007-02-02"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = data$Date == dates[1] | data$Date == dates[2])

z <- as.numeric(as.character(data[,3]))
png("plot1.png")
hist(z, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()