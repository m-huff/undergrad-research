library("gepaf")

raw_data <- read.csv("C:/Users/micha/Desktop/delivery-dataset.csv")
trip_paths = raw_data[,'trip_path']

for (i in seq(1, length(trip_paths), 1)) {
  
  coord_table <- decodePolyline(enc_polyline = trip_paths[i], factor = 5)
  last_pair <- coord_table[nrow(coord_table),]
  
  raw_data$end_lat[i] <- c(last_pair$lat)
  raw_data$end_long[i] <- c(last_pair$lon)
  
}

write.csv(raw_data, "C:/Users/micha/Desktop/trip-end-delivery-set.csv", row.names = FALSE)
