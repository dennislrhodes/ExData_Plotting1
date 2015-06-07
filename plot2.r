
##read in data file with read.csv 
epc<-read.csv("household_power_consumption.txt", sep = ";", header = T)

##create a subset with targeted dates
sub_epc<-epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

##create a date time vector that will be used as one input for the plot
dt<-strptime(paste(sub_epc$Date, sub_epc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##create second vector for plotting using Global Active Power column
gap<-as.numeric(as.character(sub_epc$Global_active_power))

##creates a graph
plot(dt, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## exports graph as png
dev.copy(png, "plot2.png")

##closes dev
dev.off()