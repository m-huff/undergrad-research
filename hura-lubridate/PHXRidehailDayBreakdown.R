library(lubridate)
library(dplyr)

years <- c("2016","2017","2018","2019")
dat <- read.csv("C:/Users/micha/Desktop/p_2015_10.csv")[,c(3,10)]

for (year in years) {
  tFrame <- read.csv(paste("C:/Users/micha/Desktop/p_",year,"_10.csv",sep=""))[,c(3,10)]
  colnames(tFrame) <- c("start","type")
  dat <- rbind(dat, tFrame)
}

dat <- dat[sample(nrow(dat), 65240), ]
rm(tFrame,year,years)


dat$start <- with_tz(ymd_hms(dat$start), "US/Arizona")
dat$wkday <- wday(dat$start)
dat$hour <- hour(dat$start)

dat <- dat %>%
  mutate(cat = case_when(
    wkday>=6 ~ "Weekend",
    wkday < 6 & (hour >= 6 & hour <=7 | hour >= 15 & hour <= 16) ~ "Weekday Peak",
    wkday < 6 & !(hour >= 6 & hour <=7 | hour >= 15 & hour <= 16) ~ "Weekday Off-peak",
  ))

table(dat$cat)
