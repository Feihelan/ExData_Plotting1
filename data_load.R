
## Read data 

# First create temp files and download files from website and saved as temp, 
# then unzip the files and delete temp files
if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}
# read file to table
powerdata <- read.table(file, header=T, sep=";")
# convert date format
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
# subset data for two days
df <- powerdata[(powerdata$Date=="2007-02-01") | (powerdata$Date=="2007-02-02"),]


# variables 
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))

df$Voltage <- as.numeric(as.character(df$Voltage))

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))

df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))

df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

# create date time variable
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

getwd()




