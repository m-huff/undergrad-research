library(lubridate)
library(dplyr)

classifyTemporal <- function(filePath, sampleSize) { 
  
  dat <- read.csv(filePath)[,c(3,10)]
  colnames(dat) <- c("start","type")
  dat <- dat[dat$type != 1,]
  dat <- dat[sample(nrow(dat), sampleSize),]
  
  dat$start <- with_tz(ymd_hms(dat$start), "US/Arizona")
  dat$wkday <- wday(dat$start)
  dat$hour <- hour(dat$start)

  dat <- dat %>%
    mutate(cat = case_when(
      wkday >= 6 ~ "05 Weekend",
      wkday < 6 & hour >= 0 & hour < 7 ~ "00 Early Weekday",
      wkday < 6 & hour >= 7 & hour < 10 ~ "01 AM Weekday Peak",
      wkday < 6 & hour >= 17 & hour < 20 ~ "03 PM Weekday Peak",
      wkday < 6 & hour >= 10 & hour < 17 ~ "02 Midday Weekday",
      wkday < 6 & hour >= 20 & hour <= 23 ~ "04 Late Weekday",
    ))
  
  table(dat$cat)
}

### RUN THE OPERATION ###
classifyTemporal("C:/Users/micha/Desktop/p_2015_10.csv", 13459)
classifyTemporal("C:/Users/micha/Desktop/p_2016_10.csv", 12983)
classifyTemporal("C:/Users/micha/Desktop/p_2017_10.csv", 12511)
classifyTemporal("C:/Users/micha/Desktop/p_2018_10.csv", 12832)
classifyTemporal("C:/Users/micha/Desktop/p_2019_10.csv", 13455)

rm(list = ls())