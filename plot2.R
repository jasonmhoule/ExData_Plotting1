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

##Create line plot of Global Active Power across datetime
png("plot2.png")
plot(data$datetime,
     data$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")
dev.off()