#APPEND FID TO TRACE SET FIRST
delivery_uid_set <- read.csv("C:/Users/micha/Desktop/new-del-trc.csv")[,c("FID","year","driver")]
matched_files_directory <- "C:/Users/micha/Desktop/matched/_gpx/"
out_folder <- "C:/Users/micha/Desktop/delivery-matched/"

gpx_files <- list.files(matched_files_directory)

for (file in gpx_files) {
  
  shifted_uid <- as.integer(strsplit(file, "_")[[1]][4]) - 1
  gpx_year <- as.integer(strsplit(strsplit(file, "_")[[1]][5], ".gpx")[[1]][1])
  gpx_driver <- as.integer(strsplit(file, "_")[[1]][2])
  
  for (i in seq(1, length(delivery_uid_set$FID), 1)) {
    
    if (shifted_uid == delivery_uid_set$FID[i] & gpx_year == delivery_uid_set$year[i] & gpx_driver == delivery_uid_set$driver[i]) {
      
      file.copy(paste(matched_files_directory,file,sep=""), out_folder)
      
    }
    
  }
  
}

