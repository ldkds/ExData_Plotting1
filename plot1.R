# READ DATA, for simplicity assume the file is fixed.
# Identify the data segment using its rows
skip <- 66637
nrows <- (69517 - 66637)
data <- read.csv("household_power_consumption.txt",sep=";", skip=skip,nrows=nrows,header=FALSE)
# 3. Global_active_power: household global minute-averaged active power (in kilowatt)

# PLOT
par(mfrow = c(1,1))
hist(data[[3]], col = "red", ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# Output to PNG
dev.copy(png, file = "plot1.png")
dev.off()


