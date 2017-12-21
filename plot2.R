path <- "~/Documents/Programming/R/data/household_power_consumption.txt"
data <- read.table(path,sep=";", header=TRUE)
# select days
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
# convert into numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
# create one var from time and date
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
#plot data
plot(data$DateTime, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)",xlab="")
par(bg = NA)
lines(data$DateTime, data$Global_active_power, type="l")
#save as png
dev.copy(png, file = "plot2.png",width = 480, height = 480)
dev.off()
