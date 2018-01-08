rm(list=ls())
ls()
setwd("~/ExData_Plotting1/")
txt <- "household_power_consumption.txt"
consumo_de_energia <- read.table(txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
consumo_de_energia_sub <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]
head(consumo_de_energia_sub)
#Realizamos os passos anteriores
datahora <- strptime(paste(consumo_de_energia_sub$Date, consumo_de_energia_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#criamos um novo vetor de dados de Energia Global Ativa
energiaGlobalAtiva <- as.numeric(consumo_de_energia_sub$Global_active_power)
#criamos um novo vetor de dados de Energia Global Reativa
energiaGlobalReativa <- as.numeric(consumo_de_energia_sub$Global_reactive_power)
#Criamos um vetor de voltagemm
voltagem <- as.numeric(consumo_de_energia_sub$Voltage)
#fazemos um type cast nos dados se sub metering
Sub_metering_1 <- as.numeric(consumo_de_energia_sub$Sub_metering_1)
Sub_metering_2 <- as.numeric(consumo_de_energia_sub$Sub_metering_2)
Sub_metering_3 <- as.numeric(consumo_de_energia_sub$Sub_metering_3)
#Preparamos uma area de plotagem com 4 quadrantes
par(mfrow = c(2, 2)) 
#Plotamos a energia global ativa
plot(datahora, energiaGlobalAtiva, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#Plotamos os valores de voltagem
plot(datahora, voltagem, type="l", xlab="datahora", ylab="voltagem")
#Plotamos os dados de Submetering 1
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
#Plotamos os dados de Submetering 2
lines(datahora, Sub_metering_2, type="l", col="red")
#Plotamos os dados de Submetering 3
lines(datahora, Sub_metering_3, type="l", col="blue")
#Ccriamos a Legenda
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#Plotamos os dados de EnergiaGlobal Reativa
plot(datahora, energiaGlobalReativa, type="l", xlab="datahora", ylab="Global_reactive_power")
#Note que a cada comando 'plot' preenchemos um dos quadrantes do device
#Criemos o device em png
png("plot4.png", width=480, height=480)
#Criamos os quadrantes do device
par(mfrow = c(2, 2)) 
#rRepetimos os passos anteriores de plotagem
plot(datahora, energiaGlobalAtiva, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datahora, voltagem, type="l", xlab="datahora", ylab="voltagem")
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datahora, Sub_metering_2, type="l", col="red")
lines(datahora, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datahora, energiaGlobalReativa, type="l", xlab="datahora", ylab="Global_reactive_power")

dev.off()
