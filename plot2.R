epc <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
epc <- epc %>% filter(Date == '1/2/2007'|Date == '2/2/2007')%>%
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"), 
               Time = format(Time, format = "%H:%M:%S"),
               Global_active_power = as.numeric(Global_active_power))
Datetime <- strptime(paste(epc$Date,epc$Time,sep = ' '),'%Y-%m-%d %H:%M:%S')

png('plot2.png',width = 480, height = 480)
with(epc,plot(x = Datetime,y = Global_active_power,type = 'l',ylab = 'Global Active Power (kilowatts)',
              xlab = ''))
dev.off()
