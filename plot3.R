dataall <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
data <- dataall[dataall$Date=="1/2/2007" | dataall$Date=="2/2/2007",]
data[data=="?"] <- NA
data$Time <- strptime(paste(data$Date,data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date.character(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png("plot3.png")
par(mfrow=c(1,1))
with(data, 
     {
       plot(Time,Sub_metering_1, type="l",xlab = "",ylab = "Energy sub metering")
       lines(Time,Sub_metering_2, col="red")
       lines(Time,Sub_metering_3, col="blue")
       legend("topright", pch = 151, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
     })
dev.off()