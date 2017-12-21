path <- "~/Documents/Programming/R/data/household_power_consumption.txt"
data <- read.table(path,sep=";", header=TRUE)
# select days
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
# convert into numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
# plot data
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatt)")
par(bg = NA)
#save as png
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()