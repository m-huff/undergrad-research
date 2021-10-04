### ACS DATA MANIPULATOR ###
### MICHAEL HUFF ###

# Load libraries
packages <- c("data.table","tidyverse","tidycensus","tigris")
lapply(packages, require, character.only=TRUE); rm(packages)

# Set ACS API key and review variables
census_api_key("c56d5e0f0945fe0e6b0f681269a98a91bf815eeb", install=TRUE, overwrite=TRUE); readRenviron("~/.Renviron")
vars <- load_variables(2019, "acs5", cache=TRUE)

# TOTAL POPULATION
pop_tot <- get_acs(geography="zcta", variables=c("B01001_001"), year=2019)[,4]; colnames(pop_tot) <- "pop_tot"

# COUNT OF AGE - MALE
m_age_xx_xx <- get_acs(geography="zcta", variables=c("B01001_002"), year=2019)[,c(1,4)]; colnames(m_age_xx_xx) <- c("zcta","m_age_xx_xx")
m_age_xx_04 <- get_acs(geography="zcta", variables=c("B01001_003"), year=2019)[,4]; colnames(m_age_xx_04) <- "m_age_xx_04"
m_age_05_09 <- get_acs(geography="zcta", variables=c("B01001_004"), year=2019)[,4]; colnames(m_age_05_09) <- "m_age_05_09"
m_age_10_14 <- get_acs(geography="zcta", variables=c("B01001_005"), year=2019)[,4]; colnames(m_age_10_14) <- "m_age_10_14"
m_age_15_17 <- get_acs(geography="zcta", variables=c("B01001_006"), year=2019)[,4]; colnames(m_age_15_17) <- "m_age_15_17"
m_age_18_19 <- get_acs(geography="zcta", variables=c("B01001_007"), year=2019)[,4]; colnames(m_age_18_19) <- "m_age_18_19"
m_age_20 <- get_acs(geography="zcta", variables=c("B01001_008"), year=2019)[,4]; colnames(m_age_20) <- "m_age_20"
m_age_21 <- get_acs(geography="zcta", variables=c("B01001_009"), year=2019)[,4]; colnames(m_age_21) <- "m_age_21"
m_age_22_24 <- get_acs(geography="zcta", variables=c("B01001_010"), year=2019)[,4]; colnames(m_age_22_24) <- "m_age_22_24"
m_age_25_29 <- get_acs(geography="zcta", variables=c("B01001_011"), year=2019)[,4]; colnames(m_age_25_29) <- "m_age_25_29"
m_age_30_34 <- get_acs(geography="zcta", variables=c("B01001_012"), year=2019)[,4]; colnames(m_age_30_34) <- "m_age_30_34"
m_age_35_39 <- get_acs(geography="zcta", variables=c("B01001_013"), year=2019)[,4]; colnames(m_age_35_39) <- "m_age_35_39"
m_age_40_44 <- get_acs(geography="zcta", variables=c("B01001_014"), year=2019)[,4]; colnames(m_age_40_44) <- "m_age_40_44"
m_age_45_49 <- get_acs(geography="zcta", variables=c("B01001_015"), year=2019)[,4]; colnames(m_age_45_49) <- "m_age_45_49"
m_age_50_54 <- get_acs(geography="zcta", variables=c("B01001_016"), year=2019)[,4]; colnames(m_age_50_54) <- "m_age_50_54"
m_age_55_59 <- get_acs(geography="zcta", variables=c("B01001_017"), year=2019)[,4]; colnames(m_age_55_59) <- "m_age_55_59"
m_age_60_61 <- get_acs(geography="zcta", variables=c("B01001_018"), year=2019)[,4]; colnames(m_age_60_61) <- "m_age_60_61"
m_age_62_64 <- get_acs(geography="zcta", variables=c("B01001_019"), year=2019)[,4]; colnames(m_age_62_64) <- "m_age_62_64"
m_age_65_66 <- get_acs(geography="zcta", variables=c("B01001_020"), year=2019)[,4]; colnames(m_age_65_66) <- "m_age_65_66"
m_age_67_69 <- get_acs(geography="zcta", variables=c("B01001_021"), year=2019)[,4]; colnames(m_age_67_69) <- "m_age_67_69"
m_age_70_74 <- get_acs(geography="zcta", variables=c("B01001_022"), year=2019)[,4]; colnames(m_age_70_74) <- "m_age_70_74"
m_age_75_79 <- get_acs(geography="zcta", variables=c("B01001_023"), year=2019)[,4]; colnames(m_age_75_79) <- "m_age_75_79"
m_age_80_84 <- get_acs(geography="zcta", variables=c("B01001_024"), year=2019)[,4]; colnames(m_age_80_84) <- "m_age_80_84"
m_age_85_xx <- get_acs(geography="zcta", variables=c("B01001_025"), year=2019)[,4]; colnames(m_age_85_xx) <- "m_age_85_xx"

