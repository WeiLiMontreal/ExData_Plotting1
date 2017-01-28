filepath = "household_power_consumption.txt"
# to save memory, use the same variable name
sub_power_consumption <- read.table(filepath,  sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")
sub_power_consumption$Date <- strptime(sub_power_consumption$Date, '%d/%m/%Y')
sub_power_consumption$Date <- as.Date(sub_power_consumption$Date)
sub_power_consumption <- subset(sub_power_consumption, as.Date(Date)>='2007-02-01' 
                                & as.Date(Date)<='2007-02-02',
                                select = c(Date:Sub_metering_3))
# plot 3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA)
xrange <- c(1:length(sub_power_consumption$Date))
yrange <- sub_power_consumption$Sub_metering_1
plot(xrange, yrange ,type = "n", axes = FALSE, xlab = "", ylab = "") 

par(mar=c(4.1, 5.1, 4.1, 2.1))
title(main = "", xlab = "", ylab = "Energy sub metering")
lines(xrange,yrange,type="l")
axis(1, at=c(1, round(length(xrange)/2) , length(xrange) ) , labels=c("Thu", "Fri", "Sat")) 
axis(2 )
box(lty = "solid", col = 'black')
lines(xrange,sub_power_consumption$Sub_metering_2,type="l", col = "red")
lines(xrange,sub_power_consumption$Sub_metering_3,type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1, cex=1)

dev.off()