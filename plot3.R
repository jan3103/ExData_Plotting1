# Loading the Dataset
HP_Dataset <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Converting the variables Time and Date into one Variable (POSIXct & POSIXt)
HP_Dataset2 <- HP_Dataset %>% mutate(ExactTime = paste(Date, Time))
HP_Dataset2 <- HP_Dataset %>% mutate(ExactTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

#Making a new Data Frame, which only inlcudes data from the dates 2007-02-01 and 2007-02-02
HP_relevant <- subset(HP_Dataset2, ExactTime >= as.POSIXct("2007-02-01 00:00:00") &  ExactTime <= as.POSIXct("2007-02-02 23:59:59"))

#Making a png 480 x 480
png("plot3.png", width = 480, height = 480)

#Making plot3
plot(HP_relevant$ExactTime, HP_relevant$Sub_metering_1, type = "l", col = "black", 
           xlab = "", ylab = "Energy sub metering")
> lines(HP_relevant$ExactTime, HP_relevant$Sub_metering_2, col = "red")
> lines(HP_relevant$ExactTime, HP_relevant$Sub_metering_3, col = "blue")
> legend("topright", 
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
              col = c("black", "red", "blue"),
              lty = 1)
> dev.off()