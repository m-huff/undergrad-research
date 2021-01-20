library(rjson)
output_file <- "C:/Users/micha/Desktop/master.geojson"
json_data <- fromJSON(file = output_file)

final_frame <- data.frame(year=double(),
                          uid=double(),
                          driverID=double(),
                          date=character(),
                          startTime=character(),
                          endTime=character(),
                          distance=double(),
                          duration=double(),
                          tripType=double(),
                          notes=character(),
                          startLat=double(),
                          startLong=double(),
                          matchType=double())

iter <- 1
while (iter < length(json_data$features)) {
  
  this_trip <- json_data$features[[iter]]$properties
  
  final_frame[nrow(final_frame) + 1,] = c(this_trip$t_year,
                                          this_trip$g_uid,
                                          this_trip$p_driver_id,
                                          this_trip$t_date,
                                          this_trip$t_start,
                                          this_trip$t_end,
                                          this_trip$p_dist,
                                          this_trip$p_duration,
                                          this_trip$g_type,
                                          this_trip$g_notes,
                                          this_trip$p_lat,
                                          this_trip$p_lon,
                                          this_trip$g_match_type)
  
  iter <- iter + 1
  
}

write.csv(final_frame,
          "C:/Users/micha/Desktop/master.csv",
          row.names = FALSE)
