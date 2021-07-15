library(rjson)

master_file <- fromJSON(file = "C:/Users/micha/Desktop/delivery-research/delivery-traces.json")

out <- data.frame(end_lat=double(),end_long=double())

for (i in seq(1, length(master_file$features), 1)) {
  
  trip <- master_file$features[[i]]$geometry$coordinates
  
  endpoint <- trip[[length(trip)]]
  
  lat <- endpoint[1]
  long <- endpoint[2]
  
  out[nrow(out) + 1,] = c(lat, long)
  
}

write.csv(out, "C:/Users/micha/Desktop/new-endpoints.csv")
