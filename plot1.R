#
# plot1.R - Arnie Larson
#
# Script for creating plots 
# for Coursera Exploratory Analysis Course: 
# https://class.coursera.org/exdata-033
#
# To create plot1, source('plot1.R'), then call run()
#
# Contains data loading functions, dependency of other plotting scripts


# run script to generate plot1
# uses file device to generate a png of the plot
run <- function() {
    png("plot1.png")
    d<-load()
    ss<-selectSubset(d)
    plot1(ss)
    dev.off()
}


plot1 <- function(ss, column="Global_active_power") {
    hist(ss[,column], xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
}



# Logic to subset from the data by Date - hardcoded to data of interest
# Note - would be much better to take in a list of dates of interest
selectSubset <- function(d) {

    ss <- d[(d$Date=="1/2/2007" | d$Date=="2/2/2007"),]
    return (ss)

}

# copy png file from display..
savepng <- function(fn) {
    dev.copy(png, bg="white", file=fn)
    dev.off()
}

# loader function, with hardcoded filenames to load data
# Note - only loads in the first 100000 rows b/c they contain the data of interest, 2/1/2007 & 2/2/2007 
load <- function(){
    dir <- "~/Documents/Coursera/exploratory/data"
    file <- "household_power_consumption.txt"
    return (loaddata(dir,file) )
}

loaddata <- function(directory=".", file, sep=";", nrows=100000) {
          
    if (!is(directory,'character')) {
        stop('directory must be a character')
    }
    if (is.null(file)) {
        stop('file is null')
    }
    return (read.csv(sprintf("%s/%s",directory, file), sep=sep,
               header=TRUE,na.strings="?",nrows=nrows))
                
}
