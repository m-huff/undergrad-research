####################
# Steven Gehrke
# Uber Movement Study
# Task: ACS Data
# 05.29.2019
####################

# Load libraries
packages <- c("data.table","tidyverse","tidycensus","tigris")
lapply(packages, require, character.only=TRUE); rm(packages)
# Note some of above packages are not supported in ANACONDA

# Set ACS API key and review variables
census_api_key("c56d5e0f0945fe0e6b0f681269a98a91bf815eeb", install=TRUE)
vars <- load_variables(2017, "acs5", cache=TRUE)

####################

### BOSTON

# Load uber movement file
bos_dir <- "~/Desktop/uber_movement/study_1/data/tabular/boston/"
bos_dat <- read_csv(paste(bos_dir, "bos_uber_01_summarized.csv", sep="_processed/"))
bos_dat[1] <- NULL

### Socioeconomic Data, ACS 2013-2017

# TOTAL POPULATION
pop_tot <- get_acs(geography="tract", state="MA", variables=c("B01001_001"), year=2017); colnames(pop_tot) <- c("GEOID","NAME","VAR","pop_tot","pop_tot_m")  
# SEX BY AGE: MALE
sxm_age_xx_xx <- get_acs(geography="tract", state="MA", variables=c("B01001_002"), year=2017); colnames(sxm_age_xx_xx) <- c("GEOID","NAME","VAR","sxm_age_xx_xx","sxm_age_xx_xx_m")
sxm_age_xx_04 <- get_acs(geography="tract", state="MA", variables=c("B01001_003"), year=2017); colnames(sxm_age_xx_04) <- c("GEOID","NAME","VAR","sxm_age_xx_04","sxm_age_xx_04_m")
sxm_age_05_09 <- get_acs(geography="tract", state="MA", variables=c("B01001_004"), year=2017); colnames(sxm_age_05_09) <- c("GEOID","NAME","VAR","sxm_age_05_09","sxm_age_05_09_m")
sxm_age_10_14 <- get_acs(geography="tract", state="MA", variables=c("B01001_005"), year=2017); colnames(sxm_age_10_14) <- c("GEOID","NAME","VAR","sxm_age_10_14","sxm_age_10_14_m")
sxm_age_15_17 <- get_acs(geography="tract", state="MA", variables=c("B01001_006"), year=2017); colnames(sxm_age_15_17) <- c("GEOID","NAME","VAR","sxm_age_15_17","sxm_age_15_17_m")
sxm_age_18_19 <- get_acs(geography="tract", state="MA", variables=c("B01001_007"), year=2017); colnames(sxm_age_18_19) <- c("GEOID","NAME","VAR","sxm_age_18_19","sxm_age_18_19_m")
sxm_age_20_20 <- get_acs(geography="tract", state="MA", variables=c("B01001_008"), year=2017); colnames(sxm_age_20_20) <- c("GEOID","NAME","VAR","sxm_age_20_20","sxm_age_20_20_m")
sxm_age_21_21 <- get_acs(geography="tract", state="MA", variables=c("B01001_009"), year=2017); colnames(sxm_age_21_21) <- c("GEOID","NAME","VAR","sxm_age_21_21","sxm_age_21_21_m")
sxm_age_22_24 <- get_acs(geography="tract", state="MA", variables=c("B01001_010"), year=2017); colnames(sxm_age_22_24) <- c("GEOID","NAME","VAR","sxm_age_22_24","sxm_age_22_24_m")
sxm_age_25_29 <- get_acs(geography="tract", state="MA", variables=c("B01001_011"), year=2017); colnames(sxm_age_25_29) <- c("GEOID","NAME","VAR","sxm_age_25_29","sxm_age_25_29_m")
sxm_age_30_34 <- get_acs(geography="tract", state="MA", variables=c("B01001_012"), year=2017); colnames(sxm_age_30_34) <- c("GEOID","NAME","VAR","sxm_age_30_34","sxm_age_30_34_m")
sxm_age_35_39 <- get_acs(geography="tract", state="MA", variables=c("B01001_013"), year=2017); colnames(sxm_age_35_39) <- c("GEOID","NAME","VAR","sxm_age_35_39","sxm_age_35_39_m")
sxm_age_40_44 <- get_acs(geography="tract", state="MA", variables=c("B01001_014"), year=2017); colnames(sxm_age_40_44) <- c("GEOID","NAME","VAR","sxm_age_40_44","sxm_age_40_44_m")
sxm_age_45_49 <- get_acs(geography="tract", state="MA", variables=c("B01001_015"), year=2017); colnames(sxm_age_45_49) <- c("GEOID","NAME","VAR","sxm_age_45_49","sxm_age_45_49_m")
sxm_age_50_54 <- get_acs(geography="tract", state="MA", variables=c("B01001_016"), year=2017); colnames(sxm_age_50_54) <- c("GEOID","NAME","VAR","sxm_age_50_54","sxm_age_50_54_m")
sxm_age_55_59 <- get_acs(geography="tract", state="MA", variables=c("B01001_017"), year=2017); colnames(sxm_age_55_59) <- c("GEOID","NAME","VAR","sxm_age_55_59","sxm_age_55_59_m")
sxm_age_60_61 <- get_acs(geography="tract", state="MA", variables=c("B01001_018"), year=2017); colnames(sxm_age_60_61) <- c("GEOID","NAME","VAR","sxm_age_60_61","sxm_age_60_61_m")
sxm_age_62_64 <- get_acs(geography="tract", state="MA", variables=c("B01001_019"), year=2017); colnames(sxm_age_62_64) <- c("GEOID","NAME","VAR","sxm_age_62_64","sxm_age_62_64_m")
sxm_age_65_66 <- get_acs(geography="tract", state="MA", variables=c("B01001_020"), year=2017); colnames(sxm_age_65_66) <- c("GEOID","NAME","VAR","sxm_age_65_66","sxm_age_65_66_m")
sxm_age_67_69 <- get_acs(geography="tract", state="MA", variables=c("B01001_021"), year=2017); colnames(sxm_age_67_69) <- c("GEOID","NAME","VAR","sxm_age_67_69","sxm_age_67_69_m")
sxm_age_70_74 <- get_acs(geography="tract", state="MA", variables=c("B01001_022"), year=2017); colnames(sxm_age_70_74) <- c("GEOID","NAME","VAR","sxm_age_70_74","sxm_age_70_74_m")
sxm_age_75_79 <- get_acs(geography="tract", state="MA", variables=c("B01001_023"), year=2017); colnames(sxm_age_75_79) <- c("GEOID","NAME","VAR","sxm_age_75_79","sxm_age_75_79_m")
sxm_age_80_84 <- get_acs(geography="tract", state="MA", variables=c("B01001_024"), year=2017); colnames(sxm_age_80_84) <- c("GEOID","NAME","VAR","sxm_age_80_84","sxm_age_80_84_m")
sxm_age_85_xx <- get_acs(geography="tract", state="MA", variables=c("B01001_025"), year=2017); colnames(sxm_age_85_xx) <- c("GEOID","NAME","VAR","sxm_age_85_xx","sxm_age_85_xx_m")
# SEX BY AGE: FEMALE
sxf_age_xx_xx <- get_acs(geography="tract", state="MA", variables=c("B01001_026"), year=2017); colnames(sxf_age_xx_xx) <- c("GEOID","NAME","VAR","sxf_age_xx_xx","sxf_age_xx_xx_m")
sxf_age_xx_04 <- get_acs(geography="tract", state="MA", variables=c("B01001_027"), year=2017); colnames(sxf_age_xx_04) <- c("GEOID","NAME","VAR","sxf_age_xx_04","sxf_age_xx_04_m")
sxf_age_05_09 <- get_acs(geography="tract", state="MA", variables=c("B01001_028"), year=2017); colnames(sxf_age_05_09) <- c("GEOID","NAME","VAR","sxf_age_05_09","sxf_age_05_09_m")
sxf_age_10_14 <- get_acs(geography="tract", state="MA", variables=c("B01001_029"), year=2017); colnames(sxf_age_10_14) <- c("GEOID","NAME","VAR","sxf_age_10_14","sxf_age_10_14_m")
sxf_age_15_17 <- get_acs(geography="tract", state="MA", variables=c("B01001_030"), year=2017); colnames(sxf_age_15_17) <- c("GEOID","NAME","VAR","sxf_age_15_17","sxf_age_15_17_m")
sxf_age_18_19 <- get_acs(geography="tract", state="MA", variables=c("B01001_031"), year=2017); colnames(sxf_age_18_19) <- c("GEOID","NAME","VAR","sxf_age_18_19","sxf_age_18_19_m")
sxf_age_20_20 <- get_acs(geography="tract", state="MA", variables=c("B01001_032"), year=2017); colnames(sxf_age_20_20) <- c("GEOID","NAME","VAR","sxf_age_20_20","sxf_age_20_20_m")
sxf_age_21_21 <- get_acs(geography="tract", state="MA", variables=c("B01001_033"), year=2017); colnames(sxf_age_21_21) <- c("GEOID","NAME","VAR","sxf_age_21_21","sxf_age_21_21_m")
sxf_age_22_24 <- get_acs(geography="tract", state="MA", variables=c("B01001_034"), year=2017); colnames(sxf_age_22_24) <- c("GEOID","NAME","VAR","sxf_age_22_24","sxf_age_22_24_m")
sxf_age_25_29 <- get_acs(geography="tract", state="MA", variables=c("B01001_035"), year=2017); colnames(sxf_age_25_29) <- c("GEOID","NAME","VAR","sxf_age_25_29","sxf_age_25_29_m")
sxf_age_30_34 <- get_acs(geography="tract", state="MA", variables=c("B01001_036"), year=2017); colnames(sxf_age_30_34) <- c("GEOID","NAME","VAR","sxf_age_30_34","sxf_age_30_34_m")
sxf_age_35_39 <- get_acs(geography="tract", state="MA", variables=c("B01001_037"), year=2017); colnames(sxf_age_35_39) <- c("GEOID","NAME","VAR","sxf_age_35_39","sxf_age_35_39_m")
sxf_age_40_44 <- get_acs(geography="tract", state="MA", variables=c("B01001_038"), year=2017); colnames(sxf_age_40_44) <- c("GEOID","NAME","VAR","sxf_age_40_44","sxf_age_40_44_m")
sxf_age_45_49 <- get_acs(geography="tract", state="MA", variables=c("B01001_039"), year=2017); colnames(sxf_age_45_49) <- c("GEOID","NAME","VAR","sxf_age_45_49","sxf_age_45_49_m")
sxf_age_50_54 <- get_acs(geography="tract", state="MA", variables=c("B01001_040"), year=2017); colnames(sxf_age_50_54) <- c("GEOID","NAME","VAR","sxf_age_50_54","sxf_age_50_54_m")
sxf_age_55_59 <- get_acs(geography="tract", state="MA", variables=c("B01001_041"), year=2017); colnames(sxf_age_55_59) <- c("GEOID","NAME","VAR","sxf_age_55_59","sxf_age_55_59_m")
sxf_age_60_61 <- get_acs(geography="tract", state="MA", variables=c("B01001_042"), year=2017); colnames(sxf_age_60_61) <- c("GEOID","NAME","VAR","sxf_age_60_61","sxf_age_60_61_m")
sxf_age_62_64 <- get_acs(geography="tract", state="MA", variables=c("B01001_043"), year=2017); colnames(sxf_age_62_64) <- c("GEOID","NAME","VAR","sxf_age_62_64","sxf_age_62_64_m")
sxf_age_65_66 <- get_acs(geography="tract", state="MA", variables=c("B01001_044"), year=2017); colnames(sxf_age_65_66) <- c("GEOID","NAME","VAR","sxf_age_65_66","sxf_age_65_66_m")
sxf_age_67_69 <- get_acs(geography="tract", state="MA", variables=c("B01001_045"), year=2017); colnames(sxf_age_67_69) <- c("GEOID","NAME","VAR","sxf_age_67_69","sxf_age_67_69_m")
sxf_age_70_74 <- get_acs(geography="tract", state="MA", variables=c("B01001_046"), year=2017); colnames(sxf_age_70_74) <- c("GEOID","NAME","VAR","sxf_age_70_74","sxf_age_70_74_m")
sxf_age_75_79 <- get_acs(geography="tract", state="MA", variables=c("B01001_047"), year=2017); colnames(sxf_age_75_79) <- c("GEOID","NAME","VAR","sxf_age_75_79","sxf_age_75_79_m")
sxf_age_80_84 <- get_acs(geography="tract", state="MA", variables=c("B01001_048"), year=2017); colnames(sxf_age_80_84) <- c("GEOID","NAME","VAR","sxf_age_80_84","sxf_age_80_84_m")
sxf_age_85_xx <- get_acs(geography="tract", state="MA", variables=c("B01001_049"), year=2017); colnames(sxf_age_85_xx) <- c("GEOID","NAME","VAR","sxf_age_85_xx","sxf_age_85_xx_m")
# MEDIAN AGE
age_med <- get_acs(geography="tract", state="MA", variables=c("B01002_001E"), year=2017); colnames(age_med) <- c("GEOID","NAME","VAR","age_med","age_med_m")
# PLACE OF BIRTH BY EDUCATIONAL ATTAINMENT IN THE UNITED STATES
edu_tot_xxx <- get_acs(geography="tract", state="MA", variables=c("B06009_001"), year=2017); colnames(edu_tot_xxx) <- c("GEOID","NAME","VAR","edu_tot_xxx","edu_tot_xxx_m")
edu_tot_lhs <- get_acs(geography="tract", state="MA", variables=c("B06009_002"), year=2017); colnames(edu_tot_lhs) <- c("GEOID","NAME","VAR","edu_tot_lhs","edu_tot_lhs_m")
edu_tot_hse <- get_acs(geography="tract", state="MA", variables=c("B06009_003"), year=2017); colnames(edu_tot_hse) <- c("GEOID","NAME","VAR","edu_tot_hse","edu_tot_hse_m")
edu_tot_som <- get_acs(geography="tract", state="MA", variables=c("B06009_004"), year=2017); colnames(edu_tot_som) <- c("GEOID","NAME","VAR","edu_tot_som","edu_tot_som_m")
edu_tot_bac <- get_acs(geography="tract", state="MA", variables=c("B06009_005"), year=2017); colnames(edu_tot_bac) <- c("GEOID","NAME","VAR","edu_tot_bac","edu_tot_bac_m")
edu_tot_grd <- get_acs(geography="tract", state="MA", variables=c("B06009_006"), year=2017); colnames(edu_tot_grd) <- c("GEOID","NAME","VAR","edu_tot_grd","edu_tot_grd_m")
# RACE
rac_tot_xxx <- get_acs(geography="tract", state="MA", variables=c("B02001_001"), year=2017); colnames(rac_tot_xxx) <- c("GEOID","NAME","VAR","rac_tot_xxx","rac_tot_xxx_m")
rac_tot_whi <- get_acs(geography="tract", state="MA", variables=c("B02001_002"), year=2017); colnames(rac_tot_whi) <- c("GEOID","NAME","VAR","rac_tot_whi","rac_tot_whi_m")
rac_tot_baa <- get_acs(geography="tract", state="MA", variables=c("B02001_003"), year=2017); colnames(rac_tot_baa) <- c("GEOID","NAME","VAR","rac_tot_baa","rac_tot_baa_m")
rac_tot_aia <- get_acs(geography="tract", state="MA", variables=c("B02001_004"), year=2017); colnames(rac_tot_aia) <- c("GEOID","NAME","VAR","rac_tot_aia","rac_tot_aia_m")
rac_tot_asn <- get_acs(geography="tract", state="MA", variables=c("B02001_005"), year=2017); colnames(rac_tot_asn) <- c("GEOID","NAME","VAR","rac_tot_asn","rac_tot_asn_m")
rac_tot_npi <- get_acs(geography="tract", state="MA", variables=c("B02001_006"), year=2017); colnames(rac_tot_npi) <- c("GEOID","NAME","VAR","rac_tot_npi","rac_tot_npi_m")
rac_tot_oth <- get_acs(geography="tract", state="MA", variables=c("B02001_007"), year=2017); colnames(rac_tot_oth) <- c("GEOID","NAME","VAR","rac_tot_oth","rac_tot_oth_m")
rac_tot_two <- get_acs(geography="tract", state="MA", variables=c("B02001_008"), year=2017); colnames(rac_tot_two) <- c("GEOID","NAME","VAR","rac_tot_two","rac_tot_two_m")
# HISPANIC OR LATINO ORIGIN BY RACE
lat_tot_xxx <- get_acs(geography="tract", state="MA", variables=c("B03002_012"), year=2017); colnames(lat_tot_xxx) <- c("GEOID","NAME","VAR","lat_tot_xxx","lat_tot_xxx_m")
lat_tot_whi <- get_acs(geography="tract", state="MA", variables=c("B03002_013"), year=2017); colnames(lat_tot_whi) <- c("GEOID","NAME","VAR","lat_tot_whi","lat_tot_whi_m")
lat_tot_baa <- get_acs(geography="tract", state="MA", variables=c("B03002_014"), year=2017); colnames(lat_tot_baa) <- c("GEOID","NAME","VAR","lat_tot_baa","lat_tot_baa_m")
lat_tot_aia <- get_acs(geography="tract", state="MA", variables=c("B03002_015"), year=2017); colnames(lat_tot_aia) <- c("GEOID","NAME","VAR","lat_tot_aia","lat_tot_aia_m")
lat_tot_asn <- get_acs(geography="tract", state="MA", variables=c("B03002_016"), year=2017); colnames(lat_tot_asn) <- c("GEOID","NAME","VAR","lat_tot_asn","lat_tot_asn_m")
lat_tot_npi <- get_acs(geography="tract", state="MA", variables=c("B03002_017"), year=2017); colnames(lat_tot_npi) <- c("GEOID","NAME","VAR","lat_tot_npi","lat_tot_npi_m")
lat_tot_oth <- get_acs(geography="tract", state="MA", variables=c("B03002_018"), year=2017); colnames(lat_tot_oth) <- c("GEOID","NAME","VAR","lat_tot_oth","lat_tot_oth_m")
lat_tot_two <- get_acs(geography="tract", state="MA", variables=c("B03002_019"), year=2017); colnames(lat_tot_two) <- c("GEOID","NAME","VAR","lat_tot_two","lat_tot_two_m")
# HOUSEHOLD SIZE BY VEHICLES AVAILABLE
veh_xx <- get_acs(geography="tract", state="MA", variables=c("B08014_001"), year=2017); colnames(veh_xx) <- c("GEOID","NAME","VAR","veh_xx","veh_xx_m")
veh_00 <- get_acs(geography="tract", state="MA", variables=c("B08014_002"), year=2017); colnames(veh_00) <- c("GEOID","NAME","VAR","veh_00","veh_00_m")
veh_01 <- get_acs(geography="tract", state="MA", variables=c("B08014_003"), year=2017); colnames(veh_01) <- c("GEOID","NAME","VAR","veh_01","veh_01_m")
veh_02 <- get_acs(geography="tract", state="MA", variables=c("B08014_004"), year=2017); colnames(veh_02) <- c("GEOID","NAME","VAR","veh_02","veh_02_m")
veh_03 <- get_acs(geography="tract", state="MA", variables=c("B08014_005"), year=2017); colnames(veh_03) <- c("GEOID","NAME","VAR","veh_03","veh_03_m")
veh_04 <- get_acs(geography="tract", state="MA", variables=c("B08014_006"), year=2017); colnames(veh_04) <- c("GEOID","NAME","VAR","veh_04","veh_04_m")
veh_05 <- get_acs(geography="tract", state="MA", variables=c("B08014_007"), year=2017); colnames(veh_05) <- c("GEOID","NAME","VAR","veh_05","veh_05_m")
# HOUSEHOLD INCOME IN THE PAST 12 MONTHS
inc_xxx_xxx <- get_acs(geography="tract", state="MA", variables=c("B19001_001"), year=2017); colnames(inc_xxx_xxx) <- c("GEOID","NAME","VAR","inc_xxx_xxx","inc_xxx_xxx_m")
inc_000_010 <- get_acs(geography="tract", state="MA", variables=c("B19001_002"), year=2017); colnames(inc_000_010) <- c("GEOID","NAME","VAR","inc_000_010","inc_000_010_m")
inc_010_015 <- get_acs(geography="tract", state="MA", variables=c("B19001_003"), year=2017); colnames(inc_010_015) <- c("GEOID","NAME","VAR","inc_010_015","inc_010_015_m")
inc_015_020 <- get_acs(geography="tract", state="MA", variables=c("B19001_004"), year=2017); colnames(inc_015_020) <- c("GEOID","NAME","VAR","inc_015_020","inc_015_020_m")
inc_020_025 <- get_acs(geography="tract", state="MA", variables=c("B19001_005"), year=2017); colnames(inc_020_025) <- c("GEOID","NAME","VAR","inc_020_025","inc_020_025_m")
inc_025_030 <- get_acs(geography="tract", state="MA", variables=c("B19001_006"), year=2017); colnames(inc_025_030) <- c("GEOID","NAME","VAR","inc_025_030","inc_025_030_m")
inc_030_035 <- get_acs(geography="tract", state="MA", variables=c("B19001_007"), year=2017); colnames(inc_030_035) <- c("GEOID","NAME","VAR","inc_030_035","inc_030_035_m")
inc_035_040 <- get_acs(geography="tract", state="MA", variables=c("B19001_008"), year=2017); colnames(inc_035_040) <- c("GEOID","NAME","VAR","inc_035_040","inc_035_040_m")
inc_040_045 <- get_acs(geography="tract", state="MA", variables=c("B19001_009"), year=2017); colnames(inc_040_045) <- c("GEOID","NAME","VAR","inc_040_045","inc_040_045_m")
inc_045_050 <- get_acs(geography="tract", state="MA", variables=c("B19001_010"), year=2017); colnames(inc_045_050) <- c("GEOID","NAME","VAR","inc_045_050","inc_045_050_m")
inc_050_060 <- get_acs(geography="tract", state="MA", variables=c("B19001_011"), year=2017); colnames(inc_050_060) <- c("GEOID","NAME","VAR","inc_050_060","inc_050_060_m")
inc_060_075 <- get_acs(geography="tract", state="MA", variables=c("B19001_012"), year=2017); colnames(inc_060_075) <- c("GEOID","NAME","VAR","inc_060_075","inc_060_075_m")
inc_075_100 <- get_acs(geography="tract", state="MA", variables=c("B19001_013"), year=2017); colnames(inc_075_100) <- c("GEOID","NAME","VAR","inc_075_100","inc_075_100_m")
inc_100_125 <- get_acs(geography="tract", state="MA", variables=c("B19001_014"), year=2017); colnames(inc_100_125) <- c("GEOID","NAME","VAR","inc_100_125","inc_100_125_m")
inc_125_150 <- get_acs(geography="tract", state="MA", variables=c("B19001_015"), year=2017); colnames(inc_125_150) <- c("GEOID","NAME","VAR","inc_125_150","inc_125_150_m")
inc_150_200 <- get_acs(geography="tract", state="MA", variables=c("B19001_016"), year=2017); colnames(inc_150_200) <- c("GEOID","NAME","VAR","inc_150_200","inc_150_200_m")
inc_200_XXX <- get_acs(geography="tract", state="MA", variables=c("B19001_017"), year=2017); colnames(inc_200_XXX) <- c("GEOID","NAME","VAR","inc_200_xxx","inc_200_xxx_m")
# MEDIAN HOUSEHOLD INCOME
inc_med <- get_acs(geography="tract", state="MA", variables=c("B19013_001"), year=2017); colnames(inc_med) <- c("GEOID","NAME","VAR","inc_med","inc_med_m")
# TOTAL POPULATION IN OCCUPIED HOUSING UNITS BY TENURE
ten_xxx <- get_acs(geography="tract", state="MA", variables=c("B25002_001"), year=2017); colnames(ten_xxx) <- c("GEOID","NAME","VAR","ten_xxx","ten_xxx_m")
ten_occ <- get_acs(geography="tract", state="MA", variables=c("B25002_002"), year=2017); colnames(ten_occ) <- c("GEOID","NAME","VAR","ten_occ","ten_occ_m")
ten_vac <- get_acs(geography="tract", state="MA", variables=c("B25002_003"), year=2017); colnames(ten_vac) <- c("GEOID","NAME","VAR","ten_vac","ten_vac_m")
ten_own <- get_acs(geography="tract", state="MA", variables=c("B25003_002"), year=2017); colnames(ten_own) <- c("GEOID","NAME","VAR","ten_own","ten_own_m")
ten_rnt <- get_acs(geography="tract", state="MA", variables=c("B25003_003"), year=2017); colnames(ten_rnt) <- c("GEOID","NAME","VAR","ten_rnt","ten_rnt_m")
# AVERAGE HOUSEHOLD SIZE OF OCCUPIED HOUSING UNITS BY TENURE
sze_xxx <- get_acs(geography="tract", state="MA", variables=c("B25010_001"), year=2017); colnames(sze_xxx) <- c("GEOID","NAME","VAR","sze_xxx","sze_xxx_m")
sze_own <- get_acs(geography="tract", state="MA", variables=c("B25010_002"), year=2017); colnames(sze_own) <- c("GEOID","NAME","VAR","sze_own","sze_own_m")
sze_rnt <- get_acs(geography="tract", state="MA", variables=c("B25010_003"), year=2017); colnames(sze_rnt) <- c("GEOID","NAME","VAR","sze_rnt","sze_rnt_m")

