rm(list=ls())
ls()
#Setamos o work dorectory
setwd("~/ExData_Plotting1/")
#Definimos o arquivo de dados
txt <- "household_power_consumption.txt"
#Criamos o data table
consumo_de_energia <- read.table(txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Realizamos um filtro para obter registros apenas ente 01/02/2007 a 02/02/2007
consumo_de_energia_filtrado <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]
#Criamos uma lista POSIClt
datahora <- strptime(paste(consumo_de_energia_filtrado$Date, consumo_de_energia_filtrado$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Criamos um vetor numerico
forcaAtivaG <- as.numeric(consumo_de_energia_filtrado$Global_active_power)
#Definimos a area de plotagem
par(mfrow = c(1, 1))
#Visualizamos a plotagem
plot(datahora, forcaAtivaG, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Definimos o Device
png("plot2.png", width=480, height=480)
#Plotamos para o device
plot(datahora, forcaAtivaG, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Fechamos o device para gerar o arquivo
dev.off()
