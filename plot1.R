plot1 <- function(file)
{
library(sqldf)

##load data for 2 days
PowerDF <- read.csv.sql(file, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## add date time column
PowerDF$DateTime <- strptime(paste(PowerDF$Date,PowerDF$Time),"%d/%m/%Y %H:%M:%S")

##open graphic device
png("plot1.png")

##plot histogram 
hist(PowerDF$Global_active_power,col="Red",freq=TRUE,main="Global Active Power",xlab="Global Active Power (killowatts)")

dev.off() ## Don't forget to close the PNG device!
}