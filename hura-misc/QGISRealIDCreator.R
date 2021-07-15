library(rjson)

json_folder <- "C:/Users/micha/Desktop/mph_json/2015/"
json_files <- list.files(json_folder)

output_file <- "C:/Users/micha/Desktop/mph_json/master_2015.json"
file.create(output_file)
json_data <- fromJSON(file = paste(json_folder,"0.json",sep=""))
json_files <- json_files[-1]

for (file in json_files) {
  add_file <- fromJSON(file = paste(json_folder,file,sep=""))
  json_data$features <- c(json_data$features, add_file$features)
  rm("add_file")
}

final_JSON <- toJSON(json_data)
write(final_JSON, output_file)


#Part 2 - Generate CSV companion for new JSON file to import to GIS

sheet <- data.frame(join_id=integer(),
                    year=integer(),
                    uid=integer(),
                    driver=integer(),
                    date=character(),
                    start_time=character(),
                    end_time=character(),
                    distance=double(),
                    duration=double(),
                    type=integer(),
                    notes=character(),
                    start_lat=double(),
                    start_long=double(),
                    match_type=integer())

for (i in seq(1, length(json_data$features), 1)) {
  
  this_trip <- json_data$features[[i]]$properties
  
  sheet[nrow(sheet) + 1,] = c(i,
                                          this_trip$t_year,
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
  
}

write.csv(sheet,"C:/Users/micha/Desktop/mph_json/master_2015.csv",row.names = FALSE)
