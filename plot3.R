plot3 <- function(file)
{
  library(sqldf)
  
  ##load data for 2 days
  PowerDF <- read.csv.sql(file, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  ## add date time column
  PowerDF$DateTime <- strptime(paste(PowerDF$Date,PowerDF$Time),"%d/%m/%Y %H:%M:%S")
  
  ##open graphic device
  png("plot3.png")

  
  ##plot multiple lines
  plot(x=PowerDF$DateTime,y=PowerDF$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
  lines(x=PowerDF$DateTime,y=PowerDF$Sub_metering_2,col="Red")
  lines(x=PowerDF$DateTime,y=PowerDF$Sub_metering_3,col="Blue")
  
  legend("topright",lty="solid",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  dev.off() ## Don't forget to close the PNG device!
}