# COUNT OF AGE - FEMALE
f_age_xx_xx <- get_acs(geography="zcta", variables=c("B01001_026"), year=2019)[,4]; colnames(f_age_xx_xx) <- "f_age_xx_xx"
f_age_xx_04 <- get_acs(geography="zcta", variables=c("B01001_027"), year=2019)[,4]; colnames(f_age_xx_04) <- "f_age_xx_04"
f_age_05_09 <- get_acs(geography="zcta", variables=c("B01001_028"), year=2019)[,4]; colnames(f_age_05_09) <- "f_age_05_09"
f_age_10_14 <- get_acs(geography="zcta", variables=c("B01001_029"), year=2019)[,4]; colnames(f_age_10_14) <- "f_age_10_14"
f_age_15_17 <- get_acs(geography="zcta", variables=c("B01001_030"), year=2019)[,4]; colnames(f_age_15_17) <- "f_age_15_17"
f_age_18_19 <- get_acs(geography="zcta", variables=c("B01001_031"), year=2019)[,4]; colnames(f_age_18_19) <- "f_age_18_19"
f_age_20 <- get_acs(geography="zcta", variables=c("B01001_032"), year=2019)[,4]; colnames(f_age_20) <- "f_age_20"
f_age_21 <- get_acs(geography="zcta", variables=c("B01001_033"), year=2019)[,4]; colnames(f_age_21) <- "f_age_21"
f_age_22_24 <- get_acs(geography="zcta", variables=c("B01001_034"), year=2019)[,4]; colnames(f_age_22_24) <- "f_age_22_24"
f_age_25_29 <- get_acs(geography="zcta", variables=c("B01001_035"), year=2019)[,4]; colnames(f_age_25_29) <- "f_age_25_29"
f_age_30_34 <- get_acs(geography="zcta", variables=c("B01001_036"), year=2019)[,4]; colnames(f_age_30_34) <- "f_age_30_34"
f_age_35_39 <- get_acs(geography="zcta", variables=c("B01001_037"), year=2019)[,4]; colnames(f_age_35_39) <- "f_age_35_39"
f_age_40_44 <- get_acs(geography="zcta", variables=c("B01001_038"), year=2019)[,4]; colnames(f_age_40_44) <- "f_age_40_44"
f_age_45_49 <- get_acs(geography="zcta", variables=c("B01001_039"), year=2019)[,4]; colnames(f_age_45_49) <- "f_age_45_49"
f_age_50_54 <- get_acs(geography="zcta", variables=c("B01001_040"), year=2019)[,4]; colnames(f_age_50_54) <- "f_age_50_54"
f_age_55_59 <- get_acs(geography="zcta", variables=c("B01001_041"), year=2019)[,4]; colnames(f_age_55_59) <- "f_age_55_59"
f_age_60_61 <- get_acs(geography="zcta", variables=c("B01001_042"), year=2019)[,4]; colnames(f_age_60_61) <- "f_age_60_61"
f_age_62_64 <- get_acs(geography="zcta", variables=c("B01001_043"), year=2019)[,4]; colnames(f_age_62_64) <- "f_age_62_64"
f_age_65_66 <- get_acs(geography="zcta", variables=c("B01001_044"), year=2019)[,4]; colnames(f_age_65_66) <- "f_age_65_66"
f_age_67_69 <- get_acs(geography="zcta", variables=c("B01001_045"), year=2019)[,4]; colnames(f_age_67_69) <- "f_age_67_69"
f_age_70_74 <- get_acs(geography="zcta", variables=c("B01001_046"), year=2019)[,4]; colnames(f_age_70_74) <- "f_age_70_74"
f_age_75_79 <- get_acs(geography="zcta", variables=c("B01001_047"), year=2019)[,4]; colnames(f_age_75_79) <- "f_age_75_79"
f_age_80_84 <- get_acs(geography="zcta", variables=c("B01001_048"), year=2019)[,4]; colnames(f_age_80_84) <- "f_age_80_84"
f_age_85_xx <- get_acs(geography="zcta", variables=c("B01001_049"), year=2019)[,4]; colnames(f_age_85_xx) <- "f_age_85_xx"

