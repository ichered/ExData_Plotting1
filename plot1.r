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

# open device
png(filename='plot1.png',width=480,height=480)

# plot data
hist(dt[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')

# turn off the device
x<-dev.off()