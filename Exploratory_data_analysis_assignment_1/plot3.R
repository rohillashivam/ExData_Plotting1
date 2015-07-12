## author : Shivam Rohilla
## Assumption that file is downloaded and unzippeded is available in your workspace.
val <- read.table("/media/SM/week-1_ws/household_power_consumption.txt", header=TRUE, sep=";")
head(val)

## Formatting the date and time and subseting the data only on 2007-02-01 and 2007-02-02
subValue <- val[val$Date %in% c("1/2/2007","2/2/2007") ,]
## Removing the unused variable from workspace.
remove(val)
dateStr <- paste(subValue$Date, subValue$Time, sep=" ")
dateTime <- strptime(dateStr, "%d/%m/%Y %H:%M:%S")
remove(dateStr)

## Creating the plot3.png
png("plot3.png", width=480, height=480)

## Creating Plot 3
plot(dateTime, as.numeric(subValue$Sub_metering_1), type="l", ylab="Energy Sub Metering", xlab = "")
lines(dateTime, as.numeric(subValue$Sub_metering_2), type="l", col="red")
lines(dateTime, as.numeric(subValue$Sub_metering_3), type = "l", col="blue")
## adding legends to the plot.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()