if(!file.exists("household_power_consumption.txt")){download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destifile <- "data.zip", method = "curl")}
unzip("data.zip")
df <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
library(dplyr)
df2 <- subset(df, Date == c("1/2/2007", "2/2/2007"))
Datetime <- as.POSIXct(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M:%S")
row.names(df2) <- NULL
df.final <- cbind(Datetime, df2[, 3:9])

png("plot2.png", width = 480, height = 480)
with(df.final, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()