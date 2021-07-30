library(dplyr)
library(readr)
library(lubridate)

#bind full hura dataset together into one data frame
data.full <- list.files(path="C:/Users/micha/Desktop/hura_data_raw", full.names = TRUE) %>% 
    lapply(read_csv) %>% 
    bind_rows 

#remove personal trips
data.full <- data.full[data.full$type != 1,]

#create new lubridate fields to find the hour of the day the trip started in
data.full["start_adjusted"] <- with_tz(ymd_hms(data.full$start), "US/Arizona")
data.full["hour_of_day"] <- hour(data.full$start_adjusted)
data.full["dt"] <- data.full$hour_of_day

data.full$dt[data.full$dt <= 5,] <- "late-night"
data.full$dt[data.full$dt >= 6 & data.full$dt <= 8] <- "am-peak"

#odd, bad code, but didn't work otherwise
data.full$dt[data.full$dt == 9] <- "mid-day"
data.full$dt[data.full$dt == 10] <- "mid-day"
data.full$dt[data.full$dt == 11] <- "mid-day"
data.full$dt[data.full$dt == 12] <- "mid-day"
data.full$dt[data.full$dt == 13] <- "mid-day"
data.full$dt[data.full$dt == 14] <- "mid-day"
data.full$dt[data.full$dt == 15] <- "mid-day"

data.full$dt[data.full$dt >= 16 & data.full$dt <= 18] <- "pm-peak"
data.full$dt[data.full$dt >= 19 & data.full$dt <= 23] <- "early-night"

#quick table output
#bad practice, but since we can't find which ones were unable to be mapmatched,
#this is one of the best options
#sample the final dataset size from this dataset
sample_sized_data <- data.full[sample(nrow(data.full), 65240), ]
table(sample_sized_data$dt)
