rm(list=ls())
ls()
#Definimos o diretorio atual
setwd("~/ExData_Plotting1/")
#Apontamos a URL do arquivo
url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
#Realizamos o download
download.file(url,destfile = "data.zip")
#Extraimos o arquivo
unzip("data.zip")
#Informamos o nome do arquivo
txt <- "household_power_consumption.txt"
#Carregamos os dados para um data frame
consumo_de_energia <- read.table(txt, header=TRUE, sep=";",
                                 stringsAsFactors=FALSE, dec=".")
#Fazemos o filtro do consumo de energia
consumo_de_energia_filtrado <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]

forcaAtivaGlobal <- as.numeric(consumo_de_energia_filtrado$Global_active_power)
par(mfrow = c(1, 1)) 
hist(forcaAtivaGlobal, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
png("plot1.png", width=480, height=480)
hist(forcaAtivaGlobal, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
