##Please store the extracted folder containing the dataset to the working directory

directory <- getwd()
file_path <- paste(directory,"/","exdata_data_household_power_consumption","/","household_power_consumption.txt",sep="")
table1 <- read.delim(file_path, sep = ";",na.strings = "?")
table1[,1] <- as.Date(strptime(table1[,1], format= "%d / %m / %Y"))

reqd_data <- subset(table1, (Date==as.Date("2007-02-01"))|(Date==as.Date("2007-02-02")))

png(filename="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2),mar=c(4,4,2,1))
plot(reqd_data$Global_active_power ~ as.POSIXct(paste(reqd_data$Date,reqd_data$Time),
                                                  format="%Y-%m-%d %H:%M:%S"),
                     type='l', ylab ="Global Active Power (kilowatts)", xlab="")
plot(reqd_data$Voltage ~ as.POSIXct(paste(reqd_data$Date,reqd_data$Time),format="%Y-%m-%d %H:%M:%S"),
                     type='l', ylab ="Voltage", xlab="datetime")
with(reqd_data, plot(Sub_metering_1~as.POSIXct(paste(reqd_data$Date, reqd_data$Time),
      format="%Y-%m-%d %H:%M:%S"), col='black', type='l', ylab="Energy sub metering", xlab=""))

lines(reqd_data$Sub_metering_2~as.POSIXct(paste(reqd_data$Date, reqd_data$Time),
                              format="%Y-%m-%d %H:%M:%S"), col='red', type='l',xlab="")
lines(reqd_data$Sub_metering_3~as.POSIXct(paste(reqd_data$Date, reqd_data$Time),
                              format="%Y-%m-%d %H:%M:%S"), col='blue', type='l',xlab="")


legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red","blue"),lty=1)

plot(reqd_data$Global_reactive_power ~ as.POSIXct(paste(reqd_data$Date,reqd_data$Time),format="%Y-%m-%d %H:%M:%S"),
     type='l', ylab ="Global_reactive_power",xlab="datetime")

dev.off()