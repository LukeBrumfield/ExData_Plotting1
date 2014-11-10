data <- read.delim(file = "household_power_consumption.txt", header = TRUE, sep = ";")
dates <- as.Date(c("2007-02-01","2007-02-02"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = data$Date == dates[1] | data$Date == dates[2])

days <- c("Thu", "Fri", "Sat")
x <- as.numeric(as.character(data$Sub_metering_1))
y <- as.numeric(as.character(data$Sub_metering_2))
z <- as.numeric(as.character(data$Sub_metering_3))

png("plot3.png")


plot(x, col = "black", type = "l", xaxt = "n")
lines(y, col = "red", type = "l")
lines(z, col = "blue", type = "l")
axis(side = 1, at = c(0, 1440, 2880), labels = days)
legend("topright", colnames(data)[7:9], lty=c(1,1), col=c("black","red","blue"))

dev.off()