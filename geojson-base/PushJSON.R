library(rjson)

json_folder <- "C:/Users/micha/Desktop/mph_json/all/"
json_files <- list.files(json_folder)

output_file <- "C:/Users/micha/Desktop/mph_json/master.json"
file.create(output_file)
json_data <- fromJSON(file = paste(json_folder,"2015 (1).json",sep=""))
json_files <- json_files[-1]

for (file in json_files) {
  add_file <- fromJSON(file = paste(json_folder,file,sep=""))
  json_data$features <- c(json_data$features, add_file$features)
  rm("add_file")
}

final_JSON <- toJSON(json_data)
write(final_JSON, output_file)
