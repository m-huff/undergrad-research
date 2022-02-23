### ACS DATA MANIPULATOR ###
### MICHAEL HUFF ###

# Load libraries
packages <- c("data.table","tidyverse","tidycensus","tigris","janitor")
lapply(packages, require, character.only=TRUE); rm(packages)

# Set ACS API key and review variables
census_api_key("c56d5e0f0945fe0e6b0f681269a98a91bf815eeb", install=TRUE, overwrite=TRUE); readRenviron("~/.Renviron")
vars <- load_variables(2019, "acs5", cache=TRUE)

# IN LABOR FORCE
employed <- get_acs(geography="zcta", variables=c("B27011_002"), year=2019)[,c(1,4)]; colnames(employed) <- c("zcta","employed")

# UNEMPLOYED
unemployed <- get_acs(geography="zcta", variables=c("B27011_008"), year=2019)[,c(1,4)]; colnames(unemployed) <- c("zcta","unemployed")

# RETIRED
retired <- get_acs(geography="zcta", variables=c("B19059_001"), year=2019)[,c(1,4)]; colnames(retired) <- c("zcta","retired")

# TOTAL POP
total_pop <- get_acs(geography="zcta", variables=c("B01001_001"), year=2019)[,c(1,4)]; colnames(total_pop) <- c("zcta","total_pop")

data <- cbind(total_pop,employed,unemployed,retired,hh_1,hh_2,hh_3,hh_4)[,-c(3,5,7,9,11,13,15)]
rm("employed","unemployed","total_pop","vars","retired")

data <- data %>% adorn_totals(data, where = "row", name = c("total_pop","employed","unemployed","retired"))
totals <- data[33121,]

var_employ <- round(totals$employed[1] / totals$total_pop[1], 2)
var_unempl <- round(totals$unemployed[1] / totals$total_pop[1], 2)
var_retire <- round(totals$retired[1] / totals$total_pop[1], 2)
