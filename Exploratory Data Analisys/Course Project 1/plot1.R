## Read the file only for those dates
filename <- c("household_power_consumption.txt")
dataframe <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), header=TRUE, stringsAsFactors = FALSE, sep=";")
## Adding column names
colnames(dataframe) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Assign the name to the file PNG
plot1 <- ("plot1.png")
png(plot1, height = 480, width = 480)
hist(dataframe$Global_active_power, col="red", main = "Globla Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

