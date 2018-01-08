rm(list=ls())
ls()
setwd("~/ExData_Plotting1/")
txt <- "household_power_consumption.txt"
consumo_de_energia <- read.table(txt, header=TRUE, sep=";",
                                 stringsAsFactors=FALSE, dec=".")
#Realizamos o filtro novamente
consumo_de_energia_filtrado <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]
#criamos uma lista POSIClt
datahora <- strptime(paste(consumo_de_energia_filtrado$Date, consumo_de_energia_filtrado$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Criamos um vetor numerico
forcaAtivaG <- as.numeric(consumo_de_energia_filtrado$Global_active_power)
#fazemos um type cast nos dados se sub metering
Sub_metering_1 <- as.numeric(consumo_de_energia_filtrado$Sub_metering_1)
Sub_metering_2 <- as.numeric(consumo_de_energia_filtrado$Sub_metering_2)
Sub_metering_3 <- as.numeric(consumo_de_energia_filtrado$Sub_metering_3)
#=definimos a area de plotagem
par(mfrow = c(1, 1)) 
#Iniciamos a plotagem
#Plotamos Sub_metering_1
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
#Definoimos uma linha para Sub_metering_2
lines(datahora, Sub_metering_2, type="l", col="red")
#Definimos uma nova linha para Sub_metering_3
lines(datahora, Sub_metering_3, type="l", col="blue")
#Criamos as legendas do grafico
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Atestando que tudo saimos bem, lancamos os mesmos dados para o Device
png("plot3.png", width=480, height=480)
plot(datahora, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datahora, Sub_metering_2, type="l", col="red")
lines(datahora, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
