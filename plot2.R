#
# plot2.R - Arnie Larson
#
# Script for creating plots 
# for Coursera Exploratory Analysis Course: 
# https://class.coursera.org/exdata-033
#
# To create plot2, source('plot2.R'), then call run()
#

#
# Run script to generate plot2
# Depends on plot1.R - in cur directory
# 
run <- function() {
    source('plot1.R')
    png("plot2.png")
    d<-load()
    ss<-selectSubset(d)
    plot2(ss)
    dev.off()
}



plot2 <- function(ss) {
    # plot a time series plot - convert Dates and Times, plot vs. variable
    plot(strptime(paste(ss$Date,ss$Time),"%d/%m/%Y %H:%M:%S"),ss$Global_active_power,
            type="l", xlab="",ylab="Global Active Submetering (kilowatts)")
}