# COUNT OF RACE
rac_tot <- get_acs(geography="zcta", variables=c("B02001_001"), year=2019)[,4]; colnames(rac_tot) <- "rac_tot"
rac_tot_wh <- get_acs(geography="zcta", variables=c("B02001_002"), year=2019)[,4]; colnames(rac_tot_wh) <- "rac_tot_wh"
rac_tot_ba <- get_acs(geography="zcta", variables=c("B02001_003"), year=2019)[,4]; colnames(rac_tot_ba) <- "rac_tot_ba"
rac_tot_ai <- get_acs(geography="zcta", variables=c("B02001_004"), year=2019)[,4]; colnames(rac_tot_ai) <- "rac_tot_ai"
rac_tot_as <- get_acs(geography="zcta", variables=c("B02001_005"), year=2019)[,4]; colnames(rac_tot_as) <- "rac_tot_as"
rac_tot_nh <- get_acs(geography="zcta", variables=c("B02001_006"), year=2019)[,4]; colnames(rac_tot_nh) <- "rac_tot_nh"

# COUNT OF LATINO RACE
lat_tot_xxx <- get_acs(geography="zcta", variables=c("B03002_012"), year=2019)[,4]; colnames(lat_tot_xxx) <- "lat_tot_xxx"
lat_tot_whi <- get_acs(geography="zcta", variables=c("B03002_013"), year=2019)[,4]; colnames(lat_tot_whi) <- "lat_tot_whi"
lat_tot_baa <- get_acs(geography="zcta", variables=c("B03002_014"), year=2019)[,4]; colnames(lat_tot_baa) <- "lat_tot_baa"
lat_tot_aia <- get_acs(geography="zcta", variables=c("B03002_015"), year=2019)[,4]; colnames(lat_tot_aia) <- "lat_tot_aia"
lat_tot_asn <- get_acs(geography="zcta", variables=c("B03002_016"), year=2019)[,4]; colnames(lat_tot_asn) <- "lat_tot_asn"
lat_tot_npi <- get_acs(geography="zcta", variables=c("B03002_017"), year=2019)[,4]; colnames(lat_tot_npi) <- "lat_tot_npi"
lat_tot_oth <- get_acs(geography="zcta", variables=c("B03002_018"), year=2019)[,4]; colnames(lat_tot_oth) <- "lat_tot_oth"
lat_tot_two <- get_acs(geography="zcta", variables=c("B03002_019"), year=2019)[,4]; colnames(lat_tot_two) <- "lat_tot_two"


# COUNT OF EDUCATIONAL STATUS
edu_tot <- get_acs(geography="zcta", variables=c("B06009_001"), year=2019)[,4]; colnames(edu_tot) <- "edu_tot"
edu_tot_lhs <- get_acs(geography="zcta", variables=c("B06009_002"), year=2019)[,4]; colnames(edu_tot_lhs) <- "edu_tot_lhs"
edu_tot_hse <- get_acs(geography="zcta", variables=c("B06009_003"), year=2019)[,4]; colnames(edu_tot_hse) <- "edu_tot_hse"
edu_tot_sca <- get_acs(geography="zcta", variables=c("B06009_004"), year=2019)[,4]; colnames(edu_tot_sca) <- "edu_tot_sca"
edu_tot_bch <- get_acs(geography="zcta", variables=c("B06009_005"), year=2019)[,4]; colnames(edu_tot_bch) <- "edu_tot_bch"
edu_tot_grd <- get_acs(geography="zcta", variables=c("B06009_006"), year=2019)[,4]; colnames(edu_tot_grd) <- "edu_tot_grd"

