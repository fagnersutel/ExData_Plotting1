rm(list=ls())
ls()
setwd("~/ExData_Plotting1/")
url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url,destfile = "data.zip")
unzip("data.zip")
txt <- "household_power_consumption.txt"
consumo_de_energia <- read.table(txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
consumo_de_energia_sub <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]
head(consumo_de_energia_sub)

datahora <- strptime(paste(consumo_de_energia_sub$Date, consumo_de_energia_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
energiaGlobalAtiva <- as.numeric(consumo_de_energia_sub$Global_active_power)
energiaGlobalReativa <- as.numeric(consumo_de_energia_sub$Global_reactive_power)
voltage <- as.numeric(consumo_de_energia_sub$Voltage)
Sub_metering_1 <- as.numeric(consumo_de_energia_sub$Sub_metering_1)
Sub_metering_2 <- as.numeric(consumo_de_energia_sub$Sub_metering_2)
Sub_metering_3 <- as.numeric(consumo_de_energia_sub$Sub_metering_3)

par(mfrow = c(2, 2)) 
plot(datahora, energiaGlobalAtiva, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datahora, voltage, type="l", xlab="datahora", ylab="Voltage")
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datahora, Sub_metering_2, type="l", col="red")
lines(datahora, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datahora, energiaGlobalReativa, type="l", xlab="datahora", ylab="Global_reactive_power")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datahora, energiaGlobalAtiva, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datahora, voltage, type="l", xlab="datahora", ylab="Voltage")
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datahora, Sub_metering_2, type="l", col="red")
lines(datahora, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datahora, energiaGlobalReativa, type="l", xlab="datahora", ylab="Global_reactive_power")

dev.off()