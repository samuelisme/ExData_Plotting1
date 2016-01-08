#Read text file
df<-read.csv("data/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)

#Convert the first column to Date class
df$Date<-as.Date(df$Date,format="%d/%m/%Y")

#Subset the data frame to match the given date range
date.start=as.Date("2007-02-01")
date.end=as.Date("2007-02-02")
df2<-df[df$Date == date.start | df$Date == date.end,]

#Extract Global Active Power data and plot the histogram
global.active.power<-as.numeric(df2$Global_active_power)
png("plot1.png",  width = 480, height = 480, units = "px")
hist(global.active.power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