# COUNT OF INCOME
inc_xxx_xxx <- get_acs(geography="zcta", variables=c("B19001_001"), year=2019)[,4]; colnames(inc_xxx_xxx) <- "inc_xxx_xxx"
inc_xxx_010 <- get_acs(geography="zcta", variables=c("B19001_002"), year=2019)[,4]; colnames(inc_xxx_010) <- "inc_xxx_010"
inc_010_015 <- get_acs(geography="zcta", variables=c("B19001_003"), year=2019)[,4]; colnames(inc_010_015) <- "inc_010_015"
inc_015_020 <- get_acs(geography="zcta", variables=c("B19001_004"), year=2019)[,4]; colnames(inc_015_020) <- "inc_015_020"
inc_020_025 <- get_acs(geography="zcta", variables=c("B19001_005"), year=2019)[,4]; colnames(inc_020_025) <- "inc_020_025"
inc_025_030 <- get_acs(geography="zcta", variables=c("B19001_006"), year=2019)[,4]; colnames(inc_025_030) <- "inc_025_030"
inc_030_035 <- get_acs(geography="zcta", variables=c("B19001_007"), year=2019)[,4]; colnames(inc_030_035) <- "inc_030_035"
inc_035_040 <- get_acs(geography="zcta", variables=c("B19001_008"), year=2019)[,4]; colnames(inc_035_040) <- "inc_035_040"
inc_040_045 <- get_acs(geography="zcta", variables=c("B19001_009"), year=2019)[,4]; colnames(inc_040_045) <- "inc_040_045"
inc_045_050 <- get_acs(geography="zcta", variables=c("B19001_010"), year=2019)[,4]; colnames(inc_045_050) <- "inc_045_050"
inc_050_060 <- get_acs(geography="zcta", variables=c("B19001_011"), year=2019)[,4]; colnames(inc_050_060) <- "inc_050_060"
inc_060_075 <- get_acs(geography="zcta", variables=c("B19001_012"), year=2019)[,4]; colnames(inc_060_075) <- "inc_060_075"
inc_075_100 <- get_acs(geography="zcta", variables=c("B19001_013"), year=2019)[,4]; colnames(inc_075_100) <- "inc_075_100"
inc_100_125 <- get_acs(geography="zcta", variables=c("B19001_014"), year=2019)[,4]; colnames(inc_100_125) <- "inc_100_125"
inc_125_150 <- get_acs(geography="zcta", variables=c("B19001_015"), year=2019)[,4]; colnames(inc_125_150) <- "inc_125_150"
inc_150_200 <- get_acs(geography="zcta", variables=c("B19001_016"), year=2019)[,4]; colnames(inc_150_200) <- "inc_150_200"
inc_200_xxx <- get_acs(geography="zcta", variables=c("B19001_017"), year=2019)[,4]; colnames(inc_200_xxx) <- "inc_200_xxx"

dat_acs <- data.frame(m_age_xx_xx$zcta)
colnames(dat_acs)[1] <- "zcta"

dat_acs$ct_pop_tot <- pop_tot
dat_acs$ct_sex_m <- m_age_xx_xx[,2]
dat_acs$ct_sex_f <- f_age_xx_xx

dat_acs$ct_age_xx_17 <- (m_age_xx_04 + m_age_05_09 + m_age_10_14 + m_age_15_17 + f_age_xx_04 + f_age_05_09 + f_age_10_14 + f_age_15_17)
dat_acs$ct_age_18_34 <- (m_age_18_19 + m_age_20 + m_age_21 + m_age_22_24 + m_age_25_29 + m_age_30_34 + f_age_18_19 + f_age_20 + f_age_21 + f_age_22_24 + f_age_25_29 + f_age_30_34)
dat_acs$ct_age_35_44 <- (m_age_35_39 + m_age_40_44 + f_age_35_39 + f_age_40_44)
dat_acs$ct_age_45_64 <- (m_age_45_49 + m_age_50_54 + m_age_55_59 + m_age_60_61 + m_age_62_64 + f_age_45_49 + f_age_50_54 + f_age_55_59 + f_age_60_61 + f_age_62_64)
dat_acs$ct_age_65_xx <- (m_age_65_66 + m_age_67_69 + m_age_70_74 + m_age_75_79 + m_age_80_84 + m_age_85_xx + f_age_65_66 + f_age_67_69 + f_age_70_74 + f_age_75_79 + f_age_80_84 + f_age_85_xx)

dat_acs$ct_edu_1 <- (edu_tot_lhs + edu_tot_hse + edu_tot_sca)
dat_acs$ct_edu_2 <- (edu_tot_bch)
dat_acs$ct_edu_3 <- (edu_tot_grd)

