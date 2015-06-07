
##read in data file with read.csv 
epc<-read.csv("household_power_consumption.txt", sep = ";", header = T)

##create a subset with targeted dates
sub_epc<-epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

##create a date time vector that will be used as one input for the plot
dt<-strptime(paste(sub_epc$Date, sub_epc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##create the three objects that will represent metering in the graphs
sub1<-as.numeric(as.character(sub_epc$Sub_metering_1))

sub2<-as.numeric(as.character(sub_epc$Sub_metering_2))

sub3<-as.numeric(as.character(sub_epc$Sub_metering_3))

##plot the first graph with sub metering 1
plot(dt, sub1, type = "l", xlab = "", ylab = "Energy sub metering")

##add graph 2 and 3 using the points argument
points(dt, sub2, type = "l", xlab = "", ylab = "", col = "red")

points(dt, sub3, type = "l", xlab = "", ylab = "", col = "blue" )

## add legend
legend("topright", legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"), col = c("black","blue","red"),lty = 1, lwd = 2, cex = .5)

## exports graph as png
dev.copy(png, "plot3.png")

##closes dev
dev.off()