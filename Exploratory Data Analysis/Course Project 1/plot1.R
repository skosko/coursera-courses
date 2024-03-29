#Load Data 
data <- read.table("household_power_consumption.txt", 
                       header = TRUE, 
                       sep = ";", 
                       colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                       na = "?")
    
#Convert the Date and Time variable to Date/Time classes
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")  
    
#Only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

#Opening Graphics Device

png("plot1.png", width = 480, height = 480)

#Plotting & Annotating
hist(data$Global_active_power,
     breaks = 12,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()