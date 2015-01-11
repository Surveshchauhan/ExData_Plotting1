dataFile <- "./household_power_consumption.txt"
dt <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

chardt<-paste(subdt$Date,subdt$Time,sep=" ")
newdatetime<-strptime(chardt,"%d/%m/%Y %H:%M:%S")
gap<-as.numeric(subdt$Global_active_power)
png("plot2.png", width=480, height=480)
plot(newdatetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()