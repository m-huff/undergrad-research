# Load libraries
packages <- c("data.table","tidyverse","tidycensus","tigris")
lapply(packages, require, character.only=TRUE); rm(packages)

# Set ACS API key and review variables
census_api_key("c56d5e0f0945fe0e6b0f681269a98a91bf815eeb", install=TRUE)
vars <- load_variables(2019, "acs5", cache=TRUE)

# BROADBAND INTERNET ACCESS COUNT
data <- get_acs(geography="tract", state="AZ", variables=c("DP02_0153E"), year=2019)

# PEOPLE UNDER POVERTY LEVEL IN PAST 12 MONTHS
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("B17001_002"), year=2019)) 

# FOREIGN-BORN POPULATION COUNT
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("DP02_0093E"), year=2019)) 

# EMPLOYMENT STATUS AGE 16+ COUNT
data <- c(data, get_acs(geography="tract", state="AZ", variables=c("B23025_005"), year=2019))


write.csv(data, "C:/Users/micha/Desktop/equity_vars.csv")
