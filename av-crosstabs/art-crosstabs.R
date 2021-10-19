### CROSS TABLES FOR ART SURVEY DATA ###
### MICHAEL HUFF ###

library("dplyr")
library("tidyr")
library("janitor")

# Our working survey data file.
survey <- read.csv("C:/Users/micha/Desktop/AV Research/art-change.csv")

# Use only the fully complete records.
survey <- subset(survey, progress == '100')

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

generateCrossTab <- function(argRow, argCol, fileName, filePath) {
  
  tibble <- survey %>% group_by({{ argRow }},{{ argCol }}) %>% 
            tally() %>% spread({{ argRow }}, n)
  tibble[is.na(tibble)] <- 0
  tibble <- adorn_totals(tibble, where = "row")
  tibble <- adorn_totals(tibble, where = "col")
  
  write.csv(tibble, paste("C:/Users/micha/Desktop/AV Research/crosstabs/",filePath,fileName,".csv",sep=""))
  
}

path <- "b19_rhail/"
# Cross tables related to ridehailing use BEFORE COVID-19.
generateCrossTab(b19_rhail, age_cat, "b19_rhail_by_age", path)
# Pull aggregate race stuff into separate files.
generateCrossTab(b19_rhail, rac_cat_1, "b19_rhail_whi", path)
generateCrossTab(b19_rhail, rac_cat_2, "b19_rhail_lat", path)
generateCrossTab(b19_rhail, rac_cat_3, "b19_rhail_baa", path)
generateCrossTab(b19_rhail, rac_cat_4, "b19_rhail_asi", path)
generateCrossTab(b19_rhail, rac_cat_5, "b19_rhail_aian", path)
generateCrossTab(b19_rhail, rac_cat_6, "b19_rhail_nhpi", path)
generateCrossTab(b19_rhail, rac_cat_7, "b19_rhail_self", path)
# Other sociodemographic stuff by B19 ridehailing.
generateCrossTab(b19_rhail, gen_cat, "b19_rhail_by_gen", path)
generateCrossTab(b19_rhail, edu_cat, "b19_rhail_by_edu", path)
generateCrossTab(b19_rhail, hhinc_cat, "b19_rhail_by_inc", path)


path <- "d19_rhail/"
# Cross tables related to ridehailing use DURING COVID-19.
generateCrossTab(d19_rhail, age_cat, "d19_rhail_by_age", path)
# Pull aggregate race stuff into separate files.
generateCrossTab(d19_rhail, rac_cat_1, "d19_rhail_whi", path)
generateCrossTab(d19_rhail, rac_cat_2, "d19_rhail_lat", path)
generateCrossTab(d19_rhail, rac_cat_3, "d19_rhail_baa", path)
generateCrossTab(d19_rhail, rac_cat_4, "d19_rhail_asi", path)
generateCrossTab(d19_rhail, rac_cat_5, "d19_rhail_aian", path)
generateCrossTab(d19_rhail, rac_cat_6, "d19_rhail_nhpi", path)
generateCrossTab(d19_rhail, rac_cat_7, "d19_rhail_self", path)
# Other sociodemographic stuff by D19 ridehailing.
generateCrossTab(d19_rhail, gen_cat, "d19_rhail_by_gen", path)
generateCrossTab(d19_rhail, edu_cat, "d19_rhail_by_edu", path)
generateCrossTab(d19_rhail, hhinc_cat, "d19_rhail_by_inc", path)


path <- "a19_rhail/"
# Cross tables related to ridehailing use AFTER COVID-19.
generateCrossTab(a19_rhail, age_cat, "a19_rhail_by_age", path)
# Pull aggregate race stuff into separate files.
generateCrossTab(a19_rhail, rac_cat_1, "a19_rhail_whi", path)
generateCrossTab(a19_rhail, rac_cat_2, "a19_rhail_lat", path)
generateCrossTab(a19_rhail, rac_cat_3, "a19_rhail_baa", path)
generateCrossTab(a19_rhail, rac_cat_4, "a19_rhail_asi", path)
generateCrossTab(a19_rhail, rac_cat_5, "a19_rhail_aian", path)
generateCrossTab(a19_rhail, rac_cat_6, "a19_rhail_nhpi", path)
generateCrossTab(a19_rhail, rac_cat_7, "a19_rhail_self", path)
# Other sociodemographic stuff by A19 ridehailing.
generateCrossTab(a19_rhail, gen_cat, "a19_rhail_by_gen", path)
generateCrossTab(a19_rhail, edu_cat, "a19_rhail_by_edu", path)
generateCrossTab(a19_rhail, hhinc_cat, "a19_rhail_by_inc", path)


path <- "chg_score/"
#Change score cross tables.
generateCrossTab(chg_score, age_cat, "chg_score_by_age", path)
# Pull aggregate race stuff into separate files.
generateCrossTab(chg_score, rac_cat_1, "chg_score_whi", path)
generateCrossTab(chg_score, rac_cat_2, "chg_score_lat", path)
generateCrossTab(chg_score, rac_cat_3, "chg_score_baa", path)
generateCrossTab(chg_score, rac_cat_4, "chg_score_asi", path)
generateCrossTab(chg_score, rac_cat_5, "chg_score_aian", path)
generateCrossTab(chg_score, rac_cat_6, "chg_score_nhpi", path)
generateCrossTab(chg_score, rac_cat_7, "chg_score_self", path)
# Other sociodemographic stuff by change score.
generateCrossTab(chg_score, gen_cat, "chg_score_by_gen", path)
generateCrossTab(chg_score, edu_cat, "chg_score_by_edu", path)
generateCrossTab(chg_score, hhinc_cat, "chg_score_by_hhinc", path)


path <- "chg_cat/"
#Change CATEGORY cross tables.
generateCrossTab(chg_cat, age_cat, "chg_cat_by_age", path)
# Pull aggregate race stuff into separate files.
generateCrossTab(chg_cat, rac_cat_1, "chg_cat_whi", path)
generateCrossTab(chg_cat, rac_cat_2, "chg_cat_lat", path)
generateCrossTab(chg_cat, rac_cat_3, "chg_cat_baa", path)
generateCrossTab(chg_cat, rac_cat_4, "chg_cat_asi", path)
generateCrossTab(chg_cat, rac_cat_5, "chg_cat_aian", path)
generateCrossTab(chg_cat, rac_cat_6, "chg_cat_nhpi", path)
generateCrossTab(chg_cat, rac_cat_7, "chg_cat_self", path)
# Other sociodemographic stuff by change category
generateCrossTab(chg_cat, gen_cat, "chg_cat_by_gen", path)
generateCrossTab(chg_cat, edu_cat, "chg_cat_by_edu", path)
generateCrossTab(chg_cat, hhinc_cat, "chg_cat_by_hhinc", path)

# Clean R Environment.
rm(list = ls())

          



