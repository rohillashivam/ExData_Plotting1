## author : Shivam Rohilla
## Assumption that file is downloaded and unzippeded is available in your workspace.
val <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
head(val)

## Formatting the date and time and subseting the data only on 2007-02-01 and 2007-02-02
subValue <- val[val$Date %in% c("1/2/2007","2/2/2007") ,]

## removing the unused variable
remove(val)
dateStr <- paste(subValue$Date, subValue$Time, sep=" ")
dateTime <- strptime(dateStr, "%d/%m/%Y %H:%M:%S")
remove(dateStr)

## Creating the plot4.png
png("plot4.png", width=480, height=480)

## Setting canvas for 4 plots.
par(mfrow = c(2, 2))

## First plot with range divided by 100 as provided in the assignment plot.
plot(dateTime, as.numeric(subValue$Global_active_power)/1000, xlab = "", ylab = "Global Active Power", type="l")

## Second Plot
plot(dateTime, subValue$Voltage, xlab = "", ylab = "Voltage", type = "l")
## adding the x-axis label.
title(xlab = "datetime")

## Third plot.
plot(dateTime, as.numeric(subValue$Sub_metering_1), xlab = "", ylab = "Energy sub metering", type = "l")
lines(dateTime, as.numeric(subValue$Sub_metering_2), type="l", col="red")
lines(dateTime, as.numeric(subValue$Sub_metering_3), type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

## 4th plot, dividing again the range axis by 500 as provided in the assignment plot.
plot(dateTime, as.numeric(subValue$Global_reactive_power)/500, xlab = "", ylab = "Global_reactive_power", type="l")
title(xlab = "datetime")

dev.off()