# Load libraries
packages <- c("data.table","tidyverse","tidycensus","tigris")
lapply(packages, require, character.only=TRUE); rm(packages)

# Set ACS API key and review variables
census_api_key("c56d5e0f0945fe0e6b0f681269a98a91bf815eeb", install=TRUE)
vars <- load_variables(2019, "acs5", cache=TRUE)

# BROADBAND INTERNET ACCESS COUNT
data <- get_acs(geography="tract", state="AZ", variables=c("DP02_0153E"), year=2019)[,c(1,4)]

# PEOPLE UNDER POVERTY LEVEL IN PAST 12 MONTHS
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("B17001_002"), year=2019)[,4])

# FOREIGN-BORN POPULATION COUNT
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("DP02_0093E"), year=2019)[,4])

# EMPLOYMENT STATUS AGE 16+ COUNT
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("B23025_005"), year=2019)[,4])

# HOUSEHOLDS
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("B11001_001"), year=2019)[,4])

data <- data.frame(data); colnames(data) <- c("GEOID","INTERNET","POVERTY","FOREIGN","UNEMP","HH_COUNT")

write.csv(data, "C:/Users/micha/Desktop/nov21-equity-vars.csv")


### NEW SCRIPT ###

# RACE, Native Hawaiian or Other Pacific Islander
data <- get_acs(geography="tract", state="AZ", variables=c("B02001_006"), year=2019)[,c(1,4)]

# RACE, American Indian or Alaska Native
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("B02001_004"), year=2019)[,4])

data <- data.frame(data); colnames(data) <- c("GEOID","RAC_NPHI","RAC_AIAN")

write.csv(data, "C:/Users/micha/Desktop/nov21-rac-ex.csv")