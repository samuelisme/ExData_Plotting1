#Read text file
df<-read.csv("data/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")

#Convert the first column to Date class
df$Date<-as.Date(df$Date,format="%d/%m/%Y")

#Subset the data frame to match the given date range
date.start=as.Date("2007-02-01")
date.end=as.Date("2007-02-02")
df2<-df[df$Date == date.start | df$Date == date.end,]

#Extract Global Active Power data and date time information
meter1<-as.numeric(df2$Sub_metering_1)
meter2<-as.numeric(df2$Sub_metering_2)
meter3<-as.numeric(df2$Sub_metering_3)

date.time <-strptime(paste(df2$Date,df2$Time), format="%Y-%m-%d %H:%M:%S")

#First plot the graph and then add points, and add a legend to top right
png("plot3.png",  width = 480, height = 480, units = "px")

plot(date.time, meter1 ,type="l",xlab="",ylab="Energy sub metering")
points(date.time, meter2 ,type="l",col="red")
points(date.time, meter3 ,type="l",col="blue")

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
dev.off()