### Socioeconomic Variable Categorizing

# POPULATION
pop <- pop_tot[,c(1:2,4)]
rm(pop_tot)
# AGE
age <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE),
              list(sxm_age_xx_xx,sxm_age_xx_04,sxm_age_05_09,sxm_age_10_14,sxm_age_15_17,sxm_age_18_19,sxm_age_20_20,sxm_age_21_21,sxm_age_22_24,sxm_age_25_29,
                   sxm_age_30_34,sxm_age_35_39,sxm_age_40_44,sxm_age_45_49,sxm_age_50_54,sxm_age_55_59,sxm_age_60_61,sxm_age_62_64,sxm_age_65_66,sxm_age_67_69,
                   sxm_age_70_74,sxm_age_75_79,sxm_age_80_84,sxm_age_85_xx,
                   sxf_age_xx_xx,sxf_age_xx_04,sxf_age_05_09,sxf_age_10_14,sxf_age_15_17,sxf_age_18_19,sxf_age_20_20,sxf_age_21_21,sxf_age_22_24,sxf_age_25_29,
                   sxf_age_30_34,sxf_age_35_39,sxf_age_40_44,sxf_age_45_49,sxf_age_50_54,sxf_age_55_59,sxf_age_60_61,sxf_age_62_64,sxf_age_65_66,sxf_age_67_69,
                   sxf_age_70_74,sxf_age_75_79,sxf_age_80_84,sxf_age_85_xx,age_med))
age <- age[,c(1,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,
              132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196)]
rm(sxm_age_xx_xx,sxm_age_xx_04,sxm_age_05_09,sxm_age_10_14,sxm_age_15_17,sxm_age_18_19,sxm_age_20_20,sxm_age_21_21,sxm_age_22_24,sxm_age_25_29,
   sxm_age_30_34,sxm_age_35_39,sxm_age_40_44,sxm_age_45_49,sxm_age_50_54,sxm_age_55_59,sxm_age_60_61,sxm_age_62_64,sxm_age_65_66,sxm_age_67_69,
   sxm_age_70_74,sxm_age_75_79,sxm_age_80_84,sxm_age_85_xx,
   sxf_age_xx_xx,sxf_age_xx_04,sxf_age_05_09,sxf_age_10_14,sxf_age_15_17,sxf_age_18_19,sxf_age_20_20,sxf_age_21_21,sxf_age_22_24,sxf_age_25_29,
   sxf_age_30_34,sxf_age_35_39,sxf_age_40_44,sxf_age_45_49,sxf_age_50_54,sxf_age_55_59,sxf_age_60_61,sxf_age_62_64,sxf_age_65_66,sxf_age_67_69,
   sxf_age_70_74,sxf_age_75_79,sxf_age_80_84,sxf_age_85_xx,age_med)
# EDUCATION
edu <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(edu_tot_xxx,edu_tot_lhs,edu_tot_hse,edu_tot_som,edu_tot_bac,edu_tot_grd))
edu <- edu[,c(1,4,8,12,16,20,24)]
rm(edu_tot_xxx,edu_tot_lhs,edu_tot_hse,edu_tot_som,edu_tot_bac,edu_tot_grd)
# RACE
rac <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(rac_tot_xxx,rac_tot_whi,rac_tot_baa,rac_tot_aia,rac_tot_asn,rac_tot_npi,rac_tot_oth,rac_tot_two))
rac <- rac[,c(1,4,8,12,16,20,24,28,32)]
rm(rac_tot_xxx,rac_tot_whi,rac_tot_baa,rac_tot_aia,rac_tot_asn,rac_tot_npi,rac_tot_oth,rac_tot_two)
# HISPANIC OR LATINO ORIGIN
lat <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(lat_tot_xxx,lat_tot_whi,lat_tot_baa,lat_tot_aia,lat_tot_asn,lat_tot_npi,lat_tot_oth,lat_tot_two))
lat <- lat[,c(1,4,8,12,16,20,24,28,32)]
rm(lat_tot_xxx,lat_tot_whi,lat_tot_baa,lat_tot_aia,lat_tot_asn,lat_tot_npi,lat_tot_oth,lat_tot_two)
# HOUSEHOLD VEHICLES
veh <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(veh_xx,veh_00,veh_01,veh_02,veh_03,veh_04,veh_05))
veh <- veh[,c(1,4,8,12,16,20,24,28)]
rm(veh_xx,veh_00,veh_01,veh_02,veh_03,veh_04,veh_05)
# HOUSEHOLD INCOME
inc <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE),
              list(inc_xxx_xxx,inc_000_010,inc_010_015,inc_015_020,inc_020_025,inc_025_030,inc_030_035,inc_035_040,inc_040_045,
                   inc_045_050,inc_050_060,inc_060_075,inc_075_100,inc_100_125,inc_125_150,inc_150_200,inc_200_XXX,inc_med))
inc <- inc[,c(1,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72)]
rm(inc_xxx_xxx,inc_000_010,inc_010_015,inc_015_020,inc_020_025,inc_025_030,inc_030_035,inc_035_040,inc_040_045,
   inc_045_050,inc_050_060,inc_060_075,inc_075_100,inc_100_125,inc_125_150,inc_150_200,inc_200_XXX,inc_med)
# TENURE
ten <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(ten_xxx,ten_occ,ten_vac,ten_own,ten_rnt))
ten <- ten[,c(1,4,8,12,16,20)]
rm(ten_xxx,ten_occ,ten_vac,ten_own,ten_rnt)
# HOUSEHOLD SIZE
sze <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(sze_xxx,sze_own,sze_rnt))
sze <- sze[,c(1,4,8,12)]
rm(sze_xxx,sze_own,sze_rnt)

