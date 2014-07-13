# READ DATA, for simplicity assume the file is fixed.
# Identify the data segment using its rows
skip <- 66637
nrows <- (69517 - 66637)
data <- read.csv("household_power_consumption.txt",sep=";", skip=skip,nrows=nrows,header=FALSE)

# 1. Date: Date in format dd/mm/yyyy 
# 2. Time: time in format hh:mm:ss 
# 3. Global_active_power: household global minute-averaged active power (in kilowatt)

d1 <- paste(data[[1]],data[[2]])
d2 <- strptime(d1,format ="%d/%m/%Y %H:%M:%S")

# PLOT
x <- d2
y <- data[[3]]
par(mfrow = c(1,1))
plot(x,y,ylab="Global Active Power (kilowatts)",xlab="", type="l")

# Output to PNG
dev.copy(png, file = "plot2.png")
dev.off()
