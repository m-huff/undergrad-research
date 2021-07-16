library("lubridate")

sample <- read.csv("C:/Users/micha/Desktop/delivery-tracks.csv")

#create adjusted DateTimes for MOUNTAIN TIME AZ
sample$start_time <- with_tz(mdy_hm(sample$start_time), "US/Arizona")
sample$end_time <- with_tz(mdy_hm(sample$end_time), "US/Arizona")

#dump to file
write.csv(sample, "C:/Users/micha/Desktop/delivery-tracks-timezone.csv")

