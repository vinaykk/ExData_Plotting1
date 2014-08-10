plot4 <- function(file)
{
  library(sqldf)
  
  ##load data for 2 days
  PowerDF <- read.csv.sql(file, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  ## add date time column
  PowerDF$DateTime <- strptime(paste(PowerDF$Date,PowerDF$Time),"%d/%m/%Y %H:%M:%S")
  
  ##open graphic device
  png("plot4.png")
  
  
  par(mfrow = c(2,2))
  
  with(PowerDF , {
  ##plot lines 
  plot(x=DateTime,y=Global_active_power,type="l",ylab="Global Active Power",xlab="")
  
  ## plot lines voltate
  plot(x=DateTime,y=Voltage,type="l",ylab="Voltage",xlab="datetime")
    
  ##plot multiple lines
  plot(x=DateTime,y=Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
  lines(x=DateTime,y=Sub_metering_2,col="Red")
  lines(x=DateTime,y=Sub_metering_3,col="Blue")
  
  legend("topright",lty="solid",bty="n",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  ##plot lines 
  plot(x=DateTime,y=Global_reactive_power,type="l",ylab="Global_reactive_Power",xlab="datetime")
  
  }
  
  )
  
  dev.off() ## Don't forget to close the PNG device!
}