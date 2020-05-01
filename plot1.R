epc <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
epc <- epc %>% filter(Date == '1/2/2007'|Date == '2/2/2007')%>%
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"), 
               Time = format(Time, format = "%H:%M:%S"),
               Global_active_power = as.numeric(Global_active_power))
png('plot1.png',width = 480, height = 480)
hist(epc$Global_active_power, col = 'red', main = 'Global Active Power',
              xlab = 'Global Active Power (kilowatts)')
dev.off()
