File <- "./household_power_consumption.txt"
dt <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Filter based on date character
subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
## concatenating date n time
chardt<-paste(subdt$Date,subdt$Time,sep=" ")
## Coverting char into datetime
newdatetime<-strptime(chardt,"%d/%m/%Y %H:%M:%S")
##Coverting into numeric
submet1<-as.numeric(subdt$Sub_metering_1)
submet2<-as.numeric(subdt$Sub_metering_2)
submet3<-as.numeric(subdt$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(newdatetime, submet1, type="l", ylab="Energy Submetering", xlab="")
lines(newdatetime,submet2,col="red")
lines(newdatetime,submet3,col="blue")
legend("topright",col = c("black", "red","blue"),lty=1,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
