## Read the file only for those dates
filename <- c("household_power_consumption.txt")
dataframe <- read.csv(filename, header=TRUE, sep=";", na.string = "?")
dataframe$Date <- as.Date(dataframe$Date, format = "%d/%m/%Y")

## Read only 01/02/2007 and 02/02/2007 using the fuction subset
df <- subset(dataframe, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(dataframe)

## Create the x-axis with date and time
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

## Assign the name to the file PNG
plot3 <- ("plot3.png")
png(plot3, height = 480, width = 480)
with(df, plot(Sub_metering_1~Datetime, xlab = "", ylab = "Energy sub metering", type = "l"))
lines(df$Sub_metering_2 ~ df$Datetime, col = "red")
lines(df$Sub_metering_3 ~ df$Datetime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"))
dev.off()