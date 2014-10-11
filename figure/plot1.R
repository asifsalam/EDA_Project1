# ********  R Code for Exploratory Data Analysis, Project 1  *************
# Plot 1

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

# Step 3: Create and save plot 1
plot_file <- paste0(main_dir,"plot1.png")
png(file=plot_file)
hist(energy_data$Global_active_power,main="Global Actie Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()

