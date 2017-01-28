# suppose the data file is in the same directory
filepath = "household_power_consumption.txt"
# to save memory, use the same variable name
sub_power_consumption <- read.table(filepath,  sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")
sub_power_consumption$Date <- strptime(sub_power_consumption$Date, '%d/%m/%Y')
sub_power_consumption$Date <- as.Date(sub_power_consumption$Date)
sub_power_consumption <- subset(sub_power_consumption, as.Date(Date)>='2007-02-01' 
                                & as.Date(Date)<='2007-02-02',
                                select = c(Date:Sub_metering_3))

# plot 1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA)
par(mar=c(4.5, 5.1, 4.1, 2.1))
hist(as.numeric( sub_power_consumption$Global_active_power), breaks = 20, col = 'red', 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()