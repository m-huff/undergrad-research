### ZIPCODE CENTROID LAT/LONG APPENDING SCRIPT ###
### FOR IMPORTING TEXT ZIP CODES INTO QGIS ###
### MICHAEL HUFF ###

### This script pulls ZIP code lines from a predetermined CSV file and 
### appends the ZIP code's centroid latitude and longitude to two columns
### immediately after the ZIP code. This allows us to import the ZIP
### code data spatially into QGIS and run 'Count Points in Polygon'
### directly from the raw data.

library(zipcodeR)
survey <- read.csv("C:/Users/micha/Desktop/AV Research/art-dummy.csv")

# Records in the survey that must be deleted because they
# are either ZIP codes from outside the United States or
# are not valid ZIP codes.

# The reason this is so ugly is because the syntax being
# incorrect is not the only reason a ZIP code can be invalid.
# In many cases, the ZIP codes entered are 5-digit numbers,
# but they have no corresponding jurisdiction in the United
# States.

survey <- survey[c(-82),]
survey <- survey[c(-132),]
survey <- survey[c(-218),]
survey <- survey[c(-237),]
survey <- survey[c(-243),]
survey <- survey[c(-251),]
survey <- survey[c(-332),]
survey <- survey[c(-332),]
survey <- survey[c(-405),]
survey <- survey[c(-425),]
survey <- survey[c(-460),]
survey <- survey[c(-475),]
survey <- survey[c(-475),]
survey <- survey[c(-486),]
survey <- survey[c(-753),]
survey <- survey[c(-757),]
survey <- survey[c(-775),]
survey <- survey[c(-843),]
survey <- survey[c(-851),]
survey <- survey[c(-872),]
survey <- survey[c(-1034),]
survey <- survey[c(-1080),]
survey <- survey[c(-1091),]
survey <- survey[c(-1102),]
survey <- survey[c(-1107),]
survey <- survey[c(-1136),]
survey <- survey[c(-1155),]
survey <- survey[c(-1194),]
survey <- survey[c(-1252),]
survey <- survey[c(-1334),]
survey <- survey[c(-1431),]
survey <- survey[c(-1452),]
survey <- survey[c(-1462),]
survey <- survey[c(-1572),]
survey <- survey[c(-1607),]
survey <- survey[c(-1647),]
survey <- survey[c(-1800),]
survey <- survey[c(-1832),]
survey <- survey[c(-1907),]
survey <- survey[c(-1939),]
survey <- survey[c(-1956),]
survey <- survey[c(-1984),]
survey <- survey[c(-1995),]
survey <- survey[c(-2077),]
survey <- survey[c(-2096),]
survey <- survey[c(-2155),]
survey <- survey[c(-2176),]
survey <- survey[c(-2198),]
survey <- survey[c(-2299),]
survey <- survey[c(-2310),]
survey <- survey[c(-2312),]
survey <- survey[c(-2313),]
survey <- survey[c(-2317),]
survey <- survey[c(-2318),]
survey <- survey[c(-2318),]
survey <- survey[c(-2318),]
survey <- survey[c(-2319),]
survey <- survey[c(-2323),]
survey <- survey[c(-2323),]
survey <- survey[c(-2323),]
survey <- survey[c(-2323),]
survey <- survey[c(-2323),]
survey <- survey[c(-2324),]
survey <- survey[c(-2324),]
survey <- survey[c(-2324),]
survey <- survey[c(-2325),]
survey <- survey[c(-2326),]
survey <- survey[c(-2331),]
survey <- survey[c(-2331),]
survey <- survey[c(-2332),]
survey <- survey[c(-2332),]
survey <- survey[c(-2332),]
survey <- survey[c(-2336),]
survey <- survey[c(-2338),]
survey <- survey[c(-2338),]
survey <- survey[c(-2339),]
survey <- survey[c(-2342),]
survey <- survey[c(-2346),]
survey <- survey[c(-2347),]
survey <- survey[c(-2348),]
survey <- survey[c(-2355),]
survey <- survey[c(-2355),]
survey <- survey[c(-2358),]
survey <- survey[c(-2359),]
survey <- survey[c(-2364),]
survey <- survey[c(-2365),]
survey <- survey[c(-2367),]
survey <- survey[c(-2372),]
survey <- survey[c(-2373),]
survey <- survey[c(-2378),]
survey <- survey[c(-2382),]
survey <- survey[c(-2386),]
survey <- survey[c(-2386),]
survey <- survey[c(-2401),]
survey <- survey[c(-2406),]
survey <- survey[c(-2417),]
survey <- survey[c(-2423),]
survey <- survey[c(-2423),]
survey <- survey[c(-2423),]
survey <- survey[c(-2425),]
survey <- survey[c(-2431),]
survey <- survey[c(-2434),]
survey <- survey[c(-2448),]
survey <- survey[c(-2449),]
survey <- survey[c(-2450),]
survey <- survey[c(-2451),]
survey <- survey[c(-2451),]
survey <- survey[c(-2452),]
survey <- survey[c(-2456),]
survey <- survey[c(-2456),]
survey <- survey[c(-2457),]
survey <- survey[c(-2461),]
survey <- survey[c(-2471),]
survey <- survey[c(-2481),]
survey <- survey[c(-2492),]
survey <- survey[c(-2492),]
survey <- survey[c(-2493),]
survey <- survey[c(-2498),]
survey <- survey[c(-2507),]
survey <- survey[c(-2507),]
survey <- survey[c(-2510),]
survey <- survey[c(-2520),]
survey <- survey[c(-2521),]
survey <- survey[c(-115),]
survey <- survey[c(-167),]
survey <- survey[c(-169),]
survey <- survey[c(-216),]
survey <- survey[c(-216),]
survey <- survey[c(-246),]

# Build ourselves a couple new data frames to splice the 
# data into the dummy data set.

zip_20 <- data.frame(survey[,20])
zip_21 <- data.frame(survey[,21])
zip_20$lat <- NA
zip_20$lon <- NA
zip_21$lat <- NA
zip_21$lon <- NA

# Create coord pairs for each ZIP in both the 2020 and 2021 sets
# Again, this works by referencing a big internal table in the
# zipcodeR package that has a centroid lat/long for each ZIP code,
# so we're just joining that data to our ZIP code lists.

#for (i in seq(1, nrow(zip_20), 1)) { 
#  zip_20[i,] <- geocode_zip(zip_20$survey...20.[i]) 
#}

for (i in seq(1, nrow(zip_21), 1)) { 
  zip_21[i,] <- geocode_zip(zip_21$survey...21.[i]) 
}

# Now we splice the data back into the dummy dataset.

#survey <- cbind(survey[,1:19],zip_20,zip_21,survey[,22:ncol(survey)])
                
# Write to CSV.


