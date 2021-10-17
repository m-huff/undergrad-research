### CROSS TABLES FOR ART SURVEY DATA ###
### MICHAEL HUFF ###

library("dplyr")
library("tidyr")
library("janitor")

# Our working survey data file.
survey <- read.csv("C:/Users/micha/Desktop/AV Research/art-fix.csv")

# Need to cross tab:
#
# AGE (age_cat), RACE (rac_cat), GENDER (gen_cat), 
# EDUCATION (edu_cat), HH INCOME (hhinc_cat)
#
# AGAINST
#
# B19 MODE (b19_mode), B19 P MODE (b19_pmode), D19 MODE (d19_mode),
# D19 P MODE (d19_pmode), B19 RHAIL (b19_rhail), D19 RHAIL (d19_rhail),
# A19 RHAIL (a19_rhail), PAST POOL (past_pool), PAST AV (past_av)

generateCrossTab <- function(argRow, argCol, fileName) {
  
  tibble <- survey %>% group_by({{ argRow }},{{ argCol }}) %>% 
            tally() %>% spread({{ argRow }}, n)
  tibble[is.na(tibble)] <- 0
  tibble <- adorn_totals(tibble, where = "row")
  tibble <- adorn_totals(tibble, where = "col")
  
  write.csv(tibble, paste("C:/Users/micha/Desktop/AV Research/crosstabs/",fileName,".csv",sep=""))
  
}

# Cross tables of all travel modes and 
# primary modes before COVID-19.
generateCrossTab(b19_mode, age_cat, "b19_allmodes_by_age")
generateCrossTab(b19_pmode, age_cat, "b19_pmode_by_age")
generateCrossTab(b19_mode, rac_cat, "b19_allmodes_by_rac")
generateCrossTab(b19_pmode, rac_cat, "b19_pmode_by_rac")
generateCrossTab(b19_mode, gen_cat, "b19_allmodes_by_gen")
generateCrossTab(b19_pmode, gen_cat, "b19_pmode_by_gen")
generateCrossTab(b19_mode, edu_cat, "b19_allmodes_by_edu")
generateCrossTab(b19_pmode, edu_cat, "b19_pmode_by_edu")
generateCrossTab(b19_mode, hhinc_cat, "b19_allmodes_by_inc")
generateCrossTab(b19_pmode, hhinc_cat, "b19_pmode_by_inc")

# Cross tables of each individual mode in the
# before COVID-19 mode (multi-select) variables.
generateCrossTab(b19_mode_1, age_cat, "b19_drivealone_by_age")
generateCrossTab(b19_mode_2, age_cat, "b19_carpool_by_age")
generateCrossTab(b19_mode_3, age_cat, "b19_bus_by_age")
generateCrossTab(b19_mode_4, age_cat, "b19_train_by_age")
generateCrossTab(b19_mode_5, age_cat, "b19_bicycle_by_age")
generateCrossTab(b19_mode_6, age_cat, "b19_walk_by_age")
generateCrossTab(b19_mode_7, age_cat, "b19_rhailing_by_age")
generateCrossTab(b19_mode_8, age_cat, "b19_taxicab_by_age")
generateCrossTab(b19_mode_9, age_cat, "b19_escooter_by_age")

generateCrossTab(b19_mode_1, rac_cat, "b19_drivealone_by_rac")
generateCrossTab(b19_mode_2, rac_cat, "b19_carpool_by_rac")
generateCrossTab(b19_mode_3, rac_cat, "b19_bus_by_rac")
generateCrossTab(b19_mode_4, rac_cat, "b19_train_by_rac")
generateCrossTab(b19_mode_5, rac_cat, "b19_bicycle_by_rac")
generateCrossTab(b19_mode_6, rac_cat, "b19_walk_by_rac")
generateCrossTab(b19_mode_7, rac_cat, "b19_rhailing_by_rac")
generateCrossTab(b19_mode_8, rac_cat, "b19_taxicab_by_rac")
generateCrossTab(b19_mode_9, rac_cat, "b19_escooter_by_rac")

generateCrossTab(b19_mode_1, gen_cat, "b19_drivealone_by_gen")
generateCrossTab(b19_mode_2, gen_cat, "b19_carpool_by_gen")
generateCrossTab(b19_mode_3, gen_cat, "b19_bus_by_gen")
generateCrossTab(b19_mode_4, gen_cat, "b19_train_by_gen")
generateCrossTab(b19_mode_5, gen_cat, "b19_bicycle_by_gen")
generateCrossTab(b19_mode_6, gen_cat, "b19_walk_by_gen")
generateCrossTab(b19_mode_7, gen_cat, "b19_rhailing_by_gen")
generateCrossTab(b19_mode_8, gen_cat, "b19_taxicab_by_gen")
generateCrossTab(b19_mode_9, gen_cat, "b19_escooter_by_gen")

