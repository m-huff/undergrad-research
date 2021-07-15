delivery_set <- read.csv("C:/Users/micha/Desktop/dat_delivery_trace.csv")
full_set <- read.csv("C:/Users/micha/Desktop/masterPHX.csv")[,c("distance","duration","year","driverID", "date","uid")]

delivery_set$FID <- NA

for (i in seq(1, length(delivery_set$date), 1)) {
  
  for (j in seq(1, length(full_set$date), 1)) {
    
    if (delivery_set$driver[i] == full_set$driverID[j] &
        delivery_set$date[i] == full_set$date[j] &
        delivery_set$duration[i] == full_set$duration[j] &
        delivery_set$year[i] == full_set$year[j]) {
      
      delivery_set$FID[i] <- full_set$uid[j]
      
    }
    
  }
  
}

write.csv(delivery_set, "C:/Users/micha/Desktop/new-del-trc.csv")
