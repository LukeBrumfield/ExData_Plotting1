data <- read.delim(file = "household_power_consumption.txt", header = TRUE, sep = ";")
dates <- as.Date(c("2007-02-01","2007-02-02"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = data$Date == dates[1] | data$Date == dates[2])

days <- c("Thu", "Fri", "Sat")

z <- as.numeric(as.character(data[,3]))
png("plot2.png")
plot(z, type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab="")
axis(side = 1, at = c(0, 1440, 2880), labels = days)
dev.off()