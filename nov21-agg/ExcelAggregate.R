### AGGREGATE DATA, MERGE AND SUM DUPLICATE COLUMNS ###
### MICHAEL HUFF ###

sheet <- read.csv("C:/Users/micha/Desktop/BikeCrash/LEHD LODES/az_rac_S000_JT00_2019.csv")
rac_tract <- aggregate(. ~ GEOID, transform(sheet, x = GEOID), sum)[,1:4]

write.csv(rac_tract, "C:/Users/micha/Desktop/BikeCrash/LEHD LODES/rac_tract_2019.csv")

rm(list = ls())
