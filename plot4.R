##Data .txt file must be in data subdirectory

##Read .txt file (just lines for dates needed)
data <- read.table("./data/household_power_consumption.txt",
                 sep=";",
                 skip=66637,
                 nrows=2880,
                 stringsAsFactors=FALSE)

##Read headers from the .txt file and attach
header <- read.table("./data/household_power_consumption.txt",
                     sep=";",
                     nrows=1,
                     stringsAsFactors=FALSE)
colnames(data) <- header[1,]

##Create datetime variable from Date and Time
datetime <- strptime(paste(x2[,1],x2[,2]),format="%d/%m/%Y %H:%M:%S")
data$datetime <- datetime

##Create the four-part plot
png("plot4.png",pointsize=11)
par(mfrow=c(2,2))
##Part 1
plot(data$datetime,
     data$Global_active_power,
     xlab="",
     ylab="Global Active Power",
     type="l")
##Part 2
plot(data$datetime,
     data$Voltage,
     xlab="datetime",
     ylab="Voltage",
     type="l")
##Part 3
plot(data$datetime,
     data$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     type="l")
lines(data$datetime,
      data$Sub_metering_2,
      type="l",
      col="red")
lines(data$datetime,
      data$Sub_metering_3,
      type="l",
      col="blue")
legend(legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1,
       x="topright",
       bty="n")
##Part 4
plot(data$datetime,
     data$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",
     type="l")

dev.off()