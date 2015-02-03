##ASSUMES EXECUTION FROM SAME WORKING DIRECTORY AS DATA FILE, NAMED household_power_consumption.txt

##LIBRARIES

##SOURCE DATA
hpc <- read.csv("household_power_consumption.txt", header= TRUE, sep=";", colClasses = "character")
hpc$Date <- as.Date(hpc[, 1], "%d/%m/%Y")  ##EXTRACT DATE
hpc$dTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S") ##DATETIME FIELD CREATION
suppressWarnings(hpc[, 3] <- as.numeric(hpc[, 3])) ##CONVERT NUMERIC, PRODUCES NA's
suppressWarnings(hpc[, 4] <- as.numeric(hpc[, 4])) ##CONVERT NUMERIC, PRODUCES NA's
suppressWarnings(hpc[, 5] <- as.numeric(hpc[, 5])) ##CONVERT NUMERIC, PRODUCES NA's
suppressWarnings(hpc[, 6] <- as.numeric(hpc[, 6])) ##CONVERT NUMERIC, PRODUCES NA's
suppressWarnings(hpc[, 7] <- as.numeric(hpc[, 7])) ##CONVERT NUMERIC, PRODUCES NA's
suppressWarnings(hpc[, 8] <- as.numeric(hpc[, 8])) ##CONVERT NUMERIC, PRODUCES NA's
suppressWarnings(hpc[, 9] <- as.numeric(hpc[, 9])) ##CONVERT NUMERIC, PRODUCES NA's

##CREATE SUBSET WITH ONLY DATES BETWEEN 2007-02-01 and 2007-02-02
shpc <- hpc[ which(hpc$Date>=as.Date("2007-02-01", "%Y-%m-%d")
                   & hpc$Date<as.Date("2007-02-03", "%Y-%m-%d")), ]

##CREATE PNG, CREATE EMPTY PLOT AND DRAW LINES, CLOSE
png("plot4.png",bg = "transparent")
par(mfrow=c(2,2))
#1
plot(shpc$dTime,shpc$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(shpc$dTime,shpc$Global_active_power)
#2
plot(shpc$dTime,shpc$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(shpc$dTime,shpc$Voltage)
#3
plot(shpc$dTime,shpc$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(shpc$dTime,shpc$Sub_metering_1)
lines(shpc$dTime,shpc$Sub_metering_2,col="red")
lines(shpc$dTime,shpc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8,col=c("black","red","blue"),lty=c(1,1),bty="n")
#4
plot(shpc$dTime,shpc$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(shpc$dTime,shpc$Global_reactive_power)
dev.off()