# Merge data files
dat_ses <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(pop,age,edu,rac,lat,veh,inc,ten,sze))
colnames(dat_ses)[1] <- "tract"
rm(pop,age,edu,rac,lat,veh,inc,ten,sze,vars)

### Socioeconomic Variable Creation

# POPULATION
dat_ses$ct_pop_tot <- dat_ses$pop_tot
summary(dat_ses$ct_pop_tot)
# SEX DISTRIBUTION
dat_ses$ct_sex_m <- dat_ses$sxm_age_xx_xx
dat_ses$ct_sexp_m <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_xx_xx/dat_ses$pop_tot, 0)
summary(dat_ses$ct_sexp_m) # Sex: Male
dat_ses$ct_sex_f <- dat_ses$sxf_age_xx_xx
dat_ses$ct_sexp_f <- ifelse(dat_ses$pop_tot>0, dat_ses$sxf_age_xx_xx/dat_ses$pop_tot, 0)
summary(dat_ses$ct_sexp_f) # Sex: Female
# AGE DISTRIBUTION
dat_ses$ct_age_xx_17 <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_xx_04 + dat_ses$sxm_age_05_09 + dat_ses$sxm_age_10_14 + dat_ses$sxm_age_15_17 +
                                 dat_ses$sxf_age_xx_04 + dat_ses$sxf_age_05_09 + dat_ses$sxf_age_10_14 + dat_ses$sxf_age_15_17, 0)
summary(dat_ses$ct_age_xx_17) # Age: Under 18 years
dat_ses$ct_agep_xx_17 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_xx_17/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_xx_17) 
dat_ses$ct_age_18_34 <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_18_19 + dat_ses$sxm_age_20_20 + dat_ses$sxm_age_21_21 + dat_ses$sxm_age_22_24 + dat_ses$sxm_age_25_29 + dat_ses$sxm_age_30_34 +
                                 dat_ses$sxf_age_18_19 + dat_ses$sxf_age_20_20 + dat_ses$sxf_age_21_21 + dat_ses$sxf_age_22_24 + dat_ses$sxf_age_25_29 + dat_ses$sxf_age_30_34, 0)
summary(dat_ses$ct_age_18_34) # Age: 18 to 34 years
dat_ses$ct_agep_18_34 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_18_34/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_18_34)
dat_ses$ct_age_35_44 <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_35_39 + dat_ses$sxm_age_40_44 + dat_ses$sxf_age_35_39 + dat_ses$sxf_age_40_44, 0)
summary(dat_ses$ct_age_35_44) # Age: 35 to 44 years
dat_ses$ct_agep_35_44 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_35_44/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_35_44) 
dat_ses$ct_age_45_64 <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_45_49 + dat_ses$sxm_age_50_54 + dat_ses$sxm_age_55_59 + dat_ses$sxm_age_60_61 + dat_ses$sxm_age_62_64 +
                                 dat_ses$sxf_age_45_49 + dat_ses$sxf_age_50_54 + dat_ses$sxf_age_55_59 + dat_ses$sxf_age_60_61 + dat_ses$sxf_age_62_64, 0)
summary(dat_ses$ct_age_45_64) # Age: 45 to 64 years
dat_ses$ct_agep_45_64 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_45_64/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_45_64) 
dat_ses$ct_age_65_xx <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_65_66 + dat_ses$sxm_age_67_69 + dat_ses$sxm_age_70_74 + dat_ses$sxm_age_75_79 + dat_ses$sxm_age_80_84 + dat_ses$sxm_age_85_xx +
                                 dat_ses$sxf_age_65_66 + dat_ses$sxf_age_67_69 + dat_ses$sxf_age_70_74 + dat_ses$sxf_age_75_79 + dat_ses$sxf_age_80_84 + dat_ses$sxf_age_85_xx, 0)
summary(dat_ses$ct_age_65_xx) # Age: Over 64 years
dat_ses$ct_agep_65_xx <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_65_xx/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_65_xx) 
dat_ses$ct_age_med <- ifelse(dat_ses$pop_tot>0, dat_ses$age_med, 0)
dat_ses$ct_age_med[is.na(dat_ses$ct_age_med)] <- 0
summary(dat_ses$ct_age_med) # Age: Median
# EDUCATION DISTRIBUTION
dat_ses$ct_edu_1 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_lhs + dat_ses$edu_tot_hse + dat_ses$edu_tot_som, 0)
summary(dat_ses$ct_edu_1) # Education: Less than bachelor's degree
dat_ses$ct_edup_1 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_1/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_1) 
dat_ses$ct_edu_2 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_bac, 0)
summary(dat_ses$ct_edu_2) # Education: Bachelor's degree
dat_ses$ct_edup_2 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_2/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_2) 
dat_ses$ct_edu_3 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_grd, 0)
summary(dat_ses$ct_edu_3) # Education: Graduate degree
dat_ses$ct_edup_3 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_3/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_3) 
# RACE/ETHNICITY DISTRIBUTION
dat_ses$ct_rac_whi <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_whi - dat_ses$lat_tot_whi, 0)
summary(dat_ses$ct_rac_whi) # Race/Ethnicity: White (non-Hispanic)
dat_ses$ct_racp_whi <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_whi/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_whi)
dat_ses$ct_rac_lat <- ifelse(dat_ses$pop_tot>0, dat_ses$lat_tot_whi, 0)
summary(dat_ses$ct_rac_lat) # Race/Ethnicity: Latino
dat_ses$ct_racp_lat <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_lat/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_lat)
dat_ses$ct_rac_baa <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_baa, 0)
summary(dat_ses$ct_rac_baa) # Race/Ethnicity: Black or African American
dat_ses$ct_racp_baa <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_baa/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_baa)
dat_ses$ct_rac_asn <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_asn, 0)
summary(dat_ses$ct_rac_asn) # Race/Ethnicity: Asian American
dat_ses$ct_racp_asn <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_asn/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_asn)
dat_ses$ct_rac_oth <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_aia + dat_ses$rac_tot_npi + dat_ses$rac_tot_oth + dat_ses$rac_tot_two, 0)
summary(dat_ses$ct_rac_oth) # Race/Ethnicity: Other
dat_ses$ct_racp_oth <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_oth/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_oth)
# HOUSEHOLD VEHICLE DISTRIBUTION
dat_ses$ct_veh_0 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_00, 0)
summary(dat_ses$ct_veh_0) # Household vehicles: 0
dat_ses$ct_vehp_0 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_0/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_0) 
dat_ses$ct_veh_1 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_01, 0)
summary(dat_ses$ct_veh_1) # Household vehicles: 1
dat_ses$ct_vehp_1 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_1/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_1) 
dat_ses$ct_veh_2 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_02, 0)
summary(dat_ses$ct_veh_2) # Household vehicles: 2
dat_ses$ct_vehp_2 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_2/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_2) 
dat_ses$ct_veh_3 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_03 + dat_ses$veh_04 + dat_ses$veh_05, 0)
summary(dat_ses$ct_veh_3) # Household vehicles: 3
dat_ses$ct_vehp_3 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_3/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_3) 
# HOUSEHOLD INCOME DISTRIBUTION
dat_ses$ct_inc_xxx_035 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_000_010 + dat_ses$inc_010_015 + dat_ses$inc_015_020 + dat_ses$inc_020_025 +
                                   dat_ses$inc_025_030 + dat_ses$inc_030_035, 0)
summary(dat_ses$ct_inc_xxx_035) # Household income: Less than $35,000
dat_ses$ct_incp_xxx_035 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_xxx_035/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_xxx_035)
dat_ses$ct_inc_035_075 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_035_040 + dat_ses$inc_040_045 + dat_ses$inc_045_050 + dat_ses$inc_050_060 + dat_ses$inc_060_075, 0)
summary(dat_ses$ct_inc_035_075) # Household income: $35,000 to $74,999
dat_ses$ct_incp_035_075 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_035_075/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_035_075)
dat_ses$ct_inc_075_150 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_075_100 + dat_ses$inc_100_125 + dat_ses$inc_125_150, 0)
summary(dat_ses$ct_inc_075_150) # Household income: $75,000 to $149,999
dat_ses$ct_incp_075_150 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_075_150/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_075_150)
dat_ses$ct_inc_150_xxx <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_150_200 + dat_ses$inc_200_xxx, 0)
summary(dat_ses$ct_inc_150_xxx) # Household income: $150,000 and up
dat_ses$ct_incp_150_xxx <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_150_xxx/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_150_xxx)
dat_ses$ct_inc_med <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_med, 0)
dat_ses$ct_inc_med[is.na(dat_ses$ct_inc_med)] <- 0
summary(dat_ses$ct_inc_med) # Household income: Median
# TENURE DISTRIBUTION
dat_ses$ct_ten_own <- dat_ses$ten_own
dat_ses$ct_tenp_own <- ifelse(dat_ses$ten_xxx>0, dat_ses$ten_own/dat_ses$ten_occ, 0)
summary(dat_ses$ct_tenp_own) # Household tenure: Owners
dat_ses$ct_ten_rnt <- dat_ses$ten_rnt
dat_ses$ct_tenp_rnt <- ifelse(dat_ses$ten_xxx>0, dat_ses$ten_rnt/dat_ses$ten_occ, 0)
summary(dat_ses$ct_tenp_rnt) # Household tenure: Renters
# HOUSEHOLD SIZE BY TENURE
dat_ses$ct_sze_own <- ifelse(dat_ses$pop_tot>0, dat_ses$sze_own, 0)
dat_ses$ct_sze_own[is.na(dat_ses$ct_sze_own)] <- 0
summary(dat_ses$ct_sze_own) # Household size: Median for owners
dat_ses$ct_sze_rnt <- ifelse(dat_ses$pop_tot>0, dat_ses$sze_rnt, 0)
dat_ses$ct_sze_rnt[is.na(dat_ses$ct_sze_rnt)] <- 0
summary(dat_ses$ct_sze_rnt) # Household size: Median for renters

### Neighborhood: Socioeconomic Variable Export

# Reduce and export neighborhood data set
colnames(dat_ses)
dat_ses2 <- dat_ses[,c(1,108:162)]
colnames(dat_ses2)
bos_dat2 <- Reduce(function(x, y) merge(x, y, by="tract", all.x=TRUE), list(bos_dat,dat_ses2))
write_csv(bos_dat2, paste(bos_dir, "bos_uber_02_nhood_ses.csv" , sep="_processed/"))
rm(dat_ses,dat_ses2)

####################

### SAN FRANCISCO

# Load uber movement file
sf_dir <- "~/Desktop/uber_movement/study_1/data/tabular/san_francisco/"
sf_dat <- read_csv(paste(sf_dir, "sf_uber_01_summarized.csv", sep="_processed/"))
sf_dat[1] <- NULL

### Socioeconomic Data, ACS 2013-2017

