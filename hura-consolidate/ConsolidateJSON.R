
#file reading library
#used for pulling existing JSON data into memory
library(readr)

#path for all existing JSON files
gpx_path <- "C:/Users/micha/Desktop/mph_json/all/"
gpx_files <- list.files(gpx_path)

#create the master output file for GIS conversion
output_file_name <- "C:/Users/micha/Desktop/master.json"
file.create(output_file_name)

#the default JSON header
JSON_FILE <- '{"type":"FeatureCollection","features":['
cat(JSON_FILE, file = output_file_name, sep="")

#go through each file in the folder and strip data
for (file in gpx_files) {
  
  #pull the whole file into a single string
  json_data <- read_file(paste(gpx_path,file,sep=''))

  #remove the feature collection closer  
  json_data <- gsub('.{2}$', ',', JSON_FILE)
  
  #{"type":"FeatureCollection","features":[
  #remove this ^ from the beginning
  json_data <- substring(json_data, first = 41)

  #build output file
  cat(json_data, file = output_file_name, sep="")
  rm("json_data")

  print(paste("Finished converting a file.",sep=""))
  
}

#apply feature collection closer
json_data <- gsub('.{1}$', ']}', JSON_FILE)
