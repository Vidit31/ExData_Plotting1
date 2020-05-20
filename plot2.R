
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

png(filename = "plot2.png")
plot(p1$Time, p1$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="n")
lines(p1$Time, p1$Global_active_power, type="l")
dev.off()