# TOTAL POPULATION
pop_tot <- get_acs(geography="tract", state="CA", variables=c("B01001_001"), year=2017); colnames(pop_tot) <- c("GEOID","NAME","VAR","pop_tot","pop_tot_m")  
# SEX BY AGE: MALE
sxm_age_xx_xx <- get_acs(geography="tract", state="CA", variables=c("B01001_002"), year=2017); colnames(sxm_age_xx_xx) <- c("GEOID","NAME","VAR","sxm_age_xx_xx","sxm_age_xx_xx_m")
sxm_age_xx_04 <- get_acs(geography="tract", state="CA", variables=c("B01001_003"), year=2017); colnames(sxm_age_xx_04) <- c("GEOID","NAME","VAR","sxm_age_xx_04","sxm_age_xx_04_m")
sxm_age_05_09 <- get_acs(geography="tract", state="CA", variables=c("B01001_004"), year=2017); colnames(sxm_age_05_09) <- c("GEOID","NAME","VAR","sxm_age_05_09","sxm_age_05_09_m")
sxm_age_10_14 <- get_acs(geography="tract", state="CA", variables=c("B01001_005"), year=2017); colnames(sxm_age_10_14) <- c("GEOID","NAME","VAR","sxm_age_10_14","sxm_age_10_14_m")
sxm_age_15_17 <- get_acs(geography="tract", state="CA", variables=c("B01001_006"), year=2017); colnames(sxm_age_15_17) <- c("GEOID","NAME","VAR","sxm_age_15_17","sxm_age_15_17_m")
sxm_age_18_19 <- get_acs(geography="tract", state="CA", variables=c("B01001_007"), year=2017); colnames(sxm_age_18_19) <- c("GEOID","NAME","VAR","sxm_age_18_19","sxm_age_18_19_m")
sxm_age_20_20 <- get_acs(geography="tract", state="CA", variables=c("B01001_008"), year=2017); colnames(sxm_age_20_20) <- c("GEOID","NAME","VAR","sxm_age_20_20","sxm_age_20_20_m")
sxm_age_21_21 <- get_acs(geography="tract", state="CA", variables=c("B01001_009"), year=2017); colnames(sxm_age_21_21) <- c("GEOID","NAME","VAR","sxm_age_21_21","sxm_age_21_21_m")
sxm_age_22_24 <- get_acs(geography="tract", state="CA", variables=c("B01001_010"), year=2017); colnames(sxm_age_22_24) <- c("GEOID","NAME","VAR","sxm_age_22_24","sxm_age_22_24_m")
sxm_age_25_29 <- get_acs(geography="tract", state="CA", variables=c("B01001_011"), year=2017); colnames(sxm_age_25_29) <- c("GEOID","NAME","VAR","sxm_age_25_29","sxm_age_25_29_m")
sxm_age_30_34 <- get_acs(geography="tract", state="CA", variables=c("B01001_012"), year=2017); colnames(sxm_age_30_34) <- c("GEOID","NAME","VAR","sxm_age_30_34","sxm_age_30_34_m")
sxm_age_35_39 <- get_acs(geography="tract", state="CA", variables=c("B01001_013"), year=2017); colnames(sxm_age_35_39) <- c("GEOID","NAME","VAR","sxm_age_35_39","sxm_age_35_39_m")
sxm_age_40_44 <- get_acs(geography="tract", state="CA", variables=c("B01001_014"), year=2017); colnames(sxm_age_40_44) <- c("GEOID","NAME","VAR","sxm_age_40_44","sxm_age_40_44_m")
sxm_age_45_49 <- get_acs(geography="tract", state="CA", variables=c("B01001_015"), year=2017); colnames(sxm_age_45_49) <- c("GEOID","NAME","VAR","sxm_age_45_49","sxm_age_45_49_m")
sxm_age_50_54 <- get_acs(geography="tract", state="CA", variables=c("B01001_016"), year=2017); colnames(sxm_age_50_54) <- c("GEOID","NAME","VAR","sxm_age_50_54","sxm_age_50_54_m")
sxm_age_55_59 <- get_acs(geography="tract", state="CA", variables=c("B01001_017"), year=2017); colnames(sxm_age_55_59) <- c("GEOID","NAME","VAR","sxm_age_55_59","sxm_age_55_59_m")
sxm_age_60_61 <- get_acs(geography="tract", state="CA", variables=c("B01001_018"), year=2017); colnames(sxm_age_60_61) <- c("GEOID","NAME","VAR","sxm_age_60_61","sxm_age_60_61_m")
sxm_age_62_64 <- get_acs(geography="tract", state="CA", variables=c("B01001_019"), year=2017); colnames(sxm_age_62_64) <- c("GEOID","NAME","VAR","sxm_age_62_64","sxm_age_62_64_m")
sxm_age_65_66 <- get_acs(geography="tract", state="CA", variables=c("B01001_020"), year=2017); colnames(sxm_age_65_66) <- c("GEOID","NAME","VAR","sxm_age_65_66","sxm_age_65_66_m")
sxm_age_67_69 <- get_acs(geography="tract", state="CA", variables=c("B01001_021"), year=2017); colnames(sxm_age_67_69) <- c("GEOID","NAME","VAR","sxm_age_67_69","sxm_age_67_69_m")
sxm_age_70_74 <- get_acs(geography="tract", state="CA", variables=c("B01001_022"), year=2017); colnames(sxm_age_70_74) <- c("GEOID","NAME","VAR","sxm_age_70_74","sxm_age_70_74_m")
sxm_age_75_79 <- get_acs(geography="tract", state="CA", variables=c("B01001_023"), year=2017); colnames(sxm_age_75_79) <- c("GEOID","NAME","VAR","sxm_age_75_79","sxm_age_75_79_m")
sxm_age_80_84 <- get_acs(geography="tract", state="CA", variables=c("B01001_024"), year=2017); colnames(sxm_age_80_84) <- c("GEOID","NAME","VAR","sxm_age_80_84","sxm_age_80_84_m")
sxm_age_85_xx <- get_acs(geography="tract", state="CA", variables=c("B01001_025"), year=2017); colnames(sxm_age_85_xx) <- c("GEOID","NAME","VAR","sxm_age_85_xx","sxm_age_85_xx_m")
# SEX BY AGE: FEMALE
sxf_age_xx_xx <- get_acs(geography="tract", state="CA", variables=c("B01001_026"), year=2017); colnames(sxf_age_xx_xx) <- c("GEOID","NAME","VAR","sxf_age_xx_xx","sxf_age_xx_xx_m")
sxf_age_xx_04 <- get_acs(geography="tract", state="CA", variables=c("B01001_027"), year=2017); colnames(sxf_age_xx_04) <- c("GEOID","NAME","VAR","sxf_age_xx_04","sxf_age_xx_04_m")
sxf_age_05_09 <- get_acs(geography="tract", state="CA", variables=c("B01001_028"), year=2017); colnames(sxf_age_05_09) <- c("GEOID","NAME","VAR","sxf_age_05_09","sxf_age_05_09_m")
sxf_age_10_14 <- get_acs(geography="tract", state="CA", variables=c("B01001_029"), year=2017); colnames(sxf_age_10_14) <- c("GEOID","NAME","VAR","sxf_age_10_14","sxf_age_10_14_m")
sxf_age_15_17 <- get_acs(geography="tract", state="CA", variables=c("B01001_030"), year=2017); colnames(sxf_age_15_17) <- c("GEOID","NAME","VAR","sxf_age_15_17","sxf_age_15_17_m")
sxf_age_18_19 <- get_acs(geography="tract", state="CA", variables=c("B01001_031"), year=2017); colnames(sxf_age_18_19) <- c("GEOID","NAME","VAR","sxf_age_18_19","sxf_age_18_19_m")
sxf_age_20_20 <- get_acs(geography="tract", state="CA", variables=c("B01001_032"), year=2017); colnames(sxf_age_20_20) <- c("GEOID","NAME","VAR","sxf_age_20_20","sxf_age_20_20_m")
sxf_age_21_21 <- get_acs(geography="tract", state="CA", variables=c("B01001_033"), year=2017); colnames(sxf_age_21_21) <- c("GEOID","NAME","VAR","sxf_age_21_21","sxf_age_21_21_m")
sxf_age_22_24 <- get_acs(geography="tract", state="CA", variables=c("B01001_034"), year=2017); colnames(sxf_age_22_24) <- c("GEOID","NAME","VAR","sxf_age_22_24","sxf_age_22_24_m")
sxf_age_25_29 <- get_acs(geography="tract", state="CA", variables=c("B01001_035"), year=2017); colnames(sxf_age_25_29) <- c("GEOID","NAME","VAR","sxf_age_25_29","sxf_age_25_29_m")
sxf_age_30_34 <- get_acs(geography="tract", state="CA", variables=c("B01001_036"), year=2017); colnames(sxf_age_30_34) <- c("GEOID","NAME","VAR","sxf_age_30_34","sxf_age_30_34_m")
sxf_age_35_39 <- get_acs(geography="tract", state="CA", variables=c("B01001_037"), year=2017); colnames(sxf_age_35_39) <- c("GEOID","NAME","VAR","sxf_age_35_39","sxf_age_35_39_m")
sxf_age_40_44 <- get_acs(geography="tract", state="CA", variables=c("B01001_038"), year=2017); colnames(sxf_age_40_44) <- c("GEOID","NAME","VAR","sxf_age_40_44","sxf_age_40_44_m")
sxf_age_45_49 <- get_acs(geography="tract", state="CA", variables=c("B01001_039"), year=2017); colnames(sxf_age_45_49) <- c("GEOID","NAME","VAR","sxf_age_45_49","sxf_age_45_49_m")
sxf_age_50_54 <- get_acs(geography="tract", state="CA", variables=c("B01001_040"), year=2017); colnames(sxf_age_50_54) <- c("GEOID","NAME","VAR","sxf_age_50_54","sxf_age_50_54_m")
sxf_age_55_59 <- get_acs(geography="tract", state="CA", variables=c("B01001_041"), year=2017); colnames(sxf_age_55_59) <- c("GEOID","NAME","VAR","sxf_age_55_59","sxf_age_55_59_m")
sxf_age_60_61 <- get_acs(geography="tract", state="CA", variables=c("B01001_042"), year=2017); colnames(sxf_age_60_61) <- c("GEOID","NAME","VAR","sxf_age_60_61","sxf_age_60_61_m")
sxf_age_62_64 <- get_acs(geography="tract", state="CA", variables=c("B01001_043"), year=2017); colnames(sxf_age_62_64) <- c("GEOID","NAME","VAR","sxf_age_62_64","sxf_age_62_64_m")
sxf_age_65_66 <- get_acs(geography="tract", state="CA", variables=c("B01001_044"), year=2017); colnames(sxf_age_65_66) <- c("GEOID","NAME","VAR","sxf_age_65_66","sxf_age_65_66_m")
sxf_age_67_69 <- get_acs(geography="tract", state="CA", variables=c("B01001_045"), year=2017); colnames(sxf_age_67_69) <- c("GEOID","NAME","VAR","sxf_age_67_69","sxf_age_67_69_m")
sxf_age_70_74 <- get_acs(geography="tract", state="CA", variables=c("B01001_046"), year=2017); colnames(sxf_age_70_74) <- c("GEOID","NAME","VAR","sxf_age_70_74","sxf_age_70_74_m")
sxf_age_75_79 <- get_acs(geography="tract", state="CA", variables=c("B01001_047"), year=2017); colnames(sxf_age_75_79) <- c("GEOID","NAME","VAR","sxf_age_75_79","sxf_age_75_79_m")
sxf_age_80_84 <- get_acs(geography="tract", state="CA", variables=c("B01001_048"), year=2017); colnames(sxf_age_80_84) <- c("GEOID","NAME","VAR","sxf_age_80_84","sxf_age_80_84_m")
sxf_age_85_xx <- get_acs(geography="tract", state="CA", variables=c("B01001_049"), year=2017); colnames(sxf_age_85_xx) <- c("GEOID","NAME","VAR","sxf_age_85_xx","sxf_age_85_xx_m")
# MEDIAN AGE
age_med <- get_acs(geography="tract", state="CA", variables=c("B01002_001E"), year=2017); colnames(age_med) <- c("GEOID","NAME","VAR","age_med","age_med_m")
# PLACE OF BIRTH BY EDUCATIONAL ATTAINMENT IN THE UNITED STATES
edu_tot_xxx <- get_acs(geography="tract", state="CA", variables=c("B06009_001"), year=2017); colnames(edu_tot_xxx) <- c("GEOID","NAME","VAR","edu_tot_xxx","edu_tot_xxx_m")
edu_tot_lhs <- get_acs(geography="tract", state="CA", variables=c("B06009_002"), year=2017); colnames(edu_tot_lhs) <- c("GEOID","NAME","VAR","edu_tot_lhs","edu_tot_lhs_m")
edu_tot_hse <- get_acs(geography="tract", state="CA", variables=c("B06009_003"), year=2017); colnames(edu_tot_hse) <- c("GEOID","NAME","VAR","edu_tot_hse","edu_tot_hse_m")
edu_tot_som <- get_acs(geography="tract", state="CA", variables=c("B06009_004"), year=2017); colnames(edu_tot_som) <- c("GEOID","NAME","VAR","edu_tot_som","edu_tot_som_m")
edu_tot_bac <- get_acs(geography="tract", state="CA", variables=c("B06009_005"), year=2017); colnames(edu_tot_bac) <- c("GEOID","NAME","VAR","edu_tot_bac","edu_tot_bac_m")
edu_tot_grd <- get_acs(geography="tract", state="CA", variables=c("B06009_006"), year=2017); colnames(edu_tot_grd) <- c("GEOID","NAME","VAR","edu_tot_grd","edu_tot_grd_m")
# RACE
rac_tot_xxx <- get_acs(geography="tract", state="CA", variables=c("B02001_001"), year=2017); colnames(rac_tot_xxx) <- c("GEOID","NAME","VAR","rac_tot_xxx","rac_tot_xxx_m")
rac_tot_whi <- get_acs(geography="tract", state="CA", variables=c("B02001_002"), year=2017); colnames(rac_tot_whi) <- c("GEOID","NAME","VAR","rac_tot_whi","rac_tot_whi_m")
rac_tot_baa <- get_acs(geography="tract", state="CA", variables=c("B02001_003"), year=2017); colnames(rac_tot_baa) <- c("GEOID","NAME","VAR","rac_tot_baa","rac_tot_baa_m")
rac_tot_aia <- get_acs(geography="tract", state="CA", variables=c("B02001_004"), year=2017); colnames(rac_tot_aia) <- c("GEOID","NAME","VAR","rac_tot_aia","rac_tot_aia_m")
rac_tot_asn <- get_acs(geography="tract", state="CA", variables=c("B02001_005"), year=2017); colnames(rac_tot_asn) <- c("GEOID","NAME","VAR","rac_tot_asn","rac_tot_asn_m")
rac_tot_npi <- get_acs(geography="tract", state="CA", variables=c("B02001_006"), year=2017); colnames(rac_tot_npi) <- c("GEOID","NAME","VAR","rac_tot_npi","rac_tot_npi_m")
rac_tot_oth <- get_acs(geography="tract", state="CA", variables=c("B02001_007"), year=2017); colnames(rac_tot_oth) <- c("GEOID","NAME","VAR","rac_tot_oth","rac_tot_oth_m")
rac_tot_two <- get_acs(geography="tract", state="CA", variables=c("B02001_008"), year=2017); colnames(rac_tot_two) <- c("GEOID","NAME","VAR","rac_tot_two","rac_tot_two_m")
# HISPANIC OR LATINO ORIGIN BY RACE
lat_tot_xxx <- get_acs(geography="tract", state="CA", variables=c("B03002_012"), year=2017); colnames(lat_tot_xxx) <- c("GEOID","NAME","VAR","lat_tot_xxx","lat_tot_xxx_m")
lat_tot_whi <- get_acs(geography="tract", state="CA", variables=c("B03002_013"), year=2017); colnames(lat_tot_whi) <- c("GEOID","NAME","VAR","lat_tot_whi","lat_tot_whi_m")
lat_tot_baa <- get_acs(geography="tract", state="CA", variables=c("B03002_014"), year=2017); colnames(lat_tot_baa) <- c("GEOID","NAME","VAR","lat_tot_baa","lat_tot_baa_m")
lat_tot_aia <- get_acs(geography="tract", state="CA", variables=c("B03002_015"), year=2017); colnames(lat_tot_aia) <- c("GEOID","NAME","VAR","lat_tot_aia","lat_tot_aia_m")
lat_tot_asn <- get_acs(geography="tract", state="CA", variables=c("B03002_016"), year=2017); colnames(lat_tot_asn) <- c("GEOID","NAME","VAR","lat_tot_asn","lat_tot_asn_m")
lat_tot_npi <- get_acs(geography="tract", state="CA", variables=c("B03002_017"), year=2017); colnames(lat_tot_npi) <- c("GEOID","NAME","VAR","lat_tot_npi","lat_tot_npi_m")
lat_tot_oth <- get_acs(geography="tract", state="CA", variables=c("B03002_018"), year=2017); colnames(lat_tot_oth) <- c("GEOID","NAME","VAR","lat_tot_oth","lat_tot_oth_m")
lat_tot_two <- get_acs(geography="tract", state="CA", variables=c("B03002_019"), year=2017); colnames(lat_tot_two) <- c("GEOID","NAME","VAR","lat_tot_two","lat_tot_two_m")
# HOUSEHOLD SIZE BY VEHICLES AVAILABLE
veh_xx <- get_acs(geography="tract", state="CA", variables=c("B08014_001"), year=2017); colnames(veh_xx) <- c("GEOID","NAME","VAR","veh_xx","veh_xx_m")
veh_00 <- get_acs(geography="tract", state="CA", variables=c("B08014_002"), year=2017); colnames(veh_00) <- c("GEOID","NAME","VAR","veh_00","veh_00_m")
veh_01 <- get_acs(geography="tract", state="CA", variables=c("B08014_003"), year=2017); colnames(veh_01) <- c("GEOID","NAME","VAR","veh_01","veh_01_m")
veh_02 <- get_acs(geography="tract", state="CA", variables=c("B08014_004"), year=2017); colnames(veh_02) <- c("GEOID","NAME","VAR","veh_02","veh_02_m")
veh_03 <- get_acs(geography="tract", state="CA", variables=c("B08014_005"), year=2017); colnames(veh_03) <- c("GEOID","NAME","VAR","veh_03","veh_03_m")
veh_04 <- get_acs(geography="tract", state="CA", variables=c("B08014_006"), year=2017); colnames(veh_04) <- c("GEOID","NAME","VAR","veh_04","veh_04_m")
veh_05 <- get_acs(geography="tract", state="CA", variables=c("B08014_007"), year=2017); colnames(veh_05) <- c("GEOID","NAME","VAR","veh_05","veh_05_m")
# HOUSEHOLD INCOME IN THE PAST 12 MONTHS
inc_xxx_xxx <- get_acs(geography="tract", state="CA", variables=c("B19001_001"), year=2017); colnames(inc_xxx_xxx) <- c("GEOID","NAME","VAR","inc_xxx_xxx","inc_xxx_xxx_m")
inc_000_010 <- get_acs(geography="tract", state="CA", variables=c("B19001_002"), year=2017); colnames(inc_000_010) <- c("GEOID","NAME","VAR","inc_000_010","inc_000_010_m")
inc_010_015 <- get_acs(geography="tract", state="CA", variables=c("B19001_003"), year=2017); colnames(inc_010_015) <- c("GEOID","NAME","VAR","inc_010_015","inc_010_015_m")
inc_015_020 <- get_acs(geography="tract", state="CA", variables=c("B19001_004"), year=2017); colnames(inc_015_020) <- c("GEOID","NAME","VAR","inc_015_020","inc_015_020_m")
inc_020_025 <- get_acs(geography="tract", state="CA", variables=c("B19001_005"), year=2017); colnames(inc_020_025) <- c("GEOID","NAME","VAR","inc_020_025","inc_020_025_m")
inc_025_030 <- get_acs(geography="tract", state="CA", variables=c("B19001_006"), year=2017); colnames(inc_025_030) <- c("GEOID","NAME","VAR","inc_025_030","inc_025_030_m")
inc_030_035 <- get_acs(geography="tract", state="CA", variables=c("B19001_007"), year=2017); colnames(inc_030_035) <- c("GEOID","NAME","VAR","inc_030_035","inc_030_035_m")
inc_035_040 <- get_acs(geography="tract", state="CA", variables=c("B19001_008"), year=2017); colnames(inc_035_040) <- c("GEOID","NAME","VAR","inc_035_040","inc_035_040_m")
inc_040_045 <- get_acs(geography="tract", state="CA", variables=c("B19001_009"), year=2017); colnames(inc_040_045) <- c("GEOID","NAME","VAR","inc_040_045","inc_040_045_m")
inc_045_050 <- get_acs(geography="tract", state="CA", variables=c("B19001_010"), year=2017); colnames(inc_045_050) <- c("GEOID","NAME","VAR","inc_045_050","inc_045_050_m")
inc_050_060 <- get_acs(geography="tract", state="CA", variables=c("B19001_011"), year=2017); colnames(inc_050_060) <- c("GEOID","NAME","VAR","inc_050_060","inc_050_060_m")
inc_060_075 <- get_acs(geography="tract", state="CA", variables=c("B19001_012"), year=2017); colnames(inc_060_075) <- c("GEOID","NAME","VAR","inc_060_075","inc_060_075_m")
inc_075_100 <- get_acs(geography="tract", state="CA", variables=c("B19001_013"), year=2017); colnames(inc_075_100) <- c("GEOID","NAME","VAR","inc_075_100","inc_075_100_m")
inc_100_125 <- get_acs(geography="tract", state="CA", variables=c("B19001_014"), year=2017); colnames(inc_100_125) <- c("GEOID","NAME","VAR","inc_100_125","inc_100_125_m")
inc_125_150 <- get_acs(geography="tract", state="CA", variables=c("B19001_015"), year=2017); colnames(inc_125_150) <- c("GEOID","NAME","VAR","inc_125_150","inc_125_150_m")
inc_150_200 <- get_acs(geography="tract", state="CA", variables=c("B19001_016"), year=2017); colnames(inc_150_200) <- c("GEOID","NAME","VAR","inc_150_200","inc_150_200_m")
inc_200_XXX <- get_acs(geography="tract", state="CA", variables=c("B19001_017"), year=2017); colnames(inc_200_XXX) <- c("GEOID","NAME","VAR","inc_200_xxx","inc_200_xxx_m")
# MEDIAN HOUSEHOLD INCOME
inc_med <- get_acs(geography="tract", state="CA", variables=c("B19013_001"), year=2017); colnames(inc_med) <- c("GEOID","NAME","VAR","inc_med","inc_med_m")
# TOTAL POPULATION IN OCCUPIED HOUSING UNITS BY TENURE
ten_xxx <- get_acs(geography="tract", state="CA", variables=c("B25002_001"), year=2017); colnames(ten_xxx) <- c("GEOID","NAME","VAR","ten_xxx","ten_xxx_m")
ten_occ <- get_acs(geography="tract", state="CA", variables=c("B25002_002"), year=2017); colnames(ten_occ) <- c("GEOID","NAME","VAR","ten_occ","ten_occ_m")
ten_vac <- get_acs(geography="tract", state="CA", variables=c("B25002_003"), year=2017); colnames(ten_vac) <- c("GEOID","NAME","VAR","ten_vac","ten_vac_m")
ten_own <- get_acs(geography="tract", state="CA", variables=c("B25003_002"), year=2017); colnames(ten_own) <- c("GEOID","NAME","VAR","ten_own","ten_own_m")
ten_rnt <- get_acs(geography="tract", state="CA", variables=c("B25003_003"), year=2017); colnames(ten_rnt) <- c("GEOID","NAME","VAR","ten_rnt","ten_rnt_m")
# AVERAGE HOUSEHOLD SIZE OF OCCUPIED HOUSING UNITS BY TENURE
sze_xxx <- get_acs(geography="tract", state="CA", variables=c("B25010_001"), year=2017); colnames(sze_xxx) <- c("GEOID","NAME","VAR","sze_xxx","sze_xxx_m")
sze_own <- get_acs(geography="tract", state="CA", variables=c("B25010_002"), year=2017); colnames(sze_own) <- c("GEOID","NAME","VAR","sze_own","sze_own_m")
sze_rnt <- get_acs(geography="tract", state="CA", variables=c("B25010_003"), year=2017); colnames(sze_rnt) <- c("GEOID","NAME","VAR","sze_rnt","sze_rnt_m")

