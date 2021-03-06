File <- "./household_power_consumption.txt"
dt <- read.tableFile header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Filter based on date character
subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
##Coverting into numeric
gap<-as.numeric(subdt$global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
