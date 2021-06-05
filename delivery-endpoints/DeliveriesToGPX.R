#######################################
###### GEP TO CLEANED GPX ENGINE ######
############ MICHAEL HUFF #############
#######################################

library("gepaf")

#decimals to include in lat/long decoding
DECODING_FACTOR <- 5

#max distance between points before we insert filler points
MAX_GRAPHHOPPER_POINT_DIST <- 0.015

#max distance between points on BOTH axes to warrant removal
GHOST_POINT_REMOVAL_PRECISION <- 0.0001

dat_dir <- "C:/Users/micha/Desktop/"
excel_sheet <- "trip-end-delivery-set.csv"
exclusion_data <- data.frame(user_id=integer(),encoded_path=character(),uid=integer(),year=integer())

#import original data set, then separate the relevant columns
raw_data <- read.csv(paste(dat_dir, excel_sheet, sep=""))
trip_paths = raw_data[,'trip_path']

###########################################
######## DECODE AND CLEAN POLYLINES #######
###########################################

for (i in seq(1, length(trip_paths), 1)) {
  
  #use gepaf function 'decodePolyline' to decode the strings into lat/long data frame
  #factor is the number of decimal digits to include (5)
  coord_table <- decodePolyline(enc_polyline = trip_paths[i], factor = DECODING_FACTOR)
  EXCLUDE_THIS_TRIP <- FALSE
  
  ####################################
  ######## GHOST POINT REMOVER #######
  ####################################
  
  x <- length(coord_table$lat)
  while (x > 1) {
    
    #might as well also flag trips outside the bounding box while we're looping
    if (coord_table$lat[x] < 32.5039 | coord_table$lat[x] > 34.4427 | 
        coord_table$lon[x] < -113.3854 | coord_table$lon[x] > -110.3826) {
      
      exclusion_data[nrow(exclusion_data) + 1,] = c(raw_data[i,],"trip out of bounds")
      EXCLUDE_THIS_TRIP <- TRUE
      break
    }
    
    #flag and remove points that are duplicate/ghost points in a line
    if (abs(coord_table$lat[x] - coord_table$lat[x-1]) <= GHOST_POINT_REMOVAL_PRECISION &
        abs(coord_table$lon[x] - coord_table$lon[x-1]) <= GHOST_POINT_REMOVAL_PRECISION) {
      
      coord_table <- coord_table[-c(x),]
    }
    
    x = x - 1
  }
  
  ###############################################
  ######## CORRUPT/UNUSABLE TRIP FLAGGING #######
  ###############################################
  
  #if trip is all ghost points, flag and write it to exclusion folder
  if (length(coord_table$lat) == 1) {
    
    exclusion_data[nrow(exclusion_data) + 1,] = c(raw_data[i,],"trip is all ghost points")
    EXCLUDE_THIS_TRIP <- TRUE
    
  }
  
  #TODO: flag trips that have erratically moving points
  
  ####################################
  ###### FILLER POINT GENERATOR ######
  ####################################
  
  x <- length(coord_table$lat)
  while (x > 1 & EXCLUDE_THIS_TRIP == FALSE) {
    
    #check if this point and the next are far apart in a north-south line
    if (abs(coord_table$lat[x] - coord_table$lat[x-1]) > MAX_GRAPHHOPPER_POINT_DIST |
        abs(coord_table$lon[x] - coord_table$lon[x-1]) > MAX_GRAPHHOPPER_POINT_DIST) {
      
      #create empty data frame for results
      filler_lats <- numeric()
      filler_lons <- numeric()
      
      #how far do we need to travel N/S?
      distance_lat <- round(abs(coord_table$lat[x] - coord_table$lat[x-1]), digits = 5)
      
      #how far do we need to travel E/W?
      distance_lon <- round(abs(coord_table$lon[x] - coord_table$lon[x-1]), digits = 5)
      
      #what is the slope between these two points?
      point_slope <- (coord_table$lon[x-1] - coord_table$lon[x]) / (coord_table$lat[x-1] - coord_table$lat[x])
      
      #what size step do we take between these points?
      #use longer distance, lat or long
      num_steps <- ifelse((distance_lat > distance_lon), 
                          distance_lat / (MAX_GRAPHHOPPER_POINT_DIST), 
                          distance_lon / (MAX_GRAPHHOPPER_POINT_DIST))
      
      #set a flag so we know which one to use
      use_lat_distance <- ifelse((distance_lat > distance_lon), TRUE, FALSE)
      
      #calculate point coordinates based on number of steps and which direction
      for(step in seq(1, num_steps, 1)) {
        
        #if we're using latitude distance, calculate other point based on x slope
        if (use_lat_distance == TRUE) {
          
          #go the step length in the longer direction
          point_lat <- coord_table$lat[x] + ifelse(coord_table$lat[x] - coord_table$lat[x-1] > 0,
                                                   -(MAX_GRAPHHOPPER_POINT_DIST), 
                                                   (MAX_GRAPHHOPPER_POINT_DIST))
          
          #append this lat to filler lat list
          filler_lats <- c(filler_lats, point_lat)
          
          #calculate where the corresponding longitude should be
          #x2 = (M * (y2 - y1)) + x1
          point_lon <- (point_slope * (point_lat - coord_table$lat[x])) + coord_table$lon[x]
          
          #append this lon to filler lon list
          filler_lons <- c(filler_lons, point_lon)
          
          #append this new point to the filler point frame
          filler_point_frame <- data.frame(lat = filler_lats, lon = filler_lons)
          
          #insert our filler points into the coord_table
          coord_table <- rbind(coord_table[1:x-1,], 
                               filler_point_frame[seq(dim(filler_point_frame)[1],1),], 
                               coord_table[-(1:x-1),])
          
        } else {
          
          #go the step length in the longer direction
          point_lon <- coord_table$lon[x] + ifelse(coord_table$lon[x] - coord_table$lon[x-1] > 0,
                                                   -(MAX_GRAPHHOPPER_POINT_DIST), 
                                                   (MAX_GRAPHHOPPER_POINT_DIST))
          
          #append this lat to filler lat list
          filler_lons <- c(filler_lons, point_lon)
          
          #calculate where the corresponding longitude should be
          #y2 = ((x2 - x1) / M) + y1
          point_lat <- ((point_lon - coord_table$lon[x]) / point_slope) + coord_table$lat[x]
          
          #append this lat to filler lat list
          filler_lats <- c(filler_lats, point_lat)
          
          #append this new point to the filler point frame
          filler_point_frame <- data.frame(lat = filler_lats, lon = filler_lons)
          
          #insert our filler points into the coord_table
          coord_table <- rbind(coord_table[1:x-1,], 
                               filler_point_frame[seq(dim(filler_point_frame)[1],1),], 
                               coord_table[-(1:x-1),])
          
        }
      }
    }
    x = x - 1
  }
  
  #########################
  ###### GPX BUILDER ######
  #########################
  
  #generate GPX header
  gpx_data <- c('<gpx version="1.1" creator="Mike Huff">','<trk>','<trkseg>') 
  
  #fill in GPX entries for each point we cleaned
  for (j in seq(1, length(coord_table$lat), 1)) {
    gpx_data <- c(gpx_data, paste('<trkpt lat="',coord_table$lat[j],
                                  '" lon="',coord_table$lon[j],'" />', sep='')) 
  }
  
  #generate GPX footer
  gpx_data <- c(gpx_data, '</trkseg>', '</trk>', '</gpx>') 
  
  #build output file name
  #separate out the exclusions into their own folder
  
  #FILE NAME CORRESPONDS WITH ROW IN CSV
  #this sucks, but makes the output files be in order
  
  prefix <- ""
  
  if (i < 10000) {
    prefix <- "0"
  }
  
  if (i < 1000) {
    prefix <- "00"
  }
  
  if (i < 100) {
    prefix <- "000"
  }
  
  if (i < 10) {
    prefix <- "0000"
  }
  
  if (EXCLUDE_THIS_TRIP == TRUE) {
    output_file_name <- paste(prefix,i,"_EXCLUDED.gpx", sep= "")
  } else {
    output_file_name <- paste(prefix,i,".gpx", sep= "")
  }
  
  #create output file
  output_file_path <- "C:/Users/micha/Desktop/delivery-gpx/"
  file.create(output_file_name)
  cat(gpx_data, file = paste(output_file_path,output_file_name,sep=""), sep='\n')
  
  print(paste("Moved on to file #",i))
  
  #dump trip variables
  rm(list = c("coord_table","gpx_data"))
}