### Socioeconomic Variable Categorizing

# POPULATION
pop <- pop_tot[,c(1:2,4)]
rm(pop_tot)
# AGE
age <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE),
              list(sxm_age_xx_xx,sxm_age_xx_04,sxm_age_05_09,sxm_age_10_14,sxm_age_15_17,sxm_age_18_19,sxm_age_20_20,sxm_age_21_21,sxm_age_22_24,sxm_age_25_29,
                   sxm_age_30_34,sxm_age_35_39,sxm_age_40_44,sxm_age_45_49,sxm_age_50_54,sxm_age_55_59,sxm_age_60_61,sxm_age_62_64,sxm_age_65_66,sxm_age_67_69,
                   sxm_age_70_74,sxm_age_75_79,sxm_age_80_84,sxm_age_85_xx,
                   sxf_age_xx_xx,sxf_age_xx_04,sxf_age_05_09,sxf_age_10_14,sxf_age_15_17,sxf_age_18_19,sxf_age_20_20,sxf_age_21_21,sxf_age_22_24,sxf_age_25_29,
                   sxf_age_30_34,sxf_age_35_39,sxf_age_40_44,sxf_age_45_49,sxf_age_50_54,sxf_age_55_59,sxf_age_60_61,sxf_age_62_64,sxf_age_65_66,sxf_age_67_69,
                   sxf_age_70_74,sxf_age_75_79,sxf_age_80_84,sxf_age_85_xx,age_med))
age <- age[,c(1,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,
              132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196)]
rm(sxm_age_xx_xx,sxm_age_xx_04,sxm_age_05_09,sxm_age_10_14,sxm_age_15_17,sxm_age_18_19,sxm_age_20_20,sxm_age_21_21,sxm_age_22_24,sxm_age_25_29,
   sxm_age_30_34,sxm_age_35_39,sxm_age_40_44,sxm_age_45_49,sxm_age_50_54,sxm_age_55_59,sxm_age_60_61,sxm_age_62_64,sxm_age_65_66,sxm_age_67_69,
   sxm_age_70_74,sxm_age_75_79,sxm_age_80_84,sxm_age_85_xx,
   sxf_age_xx_xx,sxf_age_xx_04,sxf_age_05_09,sxf_age_10_14,sxf_age_15_17,sxf_age_18_19,sxf_age_20_20,sxf_age_21_21,sxf_age_22_24,sxf_age_25_29,
   sxf_age_30_34,sxf_age_35_39,sxf_age_40_44,sxf_age_45_49,sxf_age_50_54,sxf_age_55_59,sxf_age_60_61,sxf_age_62_64,sxf_age_65_66,sxf_age_67_69,
   sxf_age_70_74,sxf_age_75_79,sxf_age_80_84,sxf_age_85_xx,age_med)
# EDUCATION
edu <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(edu_tot_xxx,edu_tot_lhs,edu_tot_hse,edu_tot_som,edu_tot_bac,edu_tot_grd))
edu <- edu[,c(1,4,8,12,16,20,24)]
rm(edu_tot_xxx,edu_tot_lhs,edu_tot_hse,edu_tot_som,edu_tot_bac,edu_tot_grd)
# RACE
rac <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(rac_tot_xxx,rac_tot_whi,rac_tot_baa,rac_tot_aia,rac_tot_asn,rac_tot_npi,rac_tot_oth,rac_tot_two))
rac <- rac[,c(1,4,8,12,16,20,24,28,32)]
rm(rac_tot_xxx,rac_tot_whi,rac_tot_baa,rac_tot_aia,rac_tot_asn,rac_tot_npi,rac_tot_oth,rac_tot_two)
# HISPANIC OR LATINO ORIGIN
lat <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(lat_tot_xxx,lat_tot_whi,lat_tot_baa,lat_tot_aia,lat_tot_asn,lat_tot_npi,lat_tot_oth,lat_tot_two))
lat <- lat[,c(1,4,8,12,16,20,24,28,32)]
rm(lat_tot_xxx,lat_tot_whi,lat_tot_baa,lat_tot_aia,lat_tot_asn,lat_tot_npi,lat_tot_oth,lat_tot_two)
# HOUSEHOLD VEHICLES
veh <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(veh_xx,veh_00,veh_01,veh_02,veh_03,veh_04,veh_05))
veh <- veh[,c(1,4,8,12,16,20,24,28)]
rm(veh_xx,veh_00,veh_01,veh_02,veh_03,veh_04,veh_05)
# HOUSEHOLD INCOME
inc <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE),
              list(inc_xxx_xxx,inc_000_010,inc_010_015,inc_015_020,inc_020_025,inc_025_030,inc_030_035,inc_035_040,inc_040_045,
                   inc_045_050,inc_050_060,inc_060_075,inc_075_100,inc_100_125,inc_125_150,inc_150_200,inc_200_XXX,inc_med))
inc <- inc[,c(1,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72)]
rm(inc_xxx_xxx,inc_000_010,inc_010_015,inc_015_020,inc_020_025,inc_025_030,inc_030_035,inc_035_040,inc_040_045,
   inc_045_050,inc_050_060,inc_060_075,inc_075_100,inc_100_125,inc_125_150,inc_150_200,inc_200_XXX,inc_med)
# TENURE
ten <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(ten_xxx,ten_occ,ten_vac,ten_own,ten_rnt))
ten <- ten[,c(1,4,8,12,16,20)]
rm(ten_xxx,ten_occ,ten_vac,ten_own,ten_rnt)
# HOUSEHOLD SIZE
sze <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(sze_xxx,sze_own,sze_rnt))
sze <- sze[,c(1,4,8,12)]
rm(sze_xxx,sze_own,sze_rnt)

# Merge data files
dat_ses <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(pop,age,edu,rac,lat,veh,inc,ten,sze))
colnames(dat_ses)[1] <- "tract"
rm(pop,age,edu,rac,lat,veh,inc,ten,sze,vars)

### Socioeconomic Variable Creation

# POPULATION
dat_ses$ct_pop_tot <- dat_ses$pop_tot
summary(dat_ses$ct_pop_tot)
# SEX DISTRIBUTION
dat_ses$ct_sex_m <- dat_ses$sxm_age_xx_xx
dat_ses$ct_sexp_m <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_xx_xx/dat_ses$pop_tot, 0)
summary(dat_ses$ct_sexp_m) # Sex: Male
dat_ses$ct_sex_f <- dat_ses$sxf_age_xx_xx
dat_ses$ct_sexp_f <- ifelse(dat_ses$pop_tot>0, dat_ses$sxf_age_xx_xx/dat_ses$pop_tot, 0)
summary(dat_ses$ct_sexp_f) # Sex: Female
# AGE DISTRIBUTION
dat_ses$ct_age_xx_17 <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_xx_04 + dat_ses$sxm_age_05_09 + dat_ses$sxm_age_10_14 + dat_ses$sxm_age_15_17 +
                                  dat_ses$sxf_age_xx_04 + dat_ses$sxf_age_05_09 + dat_ses$sxf_age_10_14 + dat_ses$sxf_age_15_17, 0)
summary(dat_ses$ct_age_xx_17) # Age: Under 18 years
dat_ses$ct_agep_xx_17 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_xx_17/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_xx_17) 
dat_ses$ct_age_18_34 <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_18_19 + dat_ses$sxm_age_20_20 + dat_ses$sxm_age_21_21 + dat_ses$sxm_age_22_24 + dat_ses$sxm_age_25_29 + dat_ses$sxm_age_30_34 +
                                  dat_ses$sxf_age_18_19 + dat_ses$sxf_age_20_20 + dat_ses$sxf_age_21_21 + dat_ses$sxf_age_22_24 + dat_ses$sxf_age_25_29 + dat_ses$sxf_age_30_34, 0)
summary(dat_ses$ct_age_18_34) # Age: 18 to 34 years
dat_ses$ct_agep_18_34 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_18_34/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_18_34)
dat_ses$ct_age_35_44 <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_35_39 + dat_ses$sxm_age_40_44 + dat_ses$sxf_age_35_39 + dat_ses$sxf_age_40_44, 0)
summary(dat_ses$ct_age_35_44) # Age: 35 to 44 years
dat_ses$ct_agep_35_44 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_35_44/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_35_44) 
dat_ses$ct_age_45_64 <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_45_49 + dat_ses$sxm_age_50_54 + dat_ses$sxm_age_55_59 + dat_ses$sxm_age_60_61 + dat_ses$sxm_age_62_64 +
                                  dat_ses$sxf_age_45_49 + dat_ses$sxf_age_50_54 + dat_ses$sxf_age_55_59 + dat_ses$sxf_age_60_61 + dat_ses$sxf_age_62_64, 0)
summary(dat_ses$ct_age_45_64) # Age: 45 to 64 years
dat_ses$ct_agep_45_64 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_45_64/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_45_64) 
dat_ses$ct_age_65_xx <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_65_66 + dat_ses$sxm_age_67_69 + dat_ses$sxm_age_70_74 + dat_ses$sxm_age_75_79 + dat_ses$sxm_age_80_84 + dat_ses$sxm_age_85_xx +
                                  dat_ses$sxf_age_65_66 + dat_ses$sxf_age_67_69 + dat_ses$sxf_age_70_74 + dat_ses$sxf_age_75_79 + dat_ses$sxf_age_80_84 + dat_ses$sxf_age_85_xx, 0)
summary(dat_ses$ct_age_65_xx) # Age: Over 64 years
dat_ses$ct_agep_65_xx <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_65_xx/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_65_xx) 
dat_ses$ct_age_med <- ifelse(dat_ses$pop_tot>0, dat_ses$age_med, 0)
dat_ses$ct_age_med[is.na(dat_ses$ct_age_med)] <- 0
summary(dat_ses$ct_age_med) # Age: Median
# EDUCATION DISTRIBUTION
dat_ses$ct_edu_1 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_lhs + dat_ses$edu_tot_hse + dat_ses$edu_tot_som, 0)
summary(dat_ses$ct_edu_1) # Education: Less than bachelor's degree
dat_ses$ct_edup_1 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_1/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_1) 
dat_ses$ct_edu_2 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_bac, 0)
summary(dat_ses$ct_edu_2) # Education: Bachelor's degree
dat_ses$ct_edup_2 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_2/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_2) 
dat_ses$ct_edu_3 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_grd, 0)
summary(dat_ses$ct_edu_3) # Education: Graduate degree
dat_ses$ct_edup_3 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_3/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_3) 
# RACE/ETHNICITY DISTRIBUTION
dat_ses$ct_rac_whi <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_whi - dat_ses$lat_tot_whi, 0)
summary(dat_ses$ct_rac_whi) # Race/Ethnicity: White (non-Hispanic)
dat_ses$ct_racp_whi <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_whi/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_whi)
dat_ses$ct_rac_lat <- ifelse(dat_ses$pop_tot>0, dat_ses$lat_tot_whi, 0)
summary(dat_ses$ct_rac_lat) # Race/Ethnicity: Latino
dat_ses$ct_racp_lat <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_lat/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_lat)
dat_ses$ct_rac_baa <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_baa, 0)
summary(dat_ses$ct_rac_baa) # Race/Ethnicity: Black or African American
dat_ses$ct_racp_baa <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_baa/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_baa)
dat_ses$ct_rac_asn <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_asn, 0)
summary(dat_ses$ct_rac_asn) # Race/Ethnicity: Asian American
dat_ses$ct_racp_asn <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_asn/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_asn)
dat_ses$ct_rac_oth <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_aia + dat_ses$rac_tot_npi + dat_ses$rac_tot_oth + dat_ses$rac_tot_two, 0)
summary(dat_ses$ct_rac_oth) # Race/Ethnicity: Other
dat_ses$ct_racp_oth <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_oth/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_oth)
# HOUSEHOLD VEHICLE DISTRIBUTION
dat_ses$ct_veh_0 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_00, 0)
summary(dat_ses$ct_veh_0) # Household vehicles: 0
dat_ses$ct_vehp_0 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_0/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_0) 
dat_ses$ct_veh_1 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_01, 0)
summary(dat_ses$ct_veh_1) # Household vehicles: 1
dat_ses$ct_vehp_1 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_1/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_1) 
dat_ses$ct_veh_2 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_02, 0)
summary(dat_ses$ct_veh_2) # Household vehicles: 2
dat_ses$ct_vehp_2 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_2/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_2) 
dat_ses$ct_veh_3 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_03 + dat_ses$veh_04 + dat_ses$veh_05, 0)
summary(dat_ses$ct_veh_3) # Household vehicles: 3
dat_ses$ct_vehp_3 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_3/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_3) 
# HOUSEHOLD INCOME DISTRIBUTION
dat_ses$ct_inc_xxx_035 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_000_010 + dat_ses$inc_010_015 + dat_ses$inc_015_020 + dat_ses$inc_020_025 +
                                    dat_ses$inc_025_030 + dat_ses$inc_030_035, 0)
