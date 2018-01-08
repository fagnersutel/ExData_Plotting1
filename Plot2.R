rm(list=ls())
ls()
setwd("~/ExData_Plotting1/")
txt <- "household_power_consumption.txt"
consumo_de_energia <- read.table(txt, header=TRUE, sep=";",
                                 stringsAsFactors=FALSE, dec=".")

consumo_de_energia_filtrado <- consumo_de_energia[consumo_de_energia$Date %in% c("1/2/2007","2/2/2007") ,]

datahora <- strptime(paste(consumo_de_energia_filtrado$Date, consumo_de_energia_filtrado$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
forcaAtivaG <- as.numeric(consumo_de_energia_filtrado$Global_active_power)
par(mfrow = c(1, 1)) 
plot(datahora, forcaAtivaG, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width=480, height=480)
plot(datahora, forcaAtivaG, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
