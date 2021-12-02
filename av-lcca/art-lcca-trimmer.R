library("dplyr")

dat <- read.csv("C:/Users/micha/Desktop/art-lc.csv")

dat <- dat %>% mutate_all(na_if,"")
dat <- dat[(!is.na(dat$cars_per_adult)),]

write.csv(dat, "C:/Users/micha/Desktop/art-lc-2.csv")
