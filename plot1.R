library(hms)

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Power.zip")
unzip("Power.zip")

pow <- read.csv2("household_power_consumption.txt", header = TRUE)
head(pow)

pow[,3:9] <- lapply(pow[,3:9], function (x) as.numeric(x))
head(pow)

pow[,1] <- as.Date(pow[,1], format = "%d/%m/%Y")
pow[,2] <- as.hms(pow[,2])

p1 <- subset(pow, pow$Date >= as.Date("2007-02-01") & pow$Date <= as.Date("2007-02-02"))

hist(p1$Global_active_power, col = 'red')


