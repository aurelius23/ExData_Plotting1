path <- "~/Documents/Programming/R/data/household_power_consumption.txt"
data <- read.table(path,sep=";", header=TRUE)
# select days
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
# convert into numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
# create one var from time and date
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
#plot
plot(data$DateTime, data$Sub_metering_3, type="n", ylim=c(0,30),xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, type="l")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
#legend
legend("topright", pch = "_", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#save as png
dev.copy(png, file = "plot3.png",width = 480, height = 480)
dev.off()