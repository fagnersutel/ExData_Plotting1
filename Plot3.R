rm(list=ls())
ls()
setwd("~/ExData_Plotting1/")
txt <- "household_power_consumption.txt"
consumo_de_energia <- read.table(txt, header=TRUE, sep=";",
                                 stringsAsFactors=FALSE, dec=".")

consumo_de_energia_filtrado <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]

datahora <- strptime(paste(consumo_de_energia_filtrado$Date, consumo_de_energia_filtrado$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
forcaAtivaG <- as.numeric(consumo_de_energia_filtrado$Global_active_power)
Sub_metering_1 <- as.numeric(consumo_de_energia_filtrado$Sub_metering_1)
Sub_metering_2 <- as.numeric(consumo_de_energia_filtrado$Sub_metering_2)
Sub_metering_3 <- as.numeric(consumo_de_energia_filtrado$Sub_metering_3)
par(mfrow = c(1, 1)) 
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datahora, Sub_metering_2, type="l", col="red")
lines(datahora, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

png("plot3.png", width=480, height=480)
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datahora, Sub_metering_2, type="l", col="red")
lines(datahora, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
