
#Read Data from Text file
dat1<-read.table("household_power_consumption.txt",header=T,sep=';')

#Subset to required date
dat<-subset(dat1,dat1$Date=="1/2/2007"|dat1$Date=="2/2/2007")

#Convert factor to numeric
dat$Global_active_power<-as.numeric(dat$Global_active_power)

#Form a new field that combines date and time
dat$NewDate <- dmy_hms(with(dat,paste(Date, Time)))

#Write result to PNG
png(filename = "plot1.png", width = 480, height = 480,units = "px")

#Plot Empty space
with(dat,plot(NewDate,Global_active_power,type="n",ylab="Global Active Poser (kilowatts)",xlab=""))

#Plot line
with(dat,lines(NewDate,Global_active_power,type="l"))

dev.off()