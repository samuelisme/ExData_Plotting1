#Read text file
df<-read.csv("data/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)

#Convert the first column to Date class
df$Date<-as.Date(df$Date,format="%d/%m/%Y")

#Subset the data frame to match the given date range
date.start=as.Date("2007-02-01")
date.end=as.Date("2007-02-02")
df2<-df[df$Date == date.start | df$Date == date.end,]

#Extract Global Active Power data and date time information. Then plot the graph request
global.active.power<-as.numeric(df2$Global_active_power)
date.time <-strptime(paste(df2$Date,df2$Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png",  width = 480, height = 480, units = "px")
plot(date.time, global.active.power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
