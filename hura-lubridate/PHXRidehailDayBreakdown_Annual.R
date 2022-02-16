library(lubridate)
library(dplyr)

dat_15 <- read.csv("C:/Users/micha/Desktop/p_2015_10.csv")[,c(3,10)]
dat_15 <- dat_15[sample(nrow(dat_15), 13459), ]

dat_16 <- read.csv("C:/Users/micha/Desktop/p_2016_10.csv")[,c(3,10)]
dat_16 <- dat_16[sample(nrow(dat_16), 12983), ]

dat_17 <- read.csv("C:/Users/micha/Desktop/p_2017_10.csv")[,c(3,10)]
dat_17 <- dat_17[sample(nrow(dat_17), 12511), ]

dat_18 <- read.csv("C:/Users/micha/Desktop/p_2018_10.csv")[,c(3,10)]
dat_18 <- dat_18[sample(nrow(dat_18), 12832), ]

dat_19 <- read.csv("C:/Users/micha/Desktop/p_2019_10.csv")[,c(3,10)]
dat_19 <- dat_19[sample(nrow(dat_19), 13455), ]

classifyTemporal <- function(dat) { 
  dat$start <- with_tz(ymd_hms(dat$start), "US/Arizona")
  dat$wkday <- wday(dat$start)
  dat$hour <- hour(dat$start)

  dat <- dat %>%
    mutate(cat = case_when(
      wkday >= 6 ~ "Weekend",
      wkday < 6 & (hour >= 6 & hour <=7 | hour >= 15 & hour <= 16) ~ "Weekday Peak",
      wkday < 6 & !(hour >= 6 & hour <=7 | hour >= 15 & hour <= 16) ~ "Weekday Off-peak",
    ))
  
  table(dat$cat)
}

### RUN THE OPERATION ###
classifyTemporal(dat_15)
classifyTemporal(dat_16)
classifyTemporal(dat_17)
classifyTemporal(dat_18)
classifyTemporal(dat_19)

