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
plot4 <- ("plot4.png")
png(plot4, height = 960, width = 960)

par(mfcol = c(2,2), mar = c(3,4,1,1), oma = c(0,0,1,0))

with(df, {
        # Plot Global active power
        plot(Datetime, Global_active_power, xlab = "", ylab = "Global active power (kilowatts)", type = "l" )
        # Plot Sub metering
        plot(Sub_metering_1~Datetime, xlab = "", ylab = "Energy sub metering", type = "l")
        lines(Sub_metering_2 ~ Datetime, col = "red")
        lines(Sub_metering_3 ~ Datetime, col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"))
        # Plot Voltage
        plot(Datetime, Voltage, xlab = "", ylab = "Voltage", type = "l" )
        # Plot Global reactive power
        plot(Datetime, Global_reactive_power, xlab = "", ylab = "Global reactive power", type = "l" )
})
dev.off()