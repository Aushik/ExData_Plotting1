
#Read Data from Text file
dat1<-read.table("household_power_consumption.txt",header=T,sep=';')

#Subset to required date
dat<-subset(dat1,dat1$Date=="1/2/2007"|dat1$Date=="2/2/2007")

#Convert factor to numeric
dat$Global_active_power<-as.numeric(dat$Global_active_power)

#Write result to PNG
png(filename = "plot1.png", width = 480, height = 480,units = "px")

#Plot Histogram with needed title and labels
hist(dat$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

#close PNG device
dev.off()