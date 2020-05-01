epc <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
epc <- epc %>% filter(Date == '1/2/2007'|Date == '2/2/2007')%>%
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"), 
               Time = format(Time, format = "%H:%M:%S"),
               Global_active_power = as.numeric(Global_active_power),
               Sub_metering_1 = as.numeric(Sub_metering_1),
               Sub_metering_2 = as.numeric(Sub_metering_2),
               Sub_metering_3 = as.numeric(Sub_metering_3))
Datetime <- strptime(paste(epc$Date,epc$Time,sep = ' '),'%Y-%m-%d %H:%M:%S')

png('plot3.png',width = 480, height = 480)
with(epc,plot(x = Datetime,y = Sub_metering_1,type = 'l',
              ylab = 'Energy sub metering',xlab = 'Day'))
lines(x = Datetime,y = epc$Sub_metering_2,type="l", col= "red")
lines(x = Datetime,y = epc$Sub_metering_3,type="l", col= "blue")
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()
