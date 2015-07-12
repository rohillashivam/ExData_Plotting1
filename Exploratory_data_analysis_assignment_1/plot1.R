## author : Shivam Rohilla
## Assumption that file is downloaded and unzippeded is available in your workspace.
val <- read.table("/media/SM/week-1_ws/household_power_consumption.txt", header=TRUE, sep=";")
head(val)

## Formatting the date and time and subseting the data only on 2007-02-01 and 2007-02-02
subValue <- val[val$Date %in% c("1/2/2007","2/2/2007") ,]
remove(val)

## Creating plot1.png
png("plot1.png", width=480, height=480)

##Creating histogram for plot 1.
hist(as.numeric(subValue$Global_active_power), xlab="Global Active Power (kilowatts)",col="red", main="Global Active Power")

dev.off()