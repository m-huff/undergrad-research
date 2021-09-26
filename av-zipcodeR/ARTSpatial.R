### ZIPCODE CENTROID LAT/LONG APPENDING SCRIPT ###
### FOR IMPORTING TEXT ZIP CODES INTO QGIS ###
### MICHAEL HUFF ###

### This script pulls ZIP code lines from a predetermined CSV file and 
### appends the ZIP code's centroid latitude and longitude to two columns
### immediately after the ZIP code. This allows us to import the ZIP
### code data spatially into QGIS and run 'Count Points in Polygon'
### directly from the raw data to get counts of respondents per ZIP code,
### state, and urban/rural area.

### This package, zipcodeR, does not include zip code data for Hawaii and
### Alaska, and seems to be missing a couple others, which can be filled in
### using the FreeMapTools in-browser tool, "Convert USA ZIP Code to 
### Latitude / Longitude", located at the link below:

### https://www.freemaptools.com/convert-us-zip-code-to-lat-lng.htm

library(zipcodeR)
survey <- read.csv("C:/Users/micha/Desktop/art-dummy.csv")

# Records in the survey that must be deleted because they
# are either ZIP codes from outside the United States or
# are not valid ZIP codes.

# The reason this is so ugly is because the syntax being
# incorrect is not the only reason a ZIP code can be invalid,
# and we need to eliminate these records based on whether or
# not zipcodeR failed at that specific index, hence the list
# of magic numbers below.

# Reasons for removal include:
# 1) Invalid ZIP Code (zipcodeR does not recognize it as existing
#    within the United States despite it being a 5-digit integer)
# 2) Blank (user did not input their ZIP code)
# 3) Wrongly input data (user typed in something that was not
#    a ZIP code or had major issues that could not be corrected)

# This process omits 174 records from the survey data.

itr_rmv_list <- c(82,132,218,237,243,251,332,332,405,425,460,475,475,486,753,757,775,843,851,872,1034,
                  1080,1091,1102,1107,1136,1155,1194,1252,1334,1431,1452,1462,1572,1607,1647,1800,1832,
                  1907,1939,1956,1984,1995,2077,2096,2155,2176,2198,2299,2310,2312,2313,2317,2318,2318,
                  2318,2319,2323,2323,2323,2323,2323,2324,2324,2324,2325,2326,2331,2331,2332,2332,2332,
                  2336,2338,2338,2339,2342,2346,2347,2348,2355,2355,2358,2359,2364,2365,2367,2372,2373,
                  2378,2382,2386,2386,2401,2406,2417,2423,2423,2423,2425,2431,2434,2448,2449,2450,2451,
                  2451,2452,2456,2456,2457,2461,2471,2481,2492,2492,2493,2498,2507,2507,2510,2520,2521,
                  115,167,169,216,216,246,248,300,307,326,331,350,381,397,411,438,438,450,469,517,604,
                  697,846,919,942,997,1009,1113,1114,1118,1298,1376,1402,1624,1634,1680,1769,1818,1834,
                  1839,1845,1912,1951,1952,2000,2061,2261,2416,2437,2439,471,1792,2158)

bad_zips <- survey[0,]
 
for (record in itr_rmv_list) { 
  bad_zips <- rbind(bad_zips,data.frame(survey[record,]))
  survey <- survey[-record,] 
}

# Build ourselves a couple new data frames to splice the 
# data into the dummy data set, with a column for the ZIP
# code and two columns for the lat/long of the ZIP code's
# centroid point.

zip_20 <- data.frame(survey[,20])
zip_21 <- data.frame(survey[,21])
zip_20$centr_lat_20 <- NA
zip_20$centr_lon_20 <- NA
zip_21$centr_lat_21 <- NA
zip_21$centr_lon_21 <- NA

empty_col <- data.frame(empty=NA)
empty_col[nrow(bad_zips),] <- NA

# Create coord pairs for each ZIP in both the 2020 and 2021 sets
# Again, this works by referencing a big internal table in the
# zipcodeR package that has a centroid lat/long for each ZIP code,
# so we're just joining that data to our ZIP code lists for GIS use.

for (i in seq(1, nrow(zip_20), 1)) { zip_20[i,] <- geocode_zip(str_pad(zip_20$survey...20.[i], 5, side = "left", pad = "0")) }
for (i in seq(1, nrow(zip_21), 1)) { zip_21[i,] <- geocode_zip(str_pad(zip_21$survey...21.[i], 5, side = "left", pad = "0")) }

# Now we splice the data back into the dummy data set, including the records
# that have bad ZIP codes - we just leave the coordinates as NAs.

bad_zips <- cbind(bad_zips[,1:20],empty_col,empty_col,bad_zips[,21],empty_col,empty_col,bad_zips[,22:ncol(survey)])
survey <- cbind(survey[,1:19],zip_20,zip_21,survey[,22:ncol(survey)])

names(bad_zips) <- names(survey)
survey <- rbind(survey,bad_zips)

#for (row in seq(1,nrow(bad_zips),1)) { survey[nrow(survey) + 1] = bad_zips[row,] }
                
# Write to CSV.

write.csv(survey, "C:/Users/micha/Desktop/dummy-centroids.csv")

# Remove unneeded variables from data environment.

rm("zip_20","zip_21","i","itr_rmv_list","bad_zips","empty_col","record","row")

### END OF SCRIPT ###