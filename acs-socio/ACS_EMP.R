
# Load libraries
packages <- c("data.table","tidyverse","tidycensus","tigris")
lapply(packages, require, character.only=TRUE); rm(packages)

# Set ACS API key and review variables
census_api_key("c56d5e0f0945fe0e6b0f681269a98a91bf815eeb", install=TRUE)
vars <- load_variables(2019, "acs5", cache=TRUE)

# EMPLOYMENT STATUS FOR THE POPULATION 16 YEARS+
pop_tot <- get_acs(geography="tract", state="AZ", variables=c("B23025_001"), year=2019); colnames(pop_tot) <- c("GEOID","NAME","VAR","pop_tot","pop_tot_m")  

write.csv(pop_tot, "C:/Users/micha/Desktop/tract_employment.csv")