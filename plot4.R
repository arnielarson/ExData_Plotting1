#
# plot4.R - Arnie Larson
#
# Script for creating plots 
# for Coursera Exploratory Analysis Course: 
# https://class.coursera.org/exdata-033
#
# To create plot4, source('plot4.R'), then call run()
#

#
# Run script to generate plot3
# Depends on plot1.R, plot2.R and plot3.R - in cur directory 
# 
run <- function() {
    source('plot1.R')
    source('plot2.R')
    source('plot3.R')
    png("plot4.png")
    d<-load()
    ss<-selectSubset(d)
    plot4(ss)
    dev.off()
}

plot4 <- function(ss) {

    par(mfrow=c(2,2))
    plot1(ss)
    plot2(ss)
    plot3(ss, "n")
    plot(strptime(paste(ss$Date,ss$Time),"%d/%m/%Y %H:%M:%S"),ss$Global_reactive_power,
            type="l", xlab="",ylab="Global Reactive Power")
    
}



