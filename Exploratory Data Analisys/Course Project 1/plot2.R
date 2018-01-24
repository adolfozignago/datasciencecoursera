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
plot2 <- ("plot2.png")
png(plot2, height = 480, width = 480)
plot(df$Datetime, df$Global_active_power, xlab = "", ylab = "Global active power (kilowatts)", type = "l" )
dev.off()