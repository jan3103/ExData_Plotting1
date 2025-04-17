# Loading the Dataset
HP_Dataset <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Converting the variables Time and Date into one Variable (POSIXct & POSIXt)
HP_Dataset2 <- HP_Dataset %>% mutate(ExactTime = paste(Date, Time))
HP_Dataset2 <- HP_Dataset %>% mutate(ExactTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

#Making a new Data Frame, which only inlcudes data from the dates 2007-02-01 and 2007-02-02
HP_relevant <- subset(HP_Dataset2, ExactTime >= as.POSIXct("2007-02-01 00:00:00") &  ExactTime <= as.POSIXct("2007-02-02 23:59:59"))

#Making a png 480 x 480
png("plot2.png", width = 480, height = 480)

#Making plot2
plot(HP_relevant$ExactTime,
          HP_relevant$Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)")
dev.off()


