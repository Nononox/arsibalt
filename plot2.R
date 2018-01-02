##Please store the extracted folder containing the dataset to the working directory

directory <- getwd()
file_path <- paste(directory,"/","exdata_data_household_power_consumption","/","household_power_consumption.txt",sep="")
table1 <- read.delim(file_path, sep = ";",na.strings = "?")
table1[,1] <- as.Date(strptime(table1[,1], format= "%d / %m / %Y"))

reqd_data <- subset(table1, (Date==as.Date("2007-02-01"))|(Date==as.Date("2007-02-02")))

png(filename="plot2.png", width = 480, height =480)

with(reqd_data, plot(Global_active_power ~ as.POSIXct(paste(reqd_data$Date, reqd_data$Time),format="%Y-%m-%d %H:%M:%S"),
                     type='l', ylab ="Global Active Power (kilowatts)", xlab=""))
dev.off()