generateCrossTab(b19_mode_1, edu_cat, "b19_drivealone_by_edu")
generateCrossTab(b19_mode_2, edu_cat, "b19_carpool_by_edu")
generateCrossTab(b19_mode_3, edu_cat, "b19_bus_by_edu")
generateCrossTab(b19_mode_4, edu_cat, "b19_train_by_edu")
generateCrossTab(b19_mode_5, edu_cat, "b19_bicycle_by_edu")
generateCrossTab(b19_mode_6, edu_cat, "b19_walk_by_edu")
generateCrossTab(b19_mode_7, edu_cat, "b19_rhailing_by_edu")
generateCrossTab(b19_mode_8, edu_cat, "b19_taxicab_by_edu")
generateCrossTab(b19_mode_9, edu_cat, "b19_escooter_by_edu")

generateCrossTab(b19_mode_1, hhinc_cat, "b19_drivealone_by_inc")
generateCrossTab(b19_mode_2, hhinc_cat, "b19_carpool_by_inc")
generateCrossTab(b19_mode_3, hhinc_cat, "b19_bus_by_inc")
generateCrossTab(b19_mode_4, hhinc_cat, "b19_train_by_inc")
generateCrossTab(b19_mode_5, hhinc_cat, "b19_bicycle_by_inc")
generateCrossTab(b19_mode_6, hhinc_cat, "b19_walk_by_inc")
generateCrossTab(b19_mode_7, hhinc_cat, "b19_rhailing_by_inc")
generateCrossTab(b19_mode_8, hhinc_cat, "b19_taxicab_by_inc")
generateCrossTab(b19_mode_9, hhinc_cat, "b19_escooter_by_inc")

# Cross tables of all travel modes and 
# primary modes DURING COVID-19.
generateCrossTab(d19_mode, age_cat, "d19_allmodes_by_age")
generateCrossTab(d19_pmode, age_cat, "d19_pmode_by_age")
generateCrossTab(d19_mode, rac_cat, "d19_allmodes_by_race")
generateCrossTab(d19_pmode, rac_cat, "d19_pmode_by_race")
generateCrossTab(d19_mode, gen_cat, "d19_allmodes_by_gen")
generateCrossTab(d19_pmode, gen_cat, "d19_pmode_by_gen")
generateCrossTab(d19_mode, edu_cat, "d19_allmodes_by_edu")
generateCrossTab(d19_pmode, edu_cat, "d19_pmode_by_edu")
generateCrossTab(d19_mode, hhinc_cat, "d19_allmodes_by_inc")
generateCrossTab(d19_pmode, hhinc_cat, "d19_pmode_by_inc")

# Cross tables of each individual mode in the
# before COVID-19 mode (multi-select) variables.
generateCrossTab(d19_mode_1, age_cat, "d19_drivealone_by_age")
generateCrossTab(d19_mode_2, age_cat, "d19_carpool_by_age")
generateCrossTab(d19_mode_3, age_cat, "d19_bus_by_age")
generateCrossTab(d19_mode_4, age_cat, "d19_train_by_age")
generateCrossTab(d19_mode_5, age_cat, "d19_bicycle_by_age")
generateCrossTab(d19_mode_6, age_cat, "d19_walk_by_age")
generateCrossTab(d19_mode_7, age_cat, "d19_rhailing_by_age")
generateCrossTab(d19_mode_8, age_cat, "d19_taxicab_by_age")
generateCrossTab(d19_mode_9, age_cat, "d19_escooter_by_age")

generateCrossTab(d19_mode_1, rac_cat, "d19_drivealone_by_rac")
generateCrossTab(d19_mode_2, rac_cat, "d19_carpool_by_rac")
generateCrossTab(d19_mode_3, rac_cat, "d19_bus_by_rac")
generateCrossTab(d19_mode_4, rac_cat, "d19_train_by_rac")
generateCrossTab(d19_mode_5, rac_cat, "d19_bicycle_by_rac")
generateCrossTab(d19_mode_6, rac_cat, "d19_walk_by_rac")
generateCrossTab(d19_mode_7, rac_cat, "d19_rhailing_by_rac")
generateCrossTab(d19_mode_8, rac_cat, "d19_taxicab_by_rac")
generateCrossTab(d19_mode_9, rac_cat, "d19_escooter_by_rac")

