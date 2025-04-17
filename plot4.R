# Loading the Dataset
HP_Dataset <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Converting the variables Time and Date into one Variable (POSIXct & POSIXt)
HP_Dataset2 <- HP_Dataset %>% mutate(ExactTime = paste(Date, Time))
HP_Dataset2 <- HP_Dataset %>% mutate(ExactTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

#Making a new Data Frame, which only inlcudes data from the dates 2007-02-01 and 2007-02-02
HP_relevant <- subset(HP_Dataset2, ExactTime >= as.POSIXct("2007-02-01 00:00:00") &  ExactTime <= as.POSIXct("2007-02-02 23:59:59"))

#Making a png 480 x 480
png("plot4.png", width = 480, height = 480)

#Making plot4
par(mfrow = c(2, 2))
plot(HP_relevant$ExactTime,
               HP_relevant$Global_active_power,
               type = "l",
               xlab = "",
               ylab = "Global Active Power")
 
plot(HP_relevant$ExactTime,
               HP_relevant$Voltage,
               type = "l",
               xlab = "datetime",
               ylab = "Voltage")
plot(HP_relevant$ExactTime,
               HP_relevant$Sub_metering_1,
               type = "l",
               xlab = "",
               ylab = "Energy sub metering",
               col = "black")
lines(HP_relevant$ExactTime, HP_relevant$Sub_metering_2, col = "red")
lines(HP_relevant$ExactTime, HP_relevant$Sub_metering_3, col = "blue")
legend("topright",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"),
               lty = 1,
               bty = "n")
plot(HP_relevant$ExactTime,
              HP_relevant$Global_reactive_power,
              type = "l",
              xlab = "datetime",
              ylab = "Global Reactive Power")
dev.off()