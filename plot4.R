data <- read.delim(file = "household_power_consumption.txt", header = TRUE, sep = ";")
dates <- as.Date(c("2007-02-01","2007-02-02"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = data$Date == dates[1] | data$Date == dates[2])

days <- c("Thu", "Fri", "Sat")

png("plot4.png")

par(mfrow = c(2,2), mar = c(4,4,4,1))

plot(as.numeric(as.character(data$Global_active_power)), type = "l", ylab = "Global Active Power (kilowats)", xaxt = "n", xlab = "datetime")
axis(side = 1, at = c(0, 1440, 2880), labels = days)
plot(as.numeric(as.character(data$Voltage)), type="l", ylab = "Voltage", xaxt = "n", xlab = "")
axis(side = 1, at = c(0, 1440, 2880), labels = days)

x <- as.numeric(as.character(data$Sub_metering_1))
y <- as.numeric(as.character(data$Sub_metering_2))
z <- as.numeric(as.character(data$Sub_metering_3))

plot(x, col = "black", type = "l", xaxt = "n", xlab = "", ylab="Energy SubMetering")
lines(y, col = "red", type = "l")
lines(z, col = "blue", type = "l")
axis(side = 1, at = c(0, 1440, 2880), labels = days)
legend("topright", colnames(data)[7:9], lty=c(1,1), col=c("black","red","blue"))

plot(as.numeric(as.character(data$Global_reactive_power)), type= "l", ylab="Global Reactive Power", xaxt = "n", xlab = "datetime")
axis(side = 1, at = c(0, 1440, 2880), labels = days)

dev.off()