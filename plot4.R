# READ DATA, for simplicity assume the file is fixed.
# Identify the data segment using its rows
skip <- 66637
nrows <- (69517 - 66637)
dat <- read.csv("household_power_consumption.txt",sep=";", skip=skip,nrows=nrows,header=FALSE)

# 1. Date: Date in format dd/mm/yyyy 
# 2. Time: time in format hh:mm:ss 
# 3. Global_active_power: household global minute-averaged active power (in kilowatt)
# 4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# 5. Voltage: minute-averaged voltage (in volt) 

# 7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# 8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# 9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

d1 <- paste(dat[[1]],dat[[2]])
d2 <- strptime(d1,format ="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

# PLOT 1
x <- d2
y <- data[[3]]
plot(x,y,ylab="Global Active Power",xlab="", type="l")

# PLOT 2
x <- d2
y <- data[[5]]
plot(x,y,ylab="Voltage",xlab="datetime", type="l")


# PLOT 3
x <- d2
y1 <- dat[[7]]
y2 <- dat[[8]]
y3 <- dat[[9]]

plot(x,y1,ylab="Energy sub metering",xlab="", type="l",col="black")
lines(x,y2,type="l", col="red")
lines(x,y3,type="l", col="blue")
legend("topright", cex=0.8, lty= "solid", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# PLOT 4
x <- d2
y <- data[[4]]
plot(x,y,ylab="Global_reactive_power",xlab="datetime", type="l")

####################
# Output to PNG
####################

# REPEAT THE CODE TO AVOUD LEGEND TEXT CUT-OFF
png(file = "plot4.png",width=480, height=480)
############### COPY FROM ABOVE ######################
par(mfrow=c(2,2))

# PLOT 1
x <- d2
y <- data[[3]]
plot(x,y,ylab="Global Active Power",xlab="", type="l")

# PLOT 2
x <- d2
y <- data[[5]]
plot(x,y,ylab="Voltage",xlab="datetime", type="l")


# PLOT 3
x <- d2
y1 <- dat[[7]]
y2 <- dat[[8]]
y3 <- dat[[9]]

plot(x,y1,ylab="Energy sub metering",xlab="", type="l",col="black")
lines(x,y2,type="l", col="red")
lines(x,y3,type="l", col="blue")
legend("topright", cex=0.8, lty= "solid", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# PLOT 4
x <- d2
y <- data[[4]]
plot(x,y,ylab="Global_reactive_power",xlab="datetime", type="l")

############### END ######################
dev.off()



