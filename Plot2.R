File <- "./household_power_consumption.txt"
dt <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Filter based on date character
subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
## concatenating date n time
chardt<-paste(subdt$Date,subdt$Time,sep=" ")
## Coverting char into datetime
newdatetime<-strptime(chardt,"%d/%m/%Y %H:%M:%S")
##Coverting into numeric
gap<-as.numeric(subdt$Global_active_power)
png("plot2.png", width=480, height=480)
plot(newdatetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()