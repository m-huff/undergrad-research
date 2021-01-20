
#load in our original dataset and the GPX files we generated
#these are the only three variables we need to change between runs
raw_data <- read.csv("C:/Users/micha/Desktop/dataset/p_2015_10.csv")
gpx_path <- "C:/Users/micha/Desktop/matched/_gpx/2015/gpxev/"
YEAR <- 2015
TRIPS_PER_FILE <- 5

gpx_files <- list.files(gpx_path)

#the default JSON header
JSON_FILE <- '{"type":"FeatureCollection","features":['

TRIP_INDEX <- 1
CREATED_JSONS <- 0

#go through each file in the folder and strip data
for (file in gpx_files) {
  
  #pull the uid from the file name
  file_info <- strsplit(file, "_")
  dataset_matching_index <- as.integer(file_info[[1]][4]) + 1
  
  #open the GPX file to pull coordinate path
  con = file(paste(gpx_path,file,sep=""), open="r")
  
  #add the single-object JSON header
  JSON_FILE <- paste(JSON_FILE, '{"type":"feature","geometry":{"type":"LineString","coordinates":[', sep="")
  
  while (TRUE) {
    line = readLines(con, n = 1)
    
    #if a line is empty, we are at bottom of file
    #break and cut the last comma off and replace with JSON object ender
    if (length(line) == 0) {
      JSON_FILE <- gsub('.{1}$', ']}, ', JSON_FILE)
      break
    }
    
    #if the line contains a track point, pull it and convert to JSON
    if (grepl("trkpt", line, fixed = TRUE)) {
      
      line_split <- strsplit(line, '"')
      line_lat <- line_split[[1]][2]
      line_long <- line_split[[1]][4]
      
      #JSON geometry reverses lat/long when compared to GPX for some reason
      JSON_FILE <- paste(JSON_FILE, "[", line_long, ", ", line_lat, "],",sep="")
    }
  }
  
  #close the file when we're done
  close(con)
  
  #check which folder we're in and set match parameter accordingly
  #just so that we don't have to change that manually each time
  #GPXEV == 0, GRAPHHOPPER == 1
  matchPar <- 0
  
  if (grepl("graphhopper", gpx_path, fixed = TRUE)) {
    matchPar <- 1
  }
  
  #i hate everything about this
  #append all dataset vars to the JSON object
  JSON_FILE <- paste(JSON_FILE,
               '"properties":{"t_year":', YEAR,
               ',"g_uid":', as.integer(file_info[[1]][4]),
               ',"p_driver_id":', raw_data$user_id[dataset_matching_index],
               ',"t_date":"', raw_data$date[dataset_matching_index],
               '","t_start":"', raw_data$start_time[dataset_matching_index],
               '","t_end":"', raw_data$end_time[dataset_matching_index],
               '","p_dist":', raw_data$dist[dataset_matching_index],
               ',"p_duration":', raw_data$time[dataset_matching_index],
               ',"g_type":', raw_data$type[dataset_matching_index],
               ',"g_notes":"', raw_data$notes[dataset_matching_index],
               '","p_lat":', raw_data$lat[dataset_matching_index],
               ',"p_lon":', raw_data$long[dataset_matching_index],
               ',"g_match_type":', matchPar,
               '}},', sep="")
  
  #if it's the last one for the file, cut comma and add JSON ender, then produce file and start over
  #still saving a lot of space, Bida repeated the whole trip by coords at the end for some reason

  if (TRIP_INDEX > TRIPS_PER_FILE) {
    
    #remove comma that allows for more json objects and replace with full file stop
    JSON_FILE <- gsub('.{1}$', ']}', JSON_FILE)
    
    #build output file
    output_file_name <- paste("C:/Users/micha/Desktop/matched/_json/2015/",
                              as.character(CREATED_JSONS),".json", sep= "")
  

    file.create(output_file_name)
    cat(JSON_FILE, file = output_file_name, sep="")
    
    rm("JSON_FILE")
    
    #the default JSON header
    JSON_FILE <- '{"type":"FeatureCollection","features":['
    
    CREATED_JSONS <- CREATED_JSONS + 1
    TRIP_INDEX <- 0
  }
  
  print(paste("Finished converting a file. (",TRIP_INDEX,")",sep=""))
  TRIP_INDEX <- TRIP_INDEX + 1
  
}

