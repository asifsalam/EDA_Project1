# ********  R Code for Exploratory Data Analysis, Project 1  *************
# Plot 1

# Step 1: Read in the data file
wd <- "C:/Users/tksassa/Documents/20-GitProjects/2014/100-LearningR/01-CourseProjects/15-ExploratoryDataAnalysis/EDA_Projects/"
main_dir <- paste0(wd,"Project1/ExData_Plotting1/figure/")
data_dir <- paste0(wd,"data/")
file_name <- "household_power_consumption.txt"

start_row <- 66638
end_row <- 69517
col_classes <- c("character","character",rep("numeric",7))
energy_data <- read.table(paste0(data_dir,file_name),header=TRUE,sep=";",
                          colClasses=col_classes,stringsAsFactors=FALSE,nrows=end_row-start_row+1,skip=start_row-2)
# Read the Header
header <- read.table(paste0(data_dir,file_name),header=TRUE,sep=";",
                     colClasses=col_classes,stringsAsFactors=FALSE,nrows=1)
names(energy_data) <- names(header)

# Not used, since only the required data is read in
start_date <- strptime("2007-02-01","%Y-%m-%d")
end_date <- strptime("2007-02-02","%Y-%m-%d")

test_data <- subset(energy_data,as.Date(Date_Time) >= test_date & as.Date(Date_Time))
test_data <- subset(energy_data,Date_Time >= start_date & Date_Time <= end_date)

# Create a date_time field
date_time <- with(energy_data,paste(Date,Time,sep="-"))
energy_data$Date_Time <- strptime(date_time,"%d/%m/%Y-%H:%M:%S")

# Create and save the plot 1
plot_file <- paste0(main_dir,"plot1.png")
png(file=plot_file)
hist(energy_data$Global_active_power,main="Global Actie Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()

# Create plot 2
x <- energy_data$Date_Time
y <- energy_data$Global_active_power
label_location <- c(strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S"),
                    strptime("2007-02-02 00:00:00","%Y-%m-%d %H:%M:%S"),
                    strptime("2007-02-02 23:58:00","%Y-%m-%d %H:%M:%S"))
label_name <- c("Thu","Fri","Sat")

plot_file <- paste0(main_dir,"plot2.png")
png(file=plot_file)
plot(x=x,y=y,type="l",xaxt="n",xlab=NA,ylab="Global Active Power (kilowatts)")
axis.POSIXct(1, at = label_location  , labels=label_name)
dev.off()


# Create plot 3
x <- energy_data$Date_Time
sm_1 <- energy_data$Sub_metering_1
sm_2 <- energy_data$Sub_metering_2
sm_3 <- energy_data$Sub_metering_3
label_location <- c(strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S"),
                    strptime("2007-02-02 00:00:00","%Y-%m-%d %H:%M:%S"),
                    strptime("2007-02-02 23:58:00","%Y-%m-%d %H:%M:%S"))
label_name <- c("Thu","Fri","Sat")

plot_file <- paste0(main_dir,"plot3.png")
png(file=plot_file)
plot(x=x,y=sm_1,type="l",xaxt="n",xlab=NA,ylab="Energy Sub Metering")
lines(x=x,y=sm_2,col="red")
lines(x=x,y=sm_3,col="blue")
axis.POSIXct(1, at = label_location  , labels=label_name)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()


# Create plot 4
# 


label_location <- c(strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S"),
                    strptime("2007-02-02 00:00:00","%Y-%m-%d %H:%M:%S"),
                    strptime("2007-02-02 23:58:00","%Y-%m-%d %H:%M:%S"))
label_name <- c("Thu","Fri","Sat")

plot_file <- paste0(main_dir,"plot4.png")
png(file=plot_file)
par(mfrow=c(2,2))
plot(x=energy_data$Date_Time,y=energy_data$Global_active_power,type="l",
     xaxt="n",xlab=NA,ylab="Global Active Power (kilowatts)")
axis.POSIXct(1, at = label_location  , labels=label_name)

plot(x=energy_data$Date_Time,y=energy_data$Voltage,type="l",
     xaxt="n",xlab="datetime",ylab="Voltate")
axis.POSIXct(1, at = label_location  , labels=label_name)


x <- energy_data$Date_Time
sm_1 <- energy_data$Sub_metering_1
sm_2 <- energy_data$Sub_metering_2
sm_3 <- energy_data$Sub_metering_3

plot(x=x,y=sm_1,type="l",xaxt="n",xlab=NA,ylab="Energy Sub Metering")
lines(x=x,y=sm_2,col="red")
lines(x=x,y=sm_3,col="blue")
axis.POSIXct(1, at = label_location  , labels=label_name)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",
       lty=1,col=c("black","red","blue"))

plot(x=energy_data$Date_Time,y=energy_data$Global_reactive_power,type="l",
     xaxt="n",xlab="datetime",ylab="Global Reactive Power")
axis.POSIXct(1, at = label_location  , labels=label_name)


dev.off()
