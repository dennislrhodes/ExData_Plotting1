##read in data file with read.csv 
epc<-read.csv("household_power_consumption.txt", sep = ";", header = T)

##create a subset with targeted dates
sub_epc<-epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

##Variables

##create a date time vector that will be used as one input for the plot
dt<-strptime(paste(sub_epc$Date, sub_epc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##create second vector for plotting using Global Active Power column
gap<-as.numeric(as.character(sub_epc$Global_active_power))

##create the three objects that will represent metering in the graphs
sub1<-as.numeric(as.character(sub_epc$Sub_metering_1))

sub2<-as.numeric(as.character(sub_epc$Sub_metering_2))

sub3<-as.numeric(as.character(sub_epc$Sub_metering_3))

Voltage<-as.numeric(as.character(sub_epc$Voltage))

grp<-as.numeric(as.character(sub_epc$Global_reactive_power))

##Graphing

##change parameter for there to be 4 graphs 2 colums 2 rows
par(mfcol = c(2,2))

##changes the margins
par(mar = c(4,4,2,1))

##changes the outer margins
par(oma = c(0,0,2,0))


with(epc, {                
        ##creates first graph
        plot(dt, gap, type = "l", xlab = "", ylab = "Global Active Power")
                
        ##plot the second graph with sub metering 1
        plot(dt, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
        
        ##add sub_metering 2 and 3 using the points argument
        points(dt, sub2, type = "l", xlab = "", ylab = "", col = "red")
        
        points(dt, sub3, type = "l", xlab = "", ylab = "", col = "blue" )
        
        ## adds legend
        legend("topright", legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"), col = c("black","blue","red"),lty = 1, lwd = 2, cex = .30)
      
        ##creates third graph
        plot(dt, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
        ##creates fourth graph
        plot(dt, grp, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")
        
})

## exports graph as png
dev.copy(png, "plot4.png")

##closes dev
dev.off()

