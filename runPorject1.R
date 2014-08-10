runPorject1 <- function()
{
  
  file <- "household_power_consumption.txt"
  source('plot1.R')
  plot1(file)
  
  source('plot2.R')
  plot2(file)
  
  source('plot3.R')
  plot3(file)
  
  source('plot4.R')
  plot4(file)
  
}