dat_acs$ct_rac_whi <- (rac_tot_wh - lat_tot_whi)
dat_acs$ct_rac_lat <- (lat_tot_whi)
dat_acs$ct_rac_baa <- (rac_tot_ba)
dat_acs$ct_rac_asn <- (rac_tot_as)
dat_acs$ct_rac_aia <- (rac_tot_ai)
dat_acs$ct_rac_npi <- (rac_tot_nh)

dat_acs$ct_inc_xxx_035 <- (inc_xxx_010 + inc_010_015 + inc_015_020 + inc_020_025 + inc_025_030 + inc_030_035)
dat_acs$ct_inc_035_075 <- (inc_035_040 + inc_040_045 + inc_045_050 + inc_050_060 + inc_060_075)
dat_acs$ct_inc_075_150 <- (inc_075_100 + inc_100_125 + inc_125_150)
dat_acs$ct_inc_150_xxx <- (inc_150_200 + inc_200_xxx)

colnames(dat_acs) <- c("zcta","pop_tot","ct_male","ct_female","ct_age_xx_17","ct_age_18_34","ct_age_35_44","ct_age_45_64",
                       "ct_age_65_xx","ct_edu_1","ct_edu_2","ct_edu_3","ct_rac_whi","ct_rac_lat","ct_rac_baa","ct_rac_asn",
                       "ct_rac_aia","ct_rac_npi","ct_i_xxx_035","ct_i_035_075","ct_i_075_150","ct_i_150_xxx")

ACS_AVERAGE_FRAME <- data.frame(name=character(),value=numeric())

POP_TOTAL <- mean(as.numeric(unlist(dat_acs$pop_tot)))

ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("male_p",round(sum(as.numeric(unlist(dat_acs$ct_male)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("female_p",round(sum(as.numeric(unlist(dat_acs$ct_female)), na.rm = TRUE), digits = 2))

ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("income_xxx_035_p",round(sum(as.numeric(unlist(dat_acs$ct_i_xxx_035)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("income_035_075_p",round(sum(as.numeric(unlist(dat_acs$ct_i_035_075)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("income_075_150_p",round(sum(as.numeric(unlist(dat_acs$ct_i_075_150)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("income_150_xxx_p",round(sum(as.numeric(unlist(dat_acs$ct_i_150_xxx)), na.rm = TRUE), digits = 2))

ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("edu_1_p",round(sum(as.numeric(unlist(dat_acs$ct_edu_1)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("edu_2_p",round(sum(as.numeric(unlist(dat_acs$ct_edu_2)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("edu_3_p",round(sum(as.numeric(unlist(dat_acs$ct_edu_3)), na.rm = TRUE), digits = 2))

ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("rac_whi_p",round(sum(as.numeric(unlist(dat_acs$ct_rac_whi)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("rac_lat_p",round(sum(as.numeric(unlist(dat_acs$ct_rac_lat)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("rac_baa_p",round(sum(as.numeric(unlist(dat_acs$ct_rac_baa)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("rac_asn_p",round(sum(as.numeric(unlist(dat_acs$ct_rac_asn)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("rac_aia_p",round(sum(as.numeric(unlist(dat_acs$ct_rac_aia)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("rac_npi_p",round(sum(as.numeric(unlist(dat_acs$ct_rac_npi)), na.rm = TRUE), digits = 2))

ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("age_xx_17_p",round(sum(as.numeric(unlist(dat_acs$ct_age_xx_17)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("age_18_34_p",round(sum(as.numeric(unlist(dat_acs$ct_age_18_34)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("age_35_44_p",round(sum(as.numeric(unlist(dat_acs$ct_age_35_44)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("age_45_64_p",round(sum(as.numeric(unlist(dat_acs$ct_age_45_64)), na.rm = TRUE), digits = 2))
ACS_AVERAGE_FRAME[nrow(ACS_AVERAGE_FRAME) + 1,] <- c("age_65_xx_p",round(sum(as.numeric(unlist(dat_acs$ct_age_65_xx)), na.rm = TRUE), digits = 2))

# WRITE COMPILED AND CONSOLIDATED DATA TO CSV
write.csv(ACS_AVERAGE_FRAME, "C:/Users/micha/Desktop/art-zcta-ntl-avgs.csv")

# Remove an ungodly amount of data
rm(list = ls())

