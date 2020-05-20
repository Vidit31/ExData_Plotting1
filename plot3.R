
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Power.zip")
unzip("Power.zip")

pow <- read.csv2("household_power_consumption.txt", header = TRUE)
head(pow)

pow[,3:9] <- lapply(pow[,3:9], function (x) as.numeric(x))
head(pow)

pow[,1] <- as.Date(pow[,1], format = "%d/%m/%Y")
pow[,2] <- as.POSIXct(paste(pow[,1],pow[,2]), format = "%d/%m/%Y %H:%M:%S")

p1 <- subset(pow, pow$Date >= as.Date("2007-02-01") & pow$Date <= as.Date("2007-02-02"))

png(filename = "plot3.png")
plot(p1$Time, p1$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
lines(p1$Time, p1$Sub_metering_1, type="l", col = 'black')
lines(p1$Time, p1$Sub_metering_2, type="l", col = 'red')
lines(p1$Time, p1$Sub_metering_3, type="l", col = 'blue')
legend("topright", lty = c(1,1,1), col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()