summary(dat_ses$ct_inc_xxx_035) # Household income: Less than $35,000
dat_ses$ct_incp_xxx_035 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_xxx_035/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_xxx_035)
dat_ses$ct_inc_035_075 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_035_040 + dat_ses$inc_040_045 + dat_ses$inc_045_050 + dat_ses$inc_050_060 + dat_ses$inc_060_075, 0)
summary(dat_ses$ct_inc_035_075) # Household income: $35,000 to $74,999
dat_ses$ct_incp_035_075 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_035_075/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_035_075)
dat_ses$ct_inc_075_150 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_075_100 + dat_ses$inc_100_125 + dat_ses$inc_125_150, 0)
summary(dat_ses$ct_inc_075_150) # Household income: $75,000 to $149,999
dat_ses$ct_incp_075_150 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_075_150/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_075_150)
dat_ses$ct_inc_150_xxx <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_150_200 + dat_ses$inc_200_xxx, 0)
summary(dat_ses$ct_inc_150_xxx) # Household income: $150,000 and up
dat_ses$ct_incp_150_xxx <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_150_xxx/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_150_xxx)
dat_ses$ct_inc_med <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_med, 0)
dat_ses$ct_inc_med[is.na(dat_ses$ct_inc_med)] <- 0
summary(dat_ses$ct_inc_med) # Household income: Median
# TENURE DISTRIBUTION
dat_ses$ct_ten_own <- dat_ses$ten_own
dat_ses$ct_tenp_own <- ifelse(dat_ses$ten_xxx>0, dat_ses$ten_own/dat_ses$ten_occ, 0)
summary(dat_ses$ct_tenp_own) # Household tenure: Owners
dat_ses$ct_ten_rnt <- dat_ses$ten_rnt
dat_ses$ct_tenp_rnt <- ifelse(dat_ses$ten_xxx>0, dat_ses$ten_rnt/dat_ses$ten_occ, 0)
summary(dat_ses$ct_tenp_rnt) # Household tenure: Renters
# HOUSEHOLD SIZE BY TENURE
dat_ses$ct_sze_own <- ifelse(dat_ses$pop_tot>0, dat_ses$sze_own, 0)
dat_ses$ct_sze_own[is.na(dat_ses$ct_sze_own)] <- 0
summary(dat_ses$ct_sze_own) # Household size: Median for owners
dat_ses$ct_sze_rnt <- ifelse(dat_ses$pop_tot>0, dat_ses$sze_rnt, 0)
dat_ses$ct_sze_rnt[is.na(dat_ses$ct_sze_rnt)] <- 0
summary(dat_ses$ct_sze_rnt) # Household size: Median for renters

### Neighborhood: Socioeconomic Variable Export

# Reduce and export neighborhood data set
colnames(dat_ses)
dat_ses2 <- dat_ses[,c(1,108:162)]
colnames(dat_ses2)
sf_dat2 <- Reduce(function(x, y) merge(x, y, by="tract", all.x=TRUE), list(sf_dat,dat_ses2))
write_csv(sf_dat2, paste(sf_dir, "sf_uber_02_nhood_ses.csv" , sep="_processed/"))
rm(dat_ses,dat_ses2)

####################

### WASHINGTON, DC

# Load uber movement file
dc_dir <- "~/Desktop/uber_movement/study_1/data/tabular/washington_dc/"
dc_dat <- read_csv(paste(dc_dir, "dc_uber_01_summarized.csv", sep="_processed/"))
dc_dat[1] <- NULL

### Socioeconomic Data, ACS 2013-2017

# TOTAL POPULATION
pop_tot <- get_acs(geography="tract", state="DC", variables=c("B01001_001"), year=2017); colnames(pop_tot) <- c("GEOID","NAME","VAR","pop_tot","pop_tot_m")  
# SEX BY AGE: MALE
sxm_age_xx_xx <- get_acs(geography="tract", state="DC", variables=c("B01001_002"), year=2017); colnames(sxm_age_xx_xx) <- c("GEOID","NAME","VAR","sxm_age_xx_xx","sxm_age_xx_xx_m")
sxm_age_xx_04 <- get_acs(geography="tract", state="DC", variables=c("B01001_003"), year=2017); colnames(sxm_age_xx_04) <- c("GEOID","NAME","VAR","sxm_age_xx_04","sxm_age_xx_04_m")
sxm_age_05_09 <- get_acs(geography="tract", state="DC", variables=c("B01001_004"), year=2017); colnames(sxm_age_05_09) <- c("GEOID","NAME","VAR","sxm_age_05_09","sxm_age_05_09_m")
sxm_age_10_14 <- get_acs(geography="tract", state="DC", variables=c("B01001_005"), year=2017); colnames(sxm_age_10_14) <- c("GEOID","NAME","VAR","sxm_age_10_14","sxm_age_10_14_m")
sxm_age_15_17 <- get_acs(geography="tract", state="DC", variables=c("B01001_006"), year=2017); colnames(sxm_age_15_17) <- c("GEOID","NAME","VAR","sxm_age_15_17","sxm_age_15_17_m")
sxm_age_18_19 <- get_acs(geography="tract", state="DC", variables=c("B01001_007"), year=2017); colnames(sxm_age_18_19) <- c("GEOID","NAME","VAR","sxm_age_18_19","sxm_age_18_19_m")
sxm_age_20_20 <- get_acs(geography="tract", state="DC", variables=c("B01001_008"), year=2017); colnames(sxm_age_20_20) <- c("GEOID","NAME","VAR","sxm_age_20_20","sxm_age_20_20_m")
sxm_age_21_21 <- get_acs(geography="tract", state="DC", variables=c("B01001_009"), year=2017); colnames(sxm_age_21_21) <- c("GEOID","NAME","VAR","sxm_age_21_21","sxm_age_21_21_m")
sxm_age_22_24 <- get_acs(geography="tract", state="DC", variables=c("B01001_010"), year=2017); colnames(sxm_age_22_24) <- c("GEOID","NAME","VAR","sxm_age_22_24","sxm_age_22_24_m")
sxm_age_25_29 <- get_acs(geography="tract", state="DC", variables=c("B01001_011"), year=2017); colnames(sxm_age_25_29) <- c("GEOID","NAME","VAR","sxm_age_25_29","sxm_age_25_29_m")
sxm_age_30_34 <- get_acs(geography="tract", state="DC", variables=c("B01001_012"), year=2017); colnames(sxm_age_30_34) <- c("GEOID","NAME","VAR","sxm_age_30_34","sxm_age_30_34_m")
sxm_age_35_39 <- get_acs(geography="tract", state="DC", variables=c("B01001_013"), year=2017); colnames(sxm_age_35_39) <- c("GEOID","NAME","VAR","sxm_age_35_39","sxm_age_35_39_m")
sxm_age_40_44 <- get_acs(geography="tract", state="DC", variables=c("B01001_014"), year=2017); colnames(sxm_age_40_44) <- c("GEOID","NAME","VAR","sxm_age_40_44","sxm_age_40_44_m")
sxm_age_45_49 <- get_acs(geography="tract", state="DC", variables=c("B01001_015"), year=2017); colnames(sxm_age_45_49) <- c("GEOID","NAME","VAR","sxm_age_45_49","sxm_age_45_49_m")
sxm_age_50_54 <- get_acs(geography="tract", state="DC", variables=c("B01001_016"), year=2017); colnames(sxm_age_50_54) <- c("GEOID","NAME","VAR","sxm_age_50_54","sxm_age_50_54_m")
sxm_age_55_59 <- get_acs(geography="tract", state="DC", variables=c("B01001_017"), year=2017); colnames(sxm_age_55_59) <- c("GEOID","NAME","VAR","sxm_age_55_59","sxm_age_55_59_m")
sxm_age_60_61 <- get_acs(geography="tract", state="DC", variables=c("B01001_018"), year=2017); colnames(sxm_age_60_61) <- c("GEOID","NAME","VAR","sxm_age_60_61","sxm_age_60_61_m")
sxm_age_62_64 <- get_acs(geography="tract", state="DC", variables=c("B01001_019"), year=2017); colnames(sxm_age_62_64) <- c("GEOID","NAME","VAR","sxm_age_62_64","sxm_age_62_64_m")
sxm_age_65_66 <- get_acs(geography="tract", state="DC", variables=c("B01001_020"), year=2017); colnames(sxm_age_65_66) <- c("GEOID","NAME","VAR","sxm_age_65_66","sxm_age_65_66_m")
sxm_age_67_69 <- get_acs(geography="tract", state="DC", variables=c("B01001_021"), year=2017); colnames(sxm_age_67_69) <- c("GEOID","NAME","VAR","sxm_age_67_69","sxm_age_67_69_m")
sxm_age_70_74 <- get_acs(geography="tract", state="DC", variables=c("B01001_022"), year=2017); colnames(sxm_age_70_74) <- c("GEOID","NAME","VAR","sxm_age_70_74","sxm_age_70_74_m")
sxm_age_75_79 <- get_acs(geography="tract", state="DC", variables=c("B01001_023"), year=2017); colnames(sxm_age_75_79) <- c("GEOID","NAME","VAR","sxm_age_75_79","sxm_age_75_79_m")
sxm_age_80_84 <- get_acs(geography="tract", state="DC", variables=c("B01001_024"), year=2017); colnames(sxm_age_80_84) <- c("GEOID","NAME","VAR","sxm_age_80_84","sxm_age_80_84_m")
sxm_age_85_xx <- get_acs(geography="tract", state="DC", variables=c("B01001_025"), year=2017); colnames(sxm_age_85_xx) <- c("GEOID","NAME","VAR","sxm_age_85_xx","sxm_age_85_xx_m")
# SEX BY AGE: FEMALE
sxf_age_xx_xx <- get_acs(geography="tract", state="DC", variables=c("B01001_026"), year=2017); colnames(sxf_age_xx_xx) <- c("GEOID","NAME","VAR","sxf_age_xx_xx","sxf_age_xx_xx_m")
sxf_age_xx_04 <- get_acs(geography="tract", state="DC", variables=c("B01001_027"), year=2017); colnames(sxf_age_xx_04) <- c("GEOID","NAME","VAR","sxf_age_xx_04","sxf_age_xx_04_m")
sxf_age_05_09 <- get_acs(geography="tract", state="DC", variables=c("B01001_028"), year=2017); colnames(sxf_age_05_09) <- c("GEOID","NAME","VAR","sxf_age_05_09","sxf_age_05_09_m")
sxf_age_10_14 <- get_acs(geography="tract", state="DC", variables=c("B01001_029"), year=2017); colnames(sxf_age_10_14) <- c("GEOID","NAME","VAR","sxf_age_10_14","sxf_age_10_14_m")
sxf_age_15_17 <- get_acs(geography="tract", state="DC", variables=c("B01001_030"), year=2017); colnames(sxf_age_15_17) <- c("GEOID","NAME","VAR","sxf_age_15_17","sxf_age_15_17_m")
sxf_age_18_19 <- get_acs(geography="tract", state="DC", variables=c("B01001_031"), year=2017); colnames(sxf_age_18_19) <- c("GEOID","NAME","VAR","sxf_age_18_19","sxf_age_18_19_m")
sxf_age_20_20 <- get_acs(geography="tract", state="DC", variables=c("B01001_032"), year=2017); colnames(sxf_age_20_20) <- c("GEOID","NAME","VAR","sxf_age_20_20","sxf_age_20_20_m")
sxf_age_21_21 <- get_acs(geography="tract", state="DC", variables=c("B01001_033"), year=2017); colnames(sxf_age_21_21) <- c("GEOID","NAME","VAR","sxf_age_21_21","sxf_age_21_21_m")
sxf_age_22_24 <- get_acs(geography="tract", state="DC", variables=c("B01001_034"), year=2017); colnames(sxf_age_22_24) <- c("GEOID","NAME","VAR","sxf_age_22_24","sxf_age_22_24_m")
sxf_age_25_29 <- get_acs(geography="tract", state="DC", variables=c("B01001_035"), year=2017); colnames(sxf_age_25_29) <- c("GEOID","NAME","VAR","sxf_age_25_29","sxf_age_25_29_m")
sxf_age_30_34 <- get_acs(geography="tract", state="DC", variables=c("B01001_036"), year=2017); colnames(sxf_age_30_34) <- c("GEOID","NAME","VAR","sxf_age_30_34","sxf_age_30_34_m")
sxf_age_35_39 <- get_acs(geography="tract", state="DC", variables=c("B01001_037"), year=2017); colnames(sxf_age_35_39) <- c("GEOID","NAME","VAR","sxf_age_35_39","sxf_age_35_39_m")
sxf_age_40_44 <- get_acs(geography="tract", state="DC", variables=c("B01001_038"), year=2017); colnames(sxf_age_40_44) <- c("GEOID","NAME","VAR","sxf_age_40_44","sxf_age_40_44_m")
sxf_age_45_49 <- get_acs(geography="tract", state="DC", variables=c("B01001_039"), year=2017); colnames(sxf_age_45_49) <- c("GEOID","NAME","VAR","sxf_age_45_49","sxf_age_45_49_m")
sxf_age_50_54 <- get_acs(geography="tract", state="DC", variables=c("B01001_040"), year=2017); colnames(sxf_age_50_54) <- c("GEOID","NAME","VAR","sxf_age_50_54","sxf_age_50_54_m")
sxf_age_55_59 <- get_acs(geography="tract", state="DC", variables=c("B01001_041"), year=2017); colnames(sxf_age_55_59) <- c("GEOID","NAME","VAR","sxf_age_55_59","sxf_age_55_59_m")
sxf_age_60_61 <- get_acs(geography="tract", state="DC", variables=c("B01001_042"), year=2017); colnames(sxf_age_60_61) <- c("GEOID","NAME","VAR","sxf_age_60_61","sxf_age_60_61_m")
sxf_age_62_64 <- get_acs(geography="tract", state="DC", variables=c("B01001_043"), year=2017); colnames(sxf_age_62_64) <- c("GEOID","NAME","VAR","sxf_age_62_64","sxf_age_62_64_m")
sxf_age_65_66 <- get_acs(geography="tract", state="DC", variables=c("B01001_044"), year=2017); colnames(sxf_age_65_66) <- c("GEOID","NAME","VAR","sxf_age_65_66","sxf_age_65_66_m")
sxf_age_67_69 <- get_acs(geography="tract", state="DC", variables=c("B01001_045"), year=2017); colnames(sxf_age_67_69) <- c("GEOID","NAME","VAR","sxf_age_67_69","sxf_age_67_69_m")
sxf_age_70_74 <- get_acs(geography="tract", state="DC", variables=c("B01001_046"), year=2017); colnames(sxf_age_70_74) <- c("GEOID","NAME","VAR","sxf_age_70_74","sxf_age_70_74_m")
sxf_age_75_79 <- get_acs(geography="tract", state="DC", variables=c("B01001_047"), year=2017); colnames(sxf_age_75_79) <- c("GEOID","NAME","VAR","sxf_age_75_79","sxf_age_75_79_m")
sxf_age_80_84 <- get_acs(geography="tract", state="DC", variables=c("B01001_048"), year=2017); colnames(sxf_age_80_84) <- c("GEOID","NAME","VAR","sxf_age_80_84","sxf_age_80_84_m")
sxf_age_85_xx <- get_acs(geography="tract", state="DC", variables=c("B01001_049"), year=2017); colnames(sxf_age_85_xx) <- c("GEOID","NAME","VAR","sxf_age_85_xx","sxf_age_85_xx_m")
# MEDIAN AGE
age_med <- get_acs(geography="tract", state="DC", variables=c("B01002_001E"), year=2017); colnames(age_med) <- c("GEOID","NAME","VAR","age_med","age_med_m")
# PLACE OF BIRTH BY EDUCATIONAL ATTAINMENT IN THE UNITED STATES
edu_tot_xxx <- get_acs(geography="tract", state="DC", variables=c("B06009_001"), year=2017); colnames(edu_tot_xxx) <- c("GEOID","NAME","VAR","edu_tot_xxx","edu_tot_xxx_m")
edu_tot_lhs <- get_acs(geography="tract", state="DC", variables=c("B06009_002"), year=2017); colnames(edu_tot_lhs) <- c("GEOID","NAME","VAR","edu_tot_lhs","edu_tot_lhs_m")
edu_tot_hse <- get_acs(geography="tract", state="DC", variables=c("B06009_003"), year=2017); colnames(edu_tot_hse) <- c("GEOID","NAME","VAR","edu_tot_hse","edu_tot_hse_m")
edu_tot_som <- get_acs(geography="tract", state="DC", variables=c("B06009_004"), year=2017); colnames(edu_tot_som) <- c("GEOID","NAME","VAR","edu_tot_som","edu_tot_som_m")
edu_tot_bac <- get_acs(geography="tract", state="DC", variables=c("B06009_005"), year=2017); colnames(edu_tot_bac) <- c("GEOID","NAME","VAR","edu_tot_bac","edu_tot_bac_m")
edu_tot_grd <- get_acs(geography="tract", state="DC", variables=c("B06009_006"), year=2017); colnames(edu_tot_grd) <- c("GEOID","NAME","VAR","edu_tot_grd","edu_tot_grd_m")
# RACE
rac_tot_xxx <- get_acs(geography="tract", state="DC", variables=c("B02001_001"), year=2017); colnames(rac_tot_xxx) <- c("GEOID","NAME","VAR","rac_tot_xxx","rac_tot_xxx_m")
rac_tot_whi <- get_acs(geography="tract", state="DC", variables=c("B02001_002"), year=2017); colnames(rac_tot_whi) <- c("GEOID","NAME","VAR","rac_tot_whi","rac_tot_whi_m")
rac_tot_baa <- get_acs(geography="tract", state="DC", variables=c("B02001_003"), year=2017); colnames(rac_tot_baa) <- c("GEOID","NAME","VAR","rac_tot_baa","rac_tot_baa_m")
rac_tot_aia <- get_acs(geography="tract", state="DC", variables=c("B02001_004"), year=2017); colnames(rac_tot_aia) <- c("GEOID","NAME","VAR","rac_tot_aia","rac_tot_aia_m")
rac_tot_asn <- get_acs(geography="tract", state="DC", variables=c("B02001_005"), year=2017); colnames(rac_tot_asn) <- c("GEOID","NAME","VAR","rac_tot_asn","rac_tot_asn_m")
rac_tot_npi <- get_acs(geography="tract", state="DC", variables=c("B02001_006"), year=2017); colnames(rac_tot_npi) <- c("GEOID","NAME","VAR","rac_tot_npi","rac_tot_npi_m")
rac_tot_oth <- get_acs(geography="tract", state="DC", variables=c("B02001_007"), year=2017); colnames(rac_tot_oth) <- c("GEOID","NAME","VAR","rac_tot_oth","rac_tot_oth_m")
rac_tot_two <- get_acs(geography="tract", state="DC", variables=c("B02001_008"), year=2017); colnames(rac_tot_two) <- c("GEOID","NAME","VAR","rac_tot_two","rac_tot_two_m")
# HISPANIC OR LATINO ORIGIN BY RACE
lat_tot_xxx <- get_acs(geography="tract", state="DC", variables=c("B03002_012"), year=2017); colnames(lat_tot_xxx) <- c("GEOID","NAME","VAR","lat_tot_xxx","lat_tot_xxx_m")
lat_tot_whi <- get_acs(geography="tract", state="DC", variables=c("B03002_013"), year=2017); colnames(lat_tot_whi) <- c("GEOID","NAME","VAR","lat_tot_whi","lat_tot_whi_m")
lat_tot_baa <- get_acs(geography="tract", state="DC", variables=c("B03002_014"), year=2017); colnames(lat_tot_baa) <- c("GEOID","NAME","VAR","lat_tot_baa","lat_tot_baa_m")
lat_tot_aia <- get_acs(geography="tract", state="DC", variables=c("B03002_015"), year=2017); colnames(lat_tot_aia) <- c("GEOID","NAME","VAR","lat_tot_aia","lat_tot_aia_m")
lat_tot_asn <- get_acs(geography="tract", state="DC", variables=c("B03002_016"), year=2017); colnames(lat_tot_asn) <- c("GEOID","NAME","VAR","lat_tot_asn","lat_tot_asn_m")
lat_tot_npi <- get_acs(geography="tract", state="DC", variables=c("B03002_017"), year=2017); colnames(lat_tot_npi) <- c("GEOID","NAME","VAR","lat_tot_npi","lat_tot_npi_m")
lat_tot_oth <- get_acs(geography="tract", state="DC", variables=c("B03002_018"), year=2017); colnames(lat_tot_oth) <- c("GEOID","NAME","VAR","lat_tot_oth","lat_tot_oth_m")
lat_tot_two <- get_acs(geography="tract", state="DC", variables=c("B03002_019"), year=2017); colnames(lat_tot_two) <- c("GEOID","NAME","VAR","lat_tot_two","lat_tot_two_m")
# HOUSEHOLD SIZE BY VEHICLES AVAILABLE
veh_xx <- get_acs(geography="tract", state="DC", variables=c("B08014_001"), year=2017); colnames(veh_xx) <- c("GEOID","NAME","VAR","veh_xx","veh_xx_m")
veh_00 <- get_acs(geography="tract", state="DC", variables=c("B08014_002"), year=2017); colnames(veh_00) <- c("GEOID","NAME","VAR","veh_00","veh_00_m")
veh_01 <- get_acs(geography="tract", state="DC", variables=c("B08014_003"), year=2017); colnames(veh_01) <- c("GEOID","NAME","VAR","veh_01","veh_01_m")
veh_02 <- get_acs(geography="tract", state="DC", variables=c("B08014_004"), year=2017); colnames(veh_02) <- c("GEOID","NAME","VAR","veh_02","veh_02_m")
veh_03 <- get_acs(geography="tract", state="DC", variables=c("B08014_005"), year=2017); colnames(veh_03) <- c("GEOID","NAME","VAR","veh_03","veh_03_m")
veh_04 <- get_acs(geography="tract", state="DC", variables=c("B08014_006"), year=2017); colnames(veh_04) <- c("GEOID","NAME","VAR","veh_04","veh_04_m")
veh_05 <- get_acs(geography="tract", state="DC", variables=c("B08014_007"), year=2017); colnames(veh_05) <- c("GEOID","NAME","VAR","veh_05","veh_05_m")
# HOUSEHOLD INCOME IN THE PAST 12 MONTHS
inc_xxx_xxx <- get_acs(geography="tract", state="DC", variables=c("B19001_001"), year=2017); colnames(inc_xxx_xxx) <- c("GEOID","NAME","VAR","inc_xxx_xxx","inc_xxx_xxx_m")
inc_000_010 <- get_acs(geography="tract", state="DC", variables=c("B19001_002"), year=2017); colnames(inc_000_010) <- c("GEOID","NAME","VAR","inc_000_010","inc_000_010_m")
inc_010_015 <- get_acs(geography="tract", state="DC", variables=c("B19001_003"), year=2017); colnames(inc_010_015) <- c("GEOID","NAME","VAR","inc_010_015","inc_010_015_m")
inc_015_020 <- get_acs(geography="tract", state="DC", variables=c("B19001_004"), year=2017); colnames(inc_015_020) <- c("GEOID","NAME","VAR","inc_015_020","inc_015_020_m")
inc_020_025 <- get_acs(geography="tract", state="DC", variables=c("B19001_005"), year=2017); colnames(inc_020_025) <- c("GEOID","NAME","VAR","inc_020_025","inc_020_025_m")
inc_025_030 <- get_acs(geography="tract", state="DC", variables=c("B19001_006"), year=2017); colnames(inc_025_030) <- c("GEOID","NAME","VAR","inc_025_030","inc_025_030_m")
inc_030_035 <- get_acs(geography="tract", state="DC", variables=c("B19001_007"), year=2017); colnames(inc_030_035) <- c("GEOID","NAME","VAR","inc_030_035","inc_030_035_m")
inc_035_040 <- get_acs(geography="tract", state="DC", variables=c("B19001_008"), year=2017); colnames(inc_035_040) <- c("GEOID","NAME","VAR","inc_035_040","inc_035_040_m")
inc_040_045 <- get_acs(geography="tract", state="DC", variables=c("B19001_009"), year=2017); colnames(inc_040_045) <- c("GEOID","NAME","VAR","inc_040_045","inc_040_045_m")
inc_045_050 <- get_acs(geography="tract", state="DC", variables=c("B19001_010"), year=2017); colnames(inc_045_050) <- c("GEOID","NAME","VAR","inc_045_050","inc_045_050_m")
inc_050_060 <- get_acs(geography="tract", state="DC", variables=c("B19001_011"), year=2017); colnames(inc_050_060) <- c("GEOID","NAME","VAR","inc_050_060","inc_050_060_m")
inc_060_075 <- get_acs(geography="tract", state="DC", variables=c("B19001_012"), year=2017); colnames(inc_060_075) <- c("GEOID","NAME","VAR","inc_060_075","inc_060_075_m")
inc_075_100 <- get_acs(geography="tract", state="DC", variables=c("B19001_013"), year=2017); colnames(inc_075_100) <- c("GEOID","NAME","VAR","inc_075_100","inc_075_100_m")
inc_100_125 <- get_acs(geography="tract", state="DC", variables=c("B19001_014"), year=2017); colnames(inc_100_125) <- c("GEOID","NAME","VAR","inc_100_125","inc_100_125_m")
inc_125_150 <- get_acs(geography="tract", state="DC", variables=c("B19001_015"), year=2017); colnames(inc_125_150) <- c("GEOID","NAME","VAR","inc_125_150","inc_125_150_m")
inc_150_200 <- get_acs(geography="tract", state="DC", variables=c("B19001_016"), year=2017); colnames(inc_150_200) <- c("GEOID","NAME","VAR","inc_150_200","inc_150_200_m")
inc_200_XXX <- get_acs(geography="tract", state="DC", variables=c("B19001_017"), year=2017); colnames(inc_200_XXX) <- c("GEOID","NAME","VAR","inc_200_xxx","inc_200_xxx_m")
# MEDIAN HOUSEHOLD INCOME
inc_med <- get_acs(geography="tract", state="DC", variables=c("B19013_001"), year=2017); colnames(inc_med) <- c("GEOID","NAME","VAR","inc_med","inc_med_m")
# TOTAL POPULATION IN OCCUPIED HOUSING UNITS BY TENURE
ten_xxx <- get_acs(geography="tract", state="DC", variables=c("B25002_001"), year=2017); colnames(ten_xxx) <- c("GEOID","NAME","VAR","ten_xxx","ten_xxx_m")
ten_occ <- get_acs(geography="tract", state="DC", variables=c("B25002_002"), year=2017); colnames(ten_occ) <- c("GEOID","NAME","VAR","ten_occ","ten_occ_m")
ten_vac <- get_acs(geography="tract", state="DC", variables=c("B25002_003"), year=2017); colnames(ten_vac) <- c("GEOID","NAME","VAR","ten_vac","ten_vac_m")
ten_own <- get_acs(geography="tract", state="DC", variables=c("B25003_002"), year=2017); colnames(ten_own) <- c("GEOID","NAME","VAR","ten_own","ten_own_m")
ten_rnt <- get_acs(geography="tract", state="DC", variables=c("B25003_003"), year=2017); colnames(ten_rnt) <- c("GEOID","NAME","VAR","ten_rnt","ten_rnt_m")
# AVERAGE HOUSEHOLD SIZE OF OCCUPIED HOUSING UNITS BY TENURE
sze_xxx <- get_acs(geography="tract", state="DC", variables=c("B25010_001"), year=2017); colnames(sze_xxx) <- c("GEOID","NAME","VAR","sze_xxx","sze_xxx_m")
sze_own <- get_acs(geography="tract", state="DC", variables=c("B25010_002"), year=2017); colnames(sze_own) <- c("GEOID","NAME","VAR","sze_own","sze_own_m")
sze_rnt <- get_acs(geography="tract", state="DC", variables=c("B25010_003"), year=2017); colnames(sze_rnt) <- c("GEOID","NAME","VAR","sze_rnt","sze_rnt_m")

### Socioeconomic Variable Categorizing

# POPULATION
pop <- pop_tot[,c(1:2,4)]
rm(pop_tot)
# AGE
age <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE),
              list(sxm_age_xx_xx,sxm_age_xx_04,sxm_age_05_09,sxm_age_10_14,sxm_age_15_17,sxm_age_18_19,sxm_age_20_20,sxm_age_21_21,sxm_age_22_24,sxm_age_25_29,
                   sxm_age_30_34,sxm_age_35_39,sxm_age_40_44,sxm_age_45_49,sxm_age_50_54,sxm_age_55_59,sxm_age_60_61,sxm_age_62_64,sxm_age_65_66,sxm_age_67_69,
                   sxm_age_70_74,sxm_age_75_79,sxm_age_80_84,sxm_age_85_xx,
                   sxf_age_xx_xx,sxf_age_xx_04,sxf_age_05_09,sxf_age_10_14,sxf_age_15_17,sxf_age_18_19,sxf_age_20_20,sxf_age_21_21,sxf_age_22_24,sxf_age_25_29,
                   sxf_age_30_34,sxf_age_35_39,sxf_age_40_44,sxf_age_45_49,sxf_age_50_54,sxf_age_55_59,sxf_age_60_61,sxf_age_62_64,sxf_age_65_66,sxf_age_67_69,
                   sxf_age_70_74,sxf_age_75_79,sxf_age_80_84,sxf_age_85_xx,age_med))
age <- age[,c(1,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,
              132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196)]
rm(sxm_age_xx_xx,sxm_age_xx_04,sxm_age_05_09,sxm_age_10_14,sxm_age_15_17,sxm_age_18_19,sxm_age_20_20,sxm_age_21_21,sxm_age_22_24,sxm_age_25_29,
   sxm_age_30_34,sxm_age_35_39,sxm_age_40_44,sxm_age_45_49,sxm_age_50_54,sxm_age_55_59,sxm_age_60_61,sxm_age_62_64,sxm_age_65_66,sxm_age_67_69,
   sxm_age_70_74,sxm_age_75_79,sxm_age_80_84,sxm_age_85_xx,
   sxf_age_xx_xx,sxf_age_xx_04,sxf_age_05_09,sxf_age_10_14,sxf_age_15_17,sxf_age_18_19,sxf_age_20_20,sxf_age_21_21,sxf_age_22_24,sxf_age_25_29,
   sxf_age_30_34,sxf_age_35_39,sxf_age_40_44,sxf_age_45_49,sxf_age_50_54,sxf_age_55_59,sxf_age_60_61,sxf_age_62_64,sxf_age_65_66,sxf_age_67_69,
   sxf_age_70_74,sxf_age_75_79,sxf_age_80_84,sxf_age_85_xx,age_med)
# EDUCATION
edu <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(edu_tot_xxx,edu_tot_lhs,edu_tot_hse,edu_tot_som,edu_tot_bac,edu_tot_grd))
edu <- edu[,c(1,4,8,12,16,20,24)]
rm(edu_tot_xxx,edu_tot_lhs,edu_tot_hse,edu_tot_som,edu_tot_bac,edu_tot_grd)
# RACE
rac <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(rac_tot_xxx,rac_tot_whi,rac_tot_baa,rac_tot_aia,rac_tot_asn,rac_tot_npi,rac_tot_oth,rac_tot_two))
rac <- rac[,c(1,4,8,12,16,20,24,28,32)]
rm(rac_tot_xxx,rac_tot_whi,rac_tot_baa,rac_tot_aia,rac_tot_asn,rac_tot_npi,rac_tot_oth,rac_tot_two)
# HISPANIC OR LATINO ORIGIN
lat <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(lat_tot_xxx,lat_tot_whi,lat_tot_baa,lat_tot_aia,lat_tot_asn,lat_tot_npi,lat_tot_oth,lat_tot_two))
lat <- lat[,c(1,4,8,12,16,20,24,28,32)]
rm(lat_tot_xxx,lat_tot_whi,lat_tot_baa,lat_tot_aia,lat_tot_asn,lat_tot_npi,lat_tot_oth,lat_tot_two)
# HOUSEHOLD VEHICLES
veh <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(veh_xx,veh_00,veh_01,veh_02,veh_03,veh_04,veh_05))
veh <- veh[,c(1,4,8,12,16,20,24,28)]
rm(veh_xx,veh_00,veh_01,veh_02,veh_03,veh_04,veh_05)
# HOUSEHOLD INCOME
inc <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE),
              list(inc_xxx_xxx,inc_000_010,inc_010_015,inc_015_020,inc_020_025,inc_025_030,inc_030_035,inc_035_040,inc_040_045,
                   inc_045_050,inc_050_060,inc_060_075,inc_075_100,inc_100_125,inc_125_150,inc_150_200,inc_200_XXX,inc_med))
inc <- inc[,c(1,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72)]
rm(inc_xxx_xxx,inc_000_010,inc_010_015,inc_015_020,inc_020_025,inc_025_030,inc_030_035,inc_035_040,inc_040_045,
   inc_045_050,inc_050_060,inc_060_075,inc_075_100,inc_100_125,inc_125_150,inc_150_200,inc_200_XXX,inc_med)
# TENURE
ten <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(ten_xxx,ten_occ,ten_vac,ten_own,ten_rnt))
ten <- ten[,c(1,4,8,12,16,20)]
rm(ten_xxx,ten_occ,ten_vac,ten_own,ten_rnt)
# HOUSEHOLD SIZE
sze <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(sze_xxx,sze_own,sze_rnt))
sze <- sze[,c(1,4,8,12)]
rm(sze_xxx,sze_own,sze_rnt)

# Merge data files
dat_ses <- Reduce(function(x, y) merge(x, y, by="GEOID", all=TRUE), list(pop,age,edu,rac,lat,veh,inc,ten,sze))
colnames(dat_ses)[1] <- "tract"
rm(pop,age,edu,rac,lat,veh,inc,ten,sze,vars)

### Socioeconomic Variable Creation

# POPULATION
dat_ses$ct_pop_tot <- dat_ses$pop_tot
summary(dat_ses$ct_pop_tot)
# SEX DISTRIBUTION
dat_ses$ct_sex_m <- dat_ses$sxm_age_xx_xx
dat_ses$ct_sexp_m <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_xx_xx/dat_ses$pop_tot, 0)
summary(dat_ses$ct_sexp_m) # Sex: Male
dat_ses$ct_sex_f <- dat_ses$sxf_age_xx_xx
dat_ses$ct_sexp_f <- ifelse(dat_ses$pop_tot>0, dat_ses$sxf_age_xx_xx/dat_ses$pop_tot, 0)
summary(dat_ses$ct_sexp_f) # Sex: Female
# AGE DISTRIBUTION
dat_ses$ct_age_xx_17 <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_xx_04 + dat_ses$sxm_age_05_09 + dat_ses$sxm_age_10_14 + dat_ses$sxm_age_15_17 +
                                  dat_ses$sxf_age_xx_04 + dat_ses$sxf_age_05_09 + dat_ses$sxf_age_10_14 + dat_ses$sxf_age_15_17, 0)
summary(dat_ses$ct_age_xx_17) # Age: Under 18 years
dat_ses$ct_agep_xx_17 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_xx_17/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_xx_17) 
dat_ses$ct_age_18_34 <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_18_19 + dat_ses$sxm_age_20_20 + dat_ses$sxm_age_21_21 + dat_ses$sxm_age_22_24 + dat_ses$sxm_age_25_29 + dat_ses$sxm_age_30_34 +
                                  dat_ses$sxf_age_18_19 + dat_ses$sxf_age_20_20 + dat_ses$sxf_age_21_21 + dat_ses$sxf_age_22_24 + dat_ses$sxf_age_25_29 + dat_ses$sxf_age_30_34, 0)
summary(dat_ses$ct_age_18_34) # Age: 18 to 34 years
dat_ses$ct_agep_18_34 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_18_34/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_18_34)
dat_ses$ct_age_35_44 <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_35_39 + dat_ses$sxm_age_40_44 + dat_ses$sxf_age_35_39 + dat_ses$sxf_age_40_44, 0)
summary(dat_ses$ct_age_35_44) # Age: 35 to 44 years
dat_ses$ct_agep_35_44 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_35_44/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_35_44) 
dat_ses$ct_age_45_64 <- ifelse(dat_ses$pop_tot>0, dat_ses$sxm_age_45_49 + dat_ses$sxm_age_50_54 + dat_ses$sxm_age_55_59 + dat_ses$sxm_age_60_61 + dat_ses$sxm_age_62_64 +
                                  dat_ses$sxf_age_45_49 + dat_ses$sxf_age_50_54 + dat_ses$sxf_age_55_59 + dat_ses$sxf_age_60_61 + dat_ses$sxf_age_62_64, 0)
summary(dat_ses$ct_age_45_64) # Age: 45 to 64 years
dat_ses$ct_agep_45_64 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_45_64/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_45_64) 
dat_ses$ct_age_65_xx <- ifelse(dat_ses$pop_tot>0,
                               dat_ses$sxm_age_65_66 + dat_ses$sxm_age_67_69 + dat_ses$sxm_age_70_74 + dat_ses$sxm_age_75_79 + dat_ses$sxm_age_80_84 + dat_ses$sxm_age_85_xx +
                                  dat_ses$sxf_age_65_66 + dat_ses$sxf_age_67_69 + dat_ses$sxf_age_70_74 + dat_ses$sxf_age_75_79 + dat_ses$sxf_age_80_84 + dat_ses$sxf_age_85_xx, 0)
summary(dat_ses$ct_age_65_xx) # Age: Over 64 years
dat_ses$ct_agep_65_xx <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_age_65_xx/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_agep_65_xx) 
dat_ses$ct_age_med <- ifelse(dat_ses$pop_tot>0, dat_ses$age_med, 0)
dat_ses$ct_age_med[is.na(dat_ses$ct_age_med)] <- 0
summary(dat_ses$ct_age_med) # Age: Median
# EDUCATION DISTRIBUTION
dat_ses$ct_edu_1 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_lhs + dat_ses$edu_tot_hse + dat_ses$edu_tot_som, 0)
summary(dat_ses$ct_edu_1) # Education: Less than bachelor's degree
dat_ses$ct_edup_1 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_1/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_1) 
dat_ses$ct_edu_2 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_bac, 0)
summary(dat_ses$ct_edu_2) # Education: Bachelor's degree
dat_ses$ct_edup_2 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_2/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_2) 
dat_ses$ct_edu_3 <- ifelse(dat_ses$pop_tot>0, dat_ses$edu_tot_grd, 0)
summary(dat_ses$ct_edu_3) # Education: Graduate degree
dat_ses$ct_edup_3 <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_edu_3/dat_ses$pop_tot, 0) 
summary(dat_ses$ct_edup_3) 
# RACE/ETHNICITY DISTRIBUTION
dat_ses$ct_rac_whi <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_whi - dat_ses$lat_tot_whi, 0)
summary(dat_ses$ct_rac_whi) # Race/Ethnicity: White (non-Hispanic)
dat_ses$ct_racp_whi <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_whi/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_whi)
dat_ses$ct_rac_lat <- ifelse(dat_ses$pop_tot>0, dat_ses$lat_tot_whi, 0)
summary(dat_ses$ct_rac_lat) # Race/Ethnicity: Latino
dat_ses$ct_racp_lat <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_lat/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_lat)
dat_ses$ct_rac_baa <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_baa, 0)
summary(dat_ses$ct_rac_baa) # Race/Ethnicity: Black or African American
dat_ses$ct_racp_baa <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_baa/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_baa)
dat_ses$ct_rac_asn <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_asn, 0)
summary(dat_ses$ct_rac_asn) # Race/Ethnicity: Asian American
dat_ses$ct_racp_asn <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_asn/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_asn)
dat_ses$ct_rac_oth <- ifelse(dat_ses$pop_tot>0, dat_ses$rac_tot_aia + dat_ses$rac_tot_npi + dat_ses$rac_tot_oth + dat_ses$rac_tot_two, 0)
summary(dat_ses$ct_rac_oth) # Race/Ethnicity: Other
dat_ses$ct_racp_oth <- ifelse(dat_ses$pop_tot>0, dat_ses$ct_rac_oth/dat_ses$pop_tot, 0)
summary(dat_ses$ct_racp_oth)
# HOUSEHOLD VEHICLE DISTRIBUTION
dat_ses$ct_veh_0 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_00, 0)
summary(dat_ses$ct_veh_0) # Household vehicles: 0
dat_ses$ct_vehp_0 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_0/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_0) 
dat_ses$ct_veh_1 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_01, 0)
summary(dat_ses$ct_veh_1) # Household vehicles: 1
dat_ses$ct_vehp_1 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_1/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_1) 
dat_ses$ct_veh_2 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_02, 0)
summary(dat_ses$ct_veh_2) # Household vehicles: 2
dat_ses$ct_vehp_2 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_2/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_2) 
dat_ses$ct_veh_3 <- ifelse(dat_ses$veh_xx>0, dat_ses$veh_03 + dat_ses$veh_04 + dat_ses$veh_05, 0)
summary(dat_ses$ct_veh_3) # Household vehicles: 3
dat_ses$ct_vehp_3 <- ifelse(dat_ses$veh_xx>0, dat_ses$ct_veh_3/dat_ses$veh_xx, 0) 
summary(dat_ses$ct_vehp_3) 
# HOUSEHOLD INCOME DISTRIBUTION
dat_ses$ct_inc_xxx_035 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_000_010 + dat_ses$inc_010_015 + dat_ses$inc_015_020 + dat_ses$inc_020_025 +
                                    dat_ses$inc_025_030 + dat_ses$inc_030_035, 0)
summary(dat_ses$ct_inc_xxx_035) # Household income: Less than $35,000
dat_ses$ct_incp_xxx_035 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_xxx_035/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_xxx_035)
dat_ses$ct_inc_035_075 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_035_040 + dat_ses$inc_040_045 + dat_ses$inc_045_050 + dat_ses$inc_050_060 + dat_ses$inc_060_075, 0)
summary(dat_ses$ct_inc_035_075) # Household income: $35,000 to $74,999
dat_ses$ct_incp_035_075 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_035_075/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_035_075)
dat_ses$ct_inc_075_150 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_075_100 + dat_ses$inc_100_125 + dat_ses$inc_125_150, 0)
summary(dat_ses$ct_inc_075_150) # Household income: $75,000 to $149,999
dat_ses$ct_incp_075_150 <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_075_150/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_075_150)
dat_ses$ct_inc_150_xxx <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_150_200 + dat_ses$inc_200_xxx, 0)
summary(dat_ses$ct_inc_150_xxx) # Household income: $150,000 and up
dat_ses$ct_incp_150_xxx <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$ct_inc_150_xxx/dat_ses$inc_xxx_xxx, 0)
summary(dat_ses$ct_incp_150_xxx)
dat_ses$ct_inc_med <- ifelse(dat_ses$inc_xxx_xxx>0, dat_ses$inc_med, 0)
dat_ses$ct_inc_med[is.na(dat_ses$ct_inc_med)] <- 0
summary(dat_ses$ct_inc_med) # Household income: Median
# TENURE DISTRIBUTION
dat_ses$ct_ten_own <- dat_ses$ten_own
dat_ses$ct_tenp_own <- ifelse(dat_ses$ten_xxx>0, dat_ses$ten_own/dat_ses$ten_occ, 0)
summary(dat_ses$ct_tenp_own) # Household tenure: Owners
dat_ses$ct_ten_rnt <- dat_ses$ten_rnt
dat_ses$ct_tenp_rnt <- ifelse(dat_ses$ten_xxx>0, dat_ses$ten_rnt/dat_ses$ten_occ, 0)
summary(dat_ses$ct_tenp_rnt) # Household tenure: Renters
# HOUSEHOLD SIZE BY TENURE
dat_ses$ct_sze_own <- ifelse(dat_ses$pop_tot>0, dat_ses$sze_own, 0)
dat_ses$ct_sze_own[is.na(dat_ses$ct_sze_own)] <- 0
summary(dat_ses$ct_sze_own) # Household size: Median for owners
dat_ses$ct_sze_rnt <- ifelse(dat_ses$pop_tot>0, dat_ses$sze_rnt, 0)
dat_ses$ct_sze_rnt[is.na(dat_ses$ct_sze_rnt)] <- 0
summary(dat_ses$ct_sze_rnt) # Household size: Median for renters

### Neighborhood: Socioeconomic Variable Export

# Reduce and export neighborhood data set
colnames(dat_ses)
dat_ses2 <- dat_ses[,c(1,108:162)]
colnames(dat_ses2)
dc_dat2 <- Reduce(function(x, y) merge(x, y, by="tract", all.x=TRUE), list(dc_dat,dat_ses2))
write_csv(dc_dat2, paste(dc_dir, "dc_uber_02_nhood_ses.csv" , sep="_processed/"))
rm(dat_ses,dat_ses2)

### END OF SCRIPT
