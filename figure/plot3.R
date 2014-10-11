# ********  R Code for Exploratory Data Analysis, Project 1  *************
# Plot 2

# Step 1: Read in the data file
wd <- "C:/EDA_Projects/"
main_dir <- paste0(wd,"Project1/ExData_Plotting1/figure/")
data_dir <- paste0(wd,"data/")
file_name <- "household_power_consumption.txt"

# Read in only the rows required, 2007-02-01 & 2007-02-02
start_row <- 66638
end_row <- 69517
col_classes <- c("character","character",rep("numeric",7))
energy_data <- read.table(paste0(data_dir,file_name),header=TRUE,sep=";",
                          colClasses=col_classes,stringsAsFactors=FALSE,nrows=end_row-start_row+1,skip=start_row-2)
# Read the Header
header <- read.table(paste0(data_dir,file_name),header=TRUE,sep=";",
                     colClasses=col_classes,stringsAsFactors=FALSE,nrows=1)
names(energy_data) <- names(header)

# Step 2: Create a date_time field
date_time <- with(energy_data,paste(Date,Time,sep="-"))
energy_data$Date_Time <- strptime(date_time,"%d/%m/%Y-%H:%M:%S")

# Step 3: Create and save plot 3
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
