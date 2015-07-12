# make sure working directory is the one with the data set

# read the file as a csv file
dt=read.csv('household_power_consumption.txt',header=T, sep=';') 
# merge date and time into a single column 
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  
# convert the Date column's datatype from string to date 
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') 
# use only the two required days
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') 
# convert the Global Active Power's datatype from text to numeric values
dt[,3] = as.numeric(as.character(dt[,3])) 
# convert all Sub_metering to numeric values
dt$Sub_metering_1 <- (as.numeric(as.character(dt$Sub_metering_1))) 
dt$Sub_metering_2 <- (as.numeric(as.character(dt$Sub_metering_2)))
dt$Sub_metering_3 <- (as.numeric(as.character(dt$Sub_metering_3)))
# create a datetime object 
dt$dt <- strptime(dt$Datetime, '%d/%m/%Y %H:%M') 

# open device
png('plot3.png',width=480,height=480)

# plot data
plot(dt$dt,dt$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(dt$dt,dt$Sub_metering_2,col='red')
lines(dt$dt,dt$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1,lwd=1.5)

# turn off the device
x<-dev.off()