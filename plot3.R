#
# plot3.R - Arnie Larson
#
# Script for creating plots 
# for Coursera Exploratory Analysis Course: 
# https://class.coursera.org/exdata-033
#
# To create plot3, source('plot3.R'), then call run()
#

#
# Run script to generate plot3
# Depends on plot1.R - in cur directory
# 
run <- function() {
    source('plot1.R')
    png("plot3.png")
    d<-load()
    ss<-selectSubset(d)
    plot3(ss)
    dev.off()
}

# Overlay 3 independent sets of data onto a single plot, with a legend
plot3 <- function(ss, bty="o") {
    plot(strptime(paste(ss$Date,ss$Time),"%d/%m/%Y %H:%M:%S"),ss$Sub_metering_1,
            type="l", xlab="",ylab="Energy Sub Metering")
    lines(strptime(paste(ss$Date,ss$Time),"%d/%m/%Y %H:%M:%S"),ss$Sub_metering_2,
            col="red")
    lines(strptime(paste(ss$Date,ss$Time),"%d/%m/%Y %H:%M:%S"),ss$Sub_metering_3,
            col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            lty=1,bty=bty,col=c("black","blue","red"))

}
