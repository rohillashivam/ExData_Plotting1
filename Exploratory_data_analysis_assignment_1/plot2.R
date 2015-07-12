## author : Shivam Rohilla
## Assumption that file is downloaded and unzippeded is available in your workspace.
val <- read.table("/media/SM/week-1_ws/household_power_consumption.txt", header=TRUE, sep=";")
head(val)

## Formatting the date and time and subseting the data only on 2007-02-01 and 2007-02-02
subValue <- val[val$Date %in% c("1/2/2007","2/2/2007") ,]
##Removing the unused variable from workspace.
remove(val)

dateStr <- paste(subValue$Date, subValue$Time, sep=" ")
dateTime <- strptime(dateStr, "%d/%m/%Y %H:%M:%S")
remove(dateStr)

## Creating the plot2.png
png("plot2.png", width=480, height=480)

##Creating plot2.
plot(dateTime, as.numeric(subValue$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")


dev.off()