
##read in data file with read.csv 
epc<-read.csv("household_power_consumption.txt", sep = ";", header = T)

##creates a subset with the targeted dates
sub_epc<-epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

##changes Global Active Column to numeric
sub_epc[,3]<-as.numeric(as.character(sub_epc$Global_active_power))

## create graph
hist(sub_epc$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

##export graph as png
dev.copy(png, "plot1.png")

##close dev
dev.off()