#load in our original dataset and the GPX files we generated
#these are the only three variables we need to change between runs
raw_data <- read.csv("C:/Users/micha/Desktop/trip-end-delivery-set.csv")
gpx_path <- "C:/Users/micha/Desktop/delivery-gpx/"

gpx_files <- list.files(gpx_path)

file.create("C:/Users/micha/Desktop/master-deliveries.json")

#the default JSON header
JSON_FILE <- '{"type":"FeatureCollection","features":['

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
                     '"properties":{"uuid_from_gpx":"', gsub('.{4}$', '"}', file),
                     '},', sep="")
  
  write(JSON_FILE,file="C:/Users/micha/Desktop/master-deliveries.json",append=TRUE)
  
  JSON_FILE <- ""
  
}

