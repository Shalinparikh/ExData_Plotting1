epc <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
epc <- epc %>% filter(Date == '1/2/2007'|Date == '2/2/2007')%>%
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"), 
               Time = format(Time, format = "%H:%M:%S"),
               Global_active_power = as.numeric(Global_active_power))
Datetime <- strptime(paste(epc$Date,epc$Time,sep = ' '),'%Y-%m-%d %H:%M:%S')

png('plot4.png',width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,4))
with(epc,plot(x = Datetime,y = Global_active_power,type = 'l',ylab = 'Global Active Power',
              xlab = ''))
with(epc,plot(x = Datetime,y = Voltage,type = 'l',ylab = 'Voltage',
              xlab = 'datetime'))
with(epc,plot(x = Datetime,y = Sub_metering_1,type = 'l',
              ylab = 'Energy sub metering',xlab = ''))
lines(x = Datetime,y = epc$Sub_metering_2,type="l", col= "red")
lines(x = Datetime,y = epc$Sub_metering_3,type="l", col= "blue")
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd=2.5, col=c("black", "red", "blue"), bty="o")
with(epc,plot(x = Datetime,y = Global_reactive_power,type = 'l',ylab = 'Global_reactive_power',
              xlab = 'datetime'))

dev.off()
