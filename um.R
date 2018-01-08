setwd("~/ExData_Plotting1/")
url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url,destfile = "data.zip")
unzip("data.zip")
txt <- "household_power_consumption.txt"
consumo_de_energia <- read.table(txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
consumo_de_energia_sub <- consumo_de_energia_sub <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]
head(consumo_de_energia_sub)


#str(consumo_de_energia_sub)
datetime <- strptime(paste(consumo_de_energia_sub$Date, consumo_de_energia_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(consumo_de_energia_sub$Global_active_power)
globalReactivePower <- as.numeric(consumo_de_energia_sub$Global_reactive_power)
voltage <- as.numeric(consumo_de_energia_sub$Voltage)
Sub_metering_1 <- as.numeric(consumo_de_energia_sub$Sub_metering_1)
Sub_metering_2 <- as.numeric(consumo_de_energia_sub$Sub_metering_2)
Sub_metering_3 <- as.numeric(consumo_de_energia_sub$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
