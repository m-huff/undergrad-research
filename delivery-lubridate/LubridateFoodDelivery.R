library("lubridate", "ggplot2")

sample <- read.csv("C:/Users/micha/Desktop/p_2018_10.csv")
#fix data -- convert to DateTime objects
for (i in seq(1, length(sample$start), 1)) {
  sample$start[i] <- gsub('.{3}$', '', sample$start[i])
}
rm("i")

#create adjusted DateTimes for correct timezone and day of week
sample["start_adjusted"] <- with_tz(ymd_hms(sample$start), "US/Arizona")
sample["weekday"] <- wday(sample$start_adjusted)
sample["hour_of_day"] <- hour(sample$start_adjusted)

#write.csv(sample, "C:/Users/micha/Desktop/histogram_18.csv")