generateCrossTab(d19_mode_1, gen_cat, "d19_drivealone_by_gen")
generateCrossTab(d19_mode_2, gen_cat, "d19_carpool_by_gen")
generateCrossTab(d19_mode_3, gen_cat, "d19_bus_by_gen")
generateCrossTab(d19_mode_4, gen_cat, "d19_train_by_gen")
generateCrossTab(d19_mode_5, gen_cat, "d19_bicycle_by_gen")
generateCrossTab(d19_mode_6, gen_cat, "d19_walk_by_gen")
generateCrossTab(d19_mode_7, gen_cat, "d19_rhailing_by_gen")
generateCrossTab(d19_mode_8, gen_cat, "d19_taxicab_by_gen")
generateCrossTab(d19_mode_9, gen_cat, "d19_escooter_by_gen")

generateCrossTab(d19_mode_1, edu_cat, "d19_drivealone_by_edu")
generateCrossTab(d19_mode_2, edu_cat, "d19_carpool_by_edu")
generateCrossTab(d19_mode_3, edu_cat, "d19_bus_by_edu")
generateCrossTab(d19_mode_4, edu_cat, "d19_train_by_edu")
generateCrossTab(d19_mode_5, edu_cat, "d19_bicycle_by_edu")
generateCrossTab(d19_mode_6, edu_cat, "d19_walk_by_edu")
generateCrossTab(d19_mode_7, edu_cat, "d19_rhailing_by_edu")
generateCrossTab(d19_mode_8, edu_cat, "d19_taxicab_by_edu")
generateCrossTab(d19_mode_9, edu_cat, "d19_escooter_by_edu")

generateCrossTab(d19_mode_1, hhinc_cat, "d19_drivealone_by_inc")
generateCrossTab(d19_mode_2, hhinc_cat, "d19_carpool_by_inc")
generateCrossTab(d19_mode_3, hhinc_cat, "d19_bus_by_inc")
generateCrossTab(d19_mode_4, hhinc_cat, "d19_train_by_inc")
generateCrossTab(d19_mode_5, hhinc_cat, "d19_bicycle_by_inc")
generateCrossTab(d19_mode_6, hhinc_cat, "d19_walk_by_inc")
generateCrossTab(d19_mode_7, hhinc_cat, "d19_rhailing_by_inc")
generateCrossTab(d19_mode_8, hhinc_cat, "d19_taxicab_by_inc")
generateCrossTab(d19_mode_9, hhinc_cat, "d19_escooter_by_inc")

# Cross tables related to ridehailing use BEFORE COVID-19.
generateCrossTab(b19_rhail, age_cat, "b19_rhail_by_age")
generateCrossTab(b19_rhail, rac_cat, "b19_rhail_by_rac")
generateCrossTab(b19_rhail, gen_cat, "b19_rhail_by_gen")
generateCrossTab(b19_rhail, edu_cat, "b19_rhail_by_edu")
generateCrossTab(b19_rhail, hhinc_cat, "b19_rhail_by_inc")

# Cross tables related to ridehailing use DURING COVID-19.
generateCrossTab(d19_rhail, age_cat, "d19_rhail_by_age")
generateCrossTab(d19_rhail, rac_cat, "d19_rhail_by_rac")
generateCrossTab(d19_rhail, gen_cat, "d19_rhail_by_gen")
generateCrossTab(d19_rhail, edu_cat, "d19_rhail_by_edu")
generateCrossTab(d19_rhail, hhinc_cat, "d19_rhail_by_inc")

# Cross tables related to ridehailing use AFTER COVID-19.
generateCrossTab(a19_rhail, age_cat, "a19_rhail_by_age")
generateCrossTab(a19_rhail, rac_cat, "a19_rhail_by_rac")
generateCrossTab(a19_rhail, gen_cat, "a19_rhail_by_gen")
generateCrossTab(a19_rhail, edu_cat, "a19_rhail_by_edu")
generateCrossTab(a19_rhail, hhinc_cat, "a19_rhail_by_inc")

# Cross tables relating to past use of pooled ridehailing
# services (Yes, No, Don't Know)
generateCrossTab(past_pool, age_cat, "past_pool_by_age")
generateCrossTab(past_pool, rac_cat, "past_pool_by_rac")
generateCrossTab(past_pool, gen_cat, "past_pool_by_gen")
generateCrossTab(past_pool, edu_cat, "past_pool_by_edu")
generateCrossTab(past_pool, hhinc_cat, "past_pool_by_inc")

# Cross tables relating to past use of AVs.
generateCrossTab(past_av, age_cat, "past_av_by_age")
generateCrossTab(past_av, rac_cat, "past_av_by_rac")
generateCrossTab(past_av, gen_cat, "past_av_by_gen")
generateCrossTab(past_av, edu_cat, "past_av_by_edu")
generateCrossTab(past_av, hhinc_cat, "past_av_by_inc")

# Clean R Environment.
rm(list = ls())

          



