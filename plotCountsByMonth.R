#Install: run this in a workspace
#install.packages("zoo")
#install.packages("lubridate")

library(zoo)
library(lubridate)
library(xts)

plays <- read.csv("countsByMonth.csv", stringsAsFactors=FALSE, header=TRUE)

#names(plays)

# Column Vector
#firstColumn <- plays[["count"]]
#firstColumn

# Row slice
#plays[1,]
#firstAndSecondRows <- plays[c(1,2),]
#firstAndSecondRows

# Column slice
#firstColumn <- plays[,c("count")]
#firstColumn

png("plotCountsByMonth.png",
  width     = 20,
  height    = 10,
  units     = "cm",
  res       = 1200,
  pointsize = 5)

######################################
# 1 - If csv file has Y_m_d format

# Convert to dates
#plays$month <- as.Date(plays$month, "%Y_%m_%d")

#z <- zoo(plays$count, order.by=plays$month)
#z

#loline <- lowess(z, f=.5)
#plot(z, main="Plays per month since 2006", xlab = "Date", ylab = "Number of plays", xaxt="n")
#axis(1, at = seq(10, 200, by = 10), las=2)
#lines(index(z), loline$y, col='red', lwd=2)

######################################
# 2 - If csv file has Y_m format

# Convert from y_m
plays$month <- parse_date_time(plays$month, "y_m")

#z <- read.zoo(plays)

######################################
# 3 - If csv file has Y_m format, xts

z <- xts(plays[-1], order.by = as.yearmon(plays$month, "%Y_%m"))

tt <- time(z)
ix <- seq_along(tt) 
fmt <- "%b-%y" 
labs <- format(tt, fmt)

# Generate months from Oct 2006 to Nov 2015
# todo: http://www.r-bloggers.com/fix-missing-dates-with-r/
alldays <- seq(plays$month[1],length= 110, by="+1 month")

loline <- lowess(z, f=.5)

plot.zoo(z, xaxt = "n")

axis(side = 1, at = tt[ix], labels = labs[ix], 
         tcl = -0.7, cex.axis = 0.7, las = 2)
         
lines(index(z), loline$y, col='red', lwd=2)