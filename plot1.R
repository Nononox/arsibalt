##Please store the extracted folder containing the dataset to the working directory

directory <- getwd()
file_path <- paste(directory,"/","exdata_data_household_power_consumption","/","household_power_consumption.txt",sep="")
table1 <- read.delim(file_path, sep = ";",na.strings = "?")
table1[,1] <- as.Date(strptime(table1[,1], format= "%d / %m / %Y"))

reqd_data <- subset(table1, (Date==as.Date("2007-02-01"))|(Date==as.Date("2007-02-02")))

png(filename="plot1.png", width = 480, height =480)
with(reqd_data, hist(Global_active_power, col="red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)"))

dev.off()


