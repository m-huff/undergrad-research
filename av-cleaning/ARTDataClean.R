
### AV SURVEY DATA CLEANING SCRIPT
### MICHAEL HUFF

library(stringr) 
library(dummies) 
library(ape)

# This directory should store the raw survey and the reference sheet,
# and the final CSV will be written to this directory.
directory <- "C:/Users/micha/Desktop"
survey <- read.csv(paste(directory, "/art-survey-raw-newcols.csv", sep=''))

# Re-add leading zeroes to ZIP codes to fix formatting
survey$Q1 <- str_pad(survey$Q1, 5, side = "left", pad = "0")
survey$Q347 <- str_pad(survey$Q347, 5, side = "left", pad = "0")


### Begin adding dummy variables to accompany categorical variables.
### All dummy variables will be appended to final CSV to the right of the
### existing column, and will represent each individual survey choice in
### the same order the answers were given on the Qualtrics survey.

### Each implementation of a dummy variable set reads a column into the 
### dummy() function from the 'dummies' packages, and returns a matrix of
### dummy variables, which is then (rather manually) trimmed to only include
### the necessary columns, and then variable names inserted into the third
### row to be consistent with the raw dataset. Finally, the existing survey
### data frame is spliced at (hardcoded, unfortunately) the original question's
### column, and the dummy data frame is bound to the survey data frame.

### In the case that a given question allowed multiple answers to be selected,
### the 'dummies' dummy() function is not utilized. Instead, a data frame is
### manually constructed and the columns populated using a string match search
### to check for each individual answer in the cell.


## SOCIODEMOGRAPHIC QUESTIONS ##

#Respondent's Age
#18-24, 25-34, 35-44, 45-64, 65+
temp_frame <- dummy(survey$Q2)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("age_cat_1", "age_cat_2", "age_cat_3", "age_cat_4", "age_cat_5")
survey <- cbind(survey[,1:21], temp_frame, survey[,22:ncol(survey)])

#Respondent's Race
#White, Latino, Black, Asian, American Indian, Native Hawaiian, Self Describe
temp_frame <- data.frame(rac_cat_1=character(),rac_cat_2=character(),rac_cat_3=character(),rac_cat_4=character(),
                         rac_cat_5=character(),rac_cat_6=character(),rac_cat_7=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$rac_cat_1<-ifelse(grepl("White/Caucasian",survey$Q3),"1","0")
temp_frame$rac_cat_2<-ifelse(grepl("Latino/Hispanic",survey$Q3),"1","0")
temp_frame$rac_cat_3<-ifelse(grepl("Black/African American",survey$Q3),"1","0")
temp_frame$rac_cat_4<-ifelse(grepl("Asian",survey$Q3),"1","0")
temp_frame$rac_cat_5<-ifelse(grepl("American Indian or Alaska Native",survey$Q3),"1","0")
temp_frame$rac_cat_6<-ifelse(grepl("Native Hawaiian or other Pacific Islander",survey$Q3),"1","0")
temp_frame$rac_cat_7<-ifelse(grepl("Self-describe",survey$Q3),"1","0")
temp_frame[3,] <- c("rac_cat_1","rac_cat_2","rac_cat_3","rac_cat_4","rac_cat_5","rac_cat_6","rac_cat_7")
survey <- cbind(survey[,1:27], temp_frame, survey[,28:ncol(survey)])

#Respondent's Gender
#Male, Female, Prefer not to answer, Self-describe (please specify)
temp_frame <- dummy(survey$Q4)
temp_frame <- temp_frame[,c(5,3,6,7)]
temp_frame[3,] <- c("gen_cat_1","gen_cat_2","gen_cat_3","gen_cat_4")
survey <- cbind(survey[,1:36], temp_frame, survey[,37:ncol(survey)])

#Respondent's Education
#Some high school, High school, Associate, Bachelor, Graduate
temp_frame <- dummy(survey$Q5)
temp_frame <- temp_frame[,c(8,7,3,4,6)]
temp_frame[3,] <- c("edu_cat_1","edu_cat_2","edu_cat_3","edu_cat_4","edu_cat_5")
survey <- cbind(survey[,1:42], temp_frame, survey[,43:ncol(survey)])

#Respondent's Income
#Under $15,000, $15,000 to $34,999, $35,000 to $49,999, $50,000 to $74,999, $75,000 to $99,999, $100,000 to $149,999, $150,000+
temp_frame <- dummy(survey$Q6)
temp_frame <- temp_frame[,c(11,3,4,5,6,2,8,10)]
temp_frame[3,] <- c("hhinc_cat_1","hhinc_cat_2","hhinc_cat_3","hhinc_cat_4","hhinc_cat_5",'hhinc_cat_6','hhinc_cat_7','hhinc_cat_8')
survey <- cbind(survey[,1:48], temp_frame, survey[,49:ncol(survey)])

#Respondent's Tenure
#Own, Rent, Other
temp_frame <- dummy(survey$Q7)
temp_frame <- temp_frame[,c(5,6,4)]
temp_frame[3,] <- c("ten_cat_1","ten_cat_2","ten_cat_3")
survey <- cbind(survey[,1:57], temp_frame, survey[,58:ncol(survey)])

#Respondent's Housing Type
#Single-family, duplex, low-rise, mid-rise, high-rise, other
temp_frame <- dummy(survey$Q8)
temp_frame <- temp_frame[,c(8,3,5,6,4,7)]
temp_frame[3,] <- c("unit_cat_1","unit_cat_2","unit_cat_3","unit_cat_4","unit_cat_5","unit_cat_6")
survey <- cbind(survey[,1:62], temp_frame, survey[,63:ncol(survey)])

#Respondent's Household Adult Count
#1, 2, 3, 4 or more
temp_frame <- dummy(survey$Q9)
temp_frame <- temp_frame[,3:6]
temp_frame[3,] <- c("hhadu_cat_1","hhadu_cat_2","hhadu_cat_3","hhadu_cat_4")
survey <- cbind(survey[,1:70], temp_frame, survey[,71:ncol(survey)])

#Respondent's Household Child Count
#0, 1, 2, 3 or more
temp_frame <- dummy(survey$Q10)
temp_frame <- temp_frame[,3:6]
temp_frame[3,] <- c("hhkid_cat_1","hhkid_cat_2","hhkid_cat_3","hhkid_cat_4")
survey <- cbind(survey[,1:75], temp_frame, survey[,76:ncol(survey)])

#Respondent's Travel Modes Before COVID-19
#Drive alone, Carpool, Bus, Train, Bicycle, Walk, Ridehailing, Taxicab, Electric-scooter, Other
temp_frame <- data.frame(b19_mode_1=character(),b19_mode_2=character(),b19_mode_3=character(),b19_mode_4=character(),
                         b19_mode_5=character(),b19_mode_6=character(),b19_mode_7=character(),b19_mode_8=character(),
                         b19_mode_9=character(),b19_mode10=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$b19_mode_1<-ifelse(grepl("Drive alone",survey$Q11),"1","0")
temp_frame$b19_mode_2<-ifelse(grepl("Carpool, vanpool, or passenger in a car",survey$Q11),"1","0")
temp_frame$b19_mode_3<-ifelse(grepl("Bus",survey$Q11),"1","0")
temp_frame$b19_mode_4<-ifelse(grepl("Train",survey$Q11),"1","0")
temp_frame$b19_mode_5<-ifelse(grepl("Bicycle",survey$Q11),"1","0")
temp_frame$b19_mode_6<-ifelse(grepl("Walk",survey$Q11),"1","0")
temp_frame$b19_mode_7<-ifelse(grepl("Ridehailing",survey$Q11),"1","0")
temp_frame$b19_mode_8<-ifelse(grepl("Taxicab",survey$Q11),"1","0")
temp_frame$b19_mode_9<-ifelse(grepl("Electric-scooter",survey$Q11),"1","0")
temp_frame$b19_mode10<-ifelse(grepl("Other",survey$Q11),"1","0")
temp_frame[3,] <- c("b19_mode_1","b19_mode_2","b19_mode_3","b19_mode_4","b19_mode_5","b19_mode_6","b19_mode_7","b19_mode_8","b19_mode_9","b19_mode10")
survey <- cbind(survey[,1:80], temp_frame, survey[,81:ncol(survey)])

#Respondent's Most Used Travel Mode Before COVID-19
#Drive alone, Carpool, Bus, Train, Bicycle, Walk, Ridehailing, Taxicab, Electric-scooter, Other
temp_frame <- dummy(survey$Q348)
temp_frame <- temp_frame[,c(7,6,5,13,4,14,11,12,8,10)]
temp_frame[3,] <- c("b19_pmod1","b19_pmod2","b19_pmod3","b19_pmod4","b19_pmod5","b19_pmod6","b19_pmod7","b19_pmod8","b19_pmod9","b19_pmod10")
survey <- cbind(survey[,1:92], temp_frame, survey[,93:ncol(survey)])

#Respondent's Travel Modes DURING COVID-19
#Drive alone, Carpool, Bus, Train, Bicycle, Walk, Ridehailing, Taxicab, Electric-scooter, Other
temp_frame <- data.frame(d19_mode_1=character(),d19_mode_2=character(),d19_mode_3=character(),d19_mode_4=character(),
                         d19_mode_5=character(),d19_mode_6=character(),d19_mode_7=character(),d19_mode_8=character(),
                         d19_mode_9=character(),d19_mode10=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$d19_mode_1<-ifelse(grepl("Drive alone",survey$Q26),"1","0")
temp_frame$d19_mode_2<-ifelse(grepl("Carpool, vanpool, or passenger in a car",survey$Q26),"1","0")
temp_frame$d19_mode_3<-ifelse(grepl("Bus",survey$Q26),"1","0")
temp_frame$d19_mode_4<-ifelse(grepl("Train",survey$Q26),"1","0")
temp_frame$d19_mode_5<-ifelse(grepl("Bicycle",survey$Q26),"1","0")
temp_frame$d19_mode_6<-ifelse(grepl("Walk",survey$Q26),"1","0")
temp_frame$d19_mode_7<-ifelse(grepl("Ridehailing",survey$Q26),"1","0")
temp_frame$d19_mode_8<-ifelse(grepl("Taxicab",survey$Q26),"1","0")
temp_frame$d19_mode_9<-ifelse(grepl("Electric-scooter",survey$Q26),"1","0")
temp_frame$d19_mode10<-ifelse(grepl("Other",survey$Q26),"1","0")
temp_frame[3,] <- c("d19_mode_1","d19_mode_2","d19_mode_3","d19_mode_4","d19_mode_5","d19_mode_6","d19_mode_7","d19_mode_8","d19_mode_9","d19_mode10")
survey <- cbind(survey[,1:104], temp_frame, survey[,105:ncol(survey)])

#Respondent's Most Used Travel Mode DURING COVID-19
#Drive alone, Carpool, Bus, Train, Bicycle, Walk, Ridehailing, Taxicab, Electric-scooter, Other
temp_frame <- dummy(survey$Q27)
temp_frame <- temp_frame[,c(7,5,4,13,3,14,11,12,9,10)]
temp_frame[3,] <- c("d19_pmod1","d19_pmod2","d19_pmod3","d19_pmod4","d19_pmod5","d19_pmod6","d19_pmod7","d19_pmod8","d19_pmod9","d19_pmod10")
survey <- cbind(survey[,1:116], temp_frame, survey[,117:ncol(survey)])

#Respondent's Household Automobile Count
#0, 1, 2, 3 or more
temp_frame <- dummy(survey$Q31)
temp_frame <- temp_frame[,3:6]
temp_frame[3,] <- c("hhcar_cat1","hhcar_cat2","hhcar_cat3","hhcar_cat4")
survey <- cbind(survey[,1:128], temp_frame, survey[,129:ncol(survey)])

#Respondent's Licenses and Memberships
#Driver's license, Transit pass, Carshare membership, Bikeshare membership, Other
temp_frame <- data.frame(lic_cat_1=character(),lic_cat_2=character(),
                         lic_cat_3=character(),lic_cat_4=character(),
                         lic_cat_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$lic_cat_1<-ifelse(grepl("Driver's license",survey$Q32),"1","0")
temp_frame$lic_cat_2<-ifelse(grepl("Transit pass",survey$Q32),"1","0")
temp_frame$lic_cat_3<-ifelse(grepl("Carshare membership",survey$Q32),"1","0")
temp_frame$lic_cat_4<-ifelse(grepl("Bikeshare membership",survey$Q32),"1","0")
temp_frame$lic_cat_5<-ifelse(grepl("Other",survey$Q32),"1","0")
temp_frame[3,] <- c("lic_cat_1","lic_cat_2","lic_cat_3","lic_cat_4","lic_cat_5")
survey <- cbind(survey[,1:133], temp_frame, survey[,134:ncol(survey)])

#WORK
temp_frame <- data.frame(work_cat_1=character(),work_cat_2=character(),
                         work_cat_3=character(),work_cat_4=character(),
                         work_cat_5=character(),work_cat_6=character(),
                         work_cat_7=character(),work_cat_8=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$work_cat_1<-ifelse(grepl("Full-time work",survey$Q33),"1","0")
temp_frame$work_cat_2<-ifelse(grepl("Part-time work",survey$Q33),"1","0")
temp_frame$work_cat_3<-ifelse(grepl("Full-time student",survey$Q33),"1","0")
temp_frame$work_cat_4<-ifelse(grepl("Part-time student",survey$Q33),"1","0")
temp_frame$work_cat_5<-ifelse(grepl("Retired",survey$Q33),"1","0")
temp_frame$work_cat_6<-ifelse(grepl("Unemployed and looking for work",survey$Q33),"1","0")
temp_frame$work_cat_7<-ifelse(grepl("Unemployed and NOT looking for work",survey$Q33),"1","0")
temp_frame$work_cat_8<-ifelse(grepl("Other",survey$Q33),"1","0")
temp_frame[3,] <- c("work_cat_1","work_cat_2","work_cat_3","work_cat_4","work_cat_5","work_cat_6","work_cat_7","work_cat_8")
survey <- cbind(survey[,1:140], temp_frame, survey[,141:ncol(survey)])


## RIDEHAILING QUESTIONS ##


#Respondent's Ridehailing Use BEFORE COVID-19
#Never, Rarely, Monthly, Sometimes, Weekly, Regularly, Frequently
temp_frame <- dummy(survey$Q35)
temp_frame <- temp_frame[,c(5,7,6,10,11,8,4)]
temp_frame[3,] <- c("b19_rhail_1","b19_rhail_2","b19_rhail_3","b19_rhail_4","b19_rhail_5","b19_rhail_6","b19_rhail_7")
survey <- cbind(survey[,1:150], temp_frame, survey[,151:ncol(survey)])

#Respondent's Ridehailing Use DURING COVID-19
#Never, Rarely, Monthly, Sometimes, Weekly, Regularly, Frequently
temp_frame <- dummy(survey$Q36)
temp_frame <- temp_frame[,c(6,8,7,10,11,9,5)]
temp_frame[3,] <- c("d19_rhail_1","d19_rhail_2","d19_rhail_3","d19_rhail_4","d19_rhail_5","d19_rhail_6","d19_rhail_7")
survey <- cbind(survey[,1:158], temp_frame, survey[,159:ncol(survey)])

#Respondent's Ridehailing Use AFTER COVID-19
#Will Use More, About the Same, Less, Will Not Use, Don't Know
temp_frame <- dummy(survey$Q37)
temp_frame <- temp_frame[,c(8,9,7,6,5)]
temp_frame[3,] <- c("a19_rhail_1","a19_rhail_2","a19_rhail_3","a19_rhail_4","a19_rhail_5")
survey <- cbind(survey[,1:166], temp_frame, survey[,167:ncol(survey)])

#Respondent's Use of Pooled Ridehailing
#Yes, No, Don't Know
temp_frame <- dummy(survey$Q38)
temp_frame <- temp_frame[,c(7,4,3)]
temp_frame[3,] <- c("past_pool_1","past_pool_2","past_pool_3")
survey <- cbind(survey[,1:172], temp_frame, survey[,173:ncol(survey)])

#Respondent's Use of Autonomous Vehicles
#Yes, No, Don't Know
temp_frame <- dummy(survey$Q39)
temp_frame <- temp_frame[,c(7,5,4)]
temp_frame[3,] <- c("past_av_1","past_av_2","past_av_3")
survey <- cbind(survey[,1:176], temp_frame, survey[,177:ncol(survey)])

#Respondent's Trip Type Choices by Travel Options (COMMUTE)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(topt_com_1=character(),topt_com_2=character(),
                         topt_com_3=character(),topt_com_4=character(),
                         topt_com_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$topt_com_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q40_1),"1","0")
temp_frame$topt_com_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q40_1),"1","0")
temp_frame$topt_com_3<-ifelse(grepl("Autonomous ridehailing",survey$Q40_1),"1","0")
temp_frame$topt_com_4<-ifelse(grepl("Autonomous ridesharing",survey$Q40_1),"1","0")
temp_frame$topt_com_5<-ifelse(grepl("None of these services",survey$Q40_1),"1","0")
temp_frame[3,] <- c("topt_com_1","topt_com_2","topt_com_3","topt_com_4","topt_com_5")
survey <- cbind(survey[,1:180], temp_frame, survey[,181:ncol(survey)])

#Respondent's Trip Type Choices by Travel Options (SHOPPING)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(topt_shp_1=character(),topt_shp_2=character(),
                         topt_shp_3=character(),topt_shp_4=character(),
                         topt_shp_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$topt_shp_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q40_2),"1","0")
temp_frame$topt_shp_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q40_2),"1","0")
temp_frame$topt_shp_3<-ifelse(grepl("Autonomous ridehailing",survey$Q40_2),"1","0")
temp_frame$topt_shp_4<-ifelse(grepl("Autonomous ridesharing",survey$Q40_2),"1","0")
temp_frame$topt_shp_5<-ifelse(grepl("None of these services",survey$Q40_2),"1","0")
temp_frame[3,] <- c("topt_shp_1","topt_shp_2","topt_shp_3","topt_shp_4","topt_shp_5")
survey <- cbind(survey[,1:186], temp_frame, survey[,187:ncol(survey)])

#Respondent's Trip Type Choices by Travel Options (SOCIAL)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(topt_soc_1=character(),topt_soc_2=character(),
                         topt_soc_3=character(),topt_soc_4=character(),
                         topt_soc_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$topt_soc_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q40_3),"1","0")
temp_frame$topt_soc_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q40_3),"1","0")
temp_frame$topt_soc_3<-ifelse(grepl("Autonomous ridehailing",survey$Q40_3),"1","0")
temp_frame$topt_soc_4<-ifelse(grepl("Autonomous ridesharing",survey$Q40_3),"1","0")
temp_frame$topt_soc_5<-ifelse(grepl("None of these services",survey$Q40_3),"1","0")
temp_frame[3,] <- c("topt_soc_1","topt_soc_2","topt_soc_3","topt_soc_4","topt_soc_5")
survey <- cbind(survey[,1:192], temp_frame, survey[,193:ncol(survey)])

#Respondent's Trip Type Choices by Travel Options (CHANGING TRANSIT MODES)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(topt_chg_1=character(),topt_chg_2=character(),
                         topt_chg_3=character(),topt_chg_4=character(),
                         topt_chg_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$topt_chg_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q40_4),"1","0")
temp_frame$topt_chg_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q40_4),"1","0")
temp_frame$topt_chg_3<-ifelse(grepl("Autonomous ridehailing",survey$Q40_4),"1","0")
temp_frame$topt_chg_4<-ifelse(grepl("Autonomous ridesharing",survey$Q40_4),"1","0")
temp_frame$topt_chg_5<-ifelse(grepl("None of these services",survey$Q40_4),"1","0")
temp_frame[3,] <- c("topt_chg_1","topt_chg_2","topt_chg_3","topt_chg_4","topt_chg_5")
survey <- cbind(survey[,1:198], temp_frame, survey[,199:ncol(survey)])

#Respondent's Trip Type Choices by Travel Options (OTHER)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(topt_oth_1=character(),topt_oth_2=character(),
                         topt_oth_3=character(),topt_oth_4=character(),
                         topt_oth_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$topt_oth_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q40_5),"1","0")
temp_frame$topt_oth_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q40_5),"1","0")
temp_frame$topt_oth_3<-ifelse(grepl("Autonomous ridehailing",survey$Q40_5),"1","0")
temp_frame$topt_oth_4<-ifelse(grepl("Autonomous ridesharing",survey$Q40_5),"1","0")
temp_frame$topt_oth_5<-ifelse(grepl("None of these services",survey$Q40_5),"1","0")
temp_frame[3,] <- c("topt_oth_1","topt_oth_2","topt_oth_3","topt_oth_4","topt_oth_5")
survey <- cbind(survey[,1:204], temp_frame, survey[,205:ncol(survey)])

#Respondent's Factors for Making Modal Choice (CAR NOT AVAILABLE)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_nodrv_1=character(),r1_nodrv_2=character(),
                         r1_nodrv_3=character(),r1_nodrv_4=character(),
                         r1_nodrv_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_nodrv_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_1),"1","0")
temp_frame$r1_nodrv_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_1),"1","0")
temp_frame$r1_nodrv_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_1),"1","0")
temp_frame$r1_nodrv_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_1),"1","0")
temp_frame$r1_nodrv_5<-ifelse(grepl("None of these services",survey$Q41_1),"1","0")
temp_frame[3,] <- c("r1_nodrv_1","r1_nodrv_2","r1_nodrv_3","r1_nodrv_4","r1_nodrv_5")
survey <- cbind(survey[,1:210], temp_frame, survey[,211:ncol(survey)])

#Respondent's Factors for Making Modal Choice (NO PARKING)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_noprk_1=character(),r1_noprk_2=character(),
                         r1_noprk_3=character(),r1_noprk_4=character(),
                         r1_noprk_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_noprk_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_2),"1","0")
temp_frame$r1_noprk_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_2),"1","0")
temp_frame$r1_noprk_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_2),"1","0")
temp_frame$r1_noprk_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_2),"1","0")
temp_frame$r1_noprk_5<-ifelse(grepl("None of these services",survey$Q41_2),"1","0")
temp_frame[3,] <- c("r2_noprk_1","r2_noprk_2","r2_noprk_3","r2_noprk_4","r2_noprk_5")
survey <- cbind(survey[,1:216], temp_frame, survey[,217:ncol(survey)])

#Respondent's Factors for Making Modal Choice (MULTITASKING)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_mtask_1=character(),r1_mtask_2=character(),
                         r1_mtask_3=character(),r1_mtask_4=character(),
                         r1_mtask_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_mtask_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_3),"1","0")
temp_frame$r1_mtask_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_3),"1","0")
temp_frame$r1_mtask_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_3),"1","0")
temp_frame$r1_mtask_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_3),"1","0")
temp_frame$r1_mtask_5<-ifelse(grepl("None of these services",survey$Q41_3),"1","0")
temp_frame[3,] <- c("r3_mtask_1","r3_mtask_2","r3_mtask_3","r3_mtask_4","r3_mtask_5")
survey <- cbind(survey[,1:222], temp_frame, survey[,223:ncol(survey)])

#Respondent's Factors for Making Modal Choice (PUBLIC TRANSIT NOT AVAILABLE)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_notrn_1=character(),r1_notrn_2=character(),
                         r1_notrn_3=character(),r1_notrn_4=character(),
                         r1_notrn_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_notrn_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_4),"1","0")
temp_frame$r1_notrn_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_4),"1","0")
temp_frame$r1_notrn_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_4),"1","0")
temp_frame$r1_notrn_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_4),"1","0")
temp_frame$r1_notrn_5<-ifelse(grepl("None of these services",survey$Q41_4),"1","0")
temp_frame[3,] <- c("r4_notrn_1","r4_notrn_2","r4_notrn_3","r4_notrn_4","r4_notrn_5")
survey <- cbind(survey[,1:228], temp_frame, survey[,229:ncol(survey)])

#Respondent's Factors for Making Modal Choice (QUICKER THAN TRANSIT)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_trnqck_1=character(),r1_trnqck_2=character(),
                         r1_trnqck_3=character(),r1_trnqck_4=character(),
                         r1_trnqck_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_trnqck_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_5),"1","0")
temp_frame$r1_trnqck_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_5),"1","0")
temp_frame$r1_trnqck_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_5),"1","0")
temp_frame$r1_trnqck_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_5),"1","0")
temp_frame$r1_trnqck_5<-ifelse(grepl("None of these services",survey$Q41_5),"1","0")
temp_frame[3,] <- c("r5_trnqck_1","r5_trnqck_2","r5_trnqck_3","r5_trnqck_4","r5_trnqck_5")
survey <- cbind(survey[,1:234], temp_frame, survey[,235:ncol(survey)])

#Respondent's Factors for Making Modal Choice (WEATHER)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_wthr_1=character(),r1_wthr_2=character(),
                         r1_wthr_3=character(),r1_wthr_4=character(),
                         r1_wthr_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_wthr_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_6),"1","0")
temp_frame$r1_wthr_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_6),"1","0")
temp_frame$r1_wthr_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_6),"1","0")
temp_frame$r1_wthr_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_6),"1","0")
temp_frame$r1_wthr_5<-ifelse(grepl("None of these services",survey$Q41_6),"1","0")
temp_frame[3,] <- c("r6_wthr_1","r6_wthr_2","r6_wthr_3","r6_wthr_4","r6_wthr_5")
survey <- cbind(survey[,1:240], temp_frame, survey[,241:ncol(survey)])

#Respondent's Factors for Making Modal Choice (HEALTH)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_health_1=character(),r1_health_2=character(),
                         r1_health_3=character(),r1_health_4=character(),
                         r1_health_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_health_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_7),"1","0")
temp_frame$r1_health_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_7),"1","0")
temp_frame$r1_health_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_7),"1","0")
temp_frame$r1_health_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_7),"1","0")
temp_frame$r1_health_5<-ifelse(grepl("None of these services",survey$Q41_7),"1","0")
temp_frame[3,] <- c("r7_health_1","r7_health_2","r7_health_3","r7_health_4","r7_health_5")
survey <- cbind(survey[,1:246], temp_frame, survey[,247:ncol(survey)])

#Respondent's Factors for Making Modal Choice (SECURITY)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_secure_1=character(),r1_secure_2=character(),
                         r1_secure_3=character(),r1_secure_4=character(),
                         r1_secure_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_secure_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_8),"1","0")
temp_frame$r1_secure_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_8),"1","0")
temp_frame$r1_secure_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_8),"1","0")
temp_frame$r1_secure_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_8),"1","0")
temp_frame$r1_secure_5<-ifelse(grepl("None of these services",survey$Q41_8),"1","0")
temp_frame[3,] <- c("r8_secure_1","r8_secure_2","r8_secure_3","r8_secure_4","r8_secure_5")
survey <- cbind(survey[,1:252], temp_frame, survey[,253:ncol(survey)])

#Respondent's Factors for Making Modal Choice (OTHER)
#Ridehailing, Ridesharing, Autonomous ridehailing, Autonomous ridesharing, None
temp_frame <- data.frame(r1_other_1=character(),r1_other_2=character(),
                         r1_other_3=character(),r1_other_4=character(),
                         r1_other_5=character())

for (i in seq(1,nrow(survey),1)) { temp_frame[nrow(temp_frame) + 1,] <- NA }
temp_frame$r1_other_1<-ifelse(grepl("Ridehailing (exclusive)",survey$Q41_9),"1","0")
temp_frame$r1_other_2<-ifelse(grepl("Ridesharing (pooled)",survey$Q41_9),"1","0")
temp_frame$r1_other_3<-ifelse(grepl("Autonomous ridehailing",survey$Q41_9),"1","0")
temp_frame$r1_other_4<-ifelse(grepl("Autonomous ridesharing",survey$Q41_9),"1","0")
temp_frame$r1_other_5<-ifelse(grepl("None of these services",survey$Q41_9),"1","0")
temp_frame[3,] <- c("r9_other_1","r9_other_2","r9_other_3","r9_other_4","r9_other_5")
survey <- cbind(survey[,1:258], temp_frame, survey[,259:ncol(survey)])

#Statement Agree/Disagree Section
#AVs Reduce Number of Crashes
temp_frame <- dummy(survey$Q43)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av01_crash_1","av01_crash_2","av01_crash_3","av01_crash_4","av01_crash_5")
survey <- cbind(survey[,1:264], temp_frame, survey[,265:ncol(survey)])

#Statement Agree/Disagree Section
#AVs Can Drive on Deteriorated Roads
temp_frame <- dummy(survey$Q44)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av02_roads_1","av02_roads_2","av02_roads_3","av02_roads_4","av02_roads_5")
survey <- cbind(survey[,1:270], temp_frame, survey[,271:ncol(survey)])

#Statement Agree/Disagree Section
#AVs and Traditional Vehicles Can Share the Road
temp_frame <- dummy(survey$Q45)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av03_mcars_1","av03_mcars_2","av03_mcars_3","av03_mcars_4","av03_mcars_5")
survey <- cbind(survey[,1:276], temp_frame, survey[,277:ncol(survey)])

#Statement Agree/Disagree Section
#Limited Driving Experience in AVs
temp_frame <- dummy(survey$Q46)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av04_emerg_1","av04_emerg_2","av04_emerg_3","av04_emerg_4","av04_emerg_5")
survey <- cbind(survey[,1:282], temp_frame, survey[,283:ncol(survey)])

#Statement Agree/Disagree Section
#Limited Tech Knowledge in AVs
temp_frame <- dummy(survey$Q47)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av06_noexp_1","av06_noexp_2","av06_noexp_3","av06_noexp_4","av06_noexp_5")
survey <- cbind(survey[,1:288], temp_frame, survey[,289:ncol(survey)])

#Statement Agree/Disagree Section
#AVs and Cyberattacks
temp_frame <- dummy(survey$Q48)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av07_cyber_1","av07_cyber_2","av07_cyber_3","av07_cyber_4","av07_cyber_5")
survey <- cbind(survey[,1:294], temp_frame, survey[,295:ncol(survey)])

#Statement Agree/Disagree Section
#AVs Collecting Personal Identifiers
temp_frame <- dummy(survey$Q49)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av08_pinfo_1","av08_pinfo_2","av08_pinfo_3","av08_pinfo_4","av08_pinfo_5")
survey <- cbind(survey[,1:300], temp_frame, survey[,301:ncol(survey)])

#Statement Agree/Disagree Section
#AVs Reporting Suspicious Activity
temp_frame <- dummy(survey$Q50)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av09_alert_1","av09_alert_2","av09_alert_3","av09_alert_4","av09_alert_5")
survey <- cbind(survey[,1:306], temp_frame, survey[,307:ncol(survey)])

#Statement Agree/Disagree Section
#Strangers in AVs
temp_frame <- dummy(survey$Q51)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av10_strng_1","av10_strng_2","av10_strng_3","av10_strng_4","av10_strng_5")
survey <- cbind(survey[,1:312], temp_frame, survey[,313:ncol(survey)])

#Statement Agree/Disagree Section
#Children Under 18 Riding Alone in AVs
temp_frame <- dummy(survey$Q52)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av11_child_1","av11_child_2","av11_child_3","av11_child_4","av11_child_5")
survey <- cbind(survey[,1:318], temp_frame, survey[,319:ncol(survey)])

#Statement Agree/Disagree Section
#AVs Respond to Hazards Better
temp_frame <- dummy(survey$Q53)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av12_human_1","av12_human_2","av12_human_3","av12_human_4","av12_human_5")
survey <- cbind(survey[,1:324], temp_frame, survey[,325:ncol(survey)])

#Statement Agree/Disagree Section
#Attention is Not Imperative in AVs
temp_frame <- dummy(survey$Q54)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av13_atten_1","av13_atten_2","av13_atten_3","av13_atten_4","av13_atten_5")
survey <- cbind(survey[,1:330], temp_frame, survey[,331:ncol(survey)])

#Statement Agree/Disagree Section
#AVs Can Detect Critical Errors Before Issue
temp_frame <- dummy(survey$Q55)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av14_dtect_1","av14_dtect_2","av14_dtect_3","av14_dtect_4","av14_dtect_5")
survey <- cbind(survey[,1:336], temp_frame, survey[,337:ncol(survey)])

#Statement Agree/Disagree Section
#AVs Increase Fuel Efficiency and Traffic Management
temp_frame <- dummy(survey$Q56)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av15_traff_1","av15_traff_2","av15_traff_3","av15_traff_4","av15_traff_5")
survey <- cbind(survey[,1:342], temp_frame, survey[,343:ncol(survey)])

#Statement Agree/Disagree Section
#Manual Override
temp_frame <- dummy(survey$Q57)
temp_frame <- temp_frame[,3:7]
temp_frame[3,] <- c("av16_oride_1","av16_oride_2","av16_oride_3","av16_oride_4","av16_oride_5")
survey <- cbind(survey[,1:348], temp_frame, survey[,349:ncol(survey)])


## STATED PREFERENCE SECTION MANIPULATION ## 

### In this section, we pull all data from the sparse matrix that was constructed
### by Qualtrics, append the question number to each answer, and compress that
### data into a full matrix, so we can identify both what questions a respondent
### answered and how many questions they answered.

### This new matrix is then compared against an external reference CSV which 
### contains all question numbers, as well as the attributes of each choice on 
### the card. A new empty matrix is constructed with 6 columns for 27 potential
### stated preference cards (the maximum a respondent could be shown), and their
### answers (Option 1 or Option 2) are recorded with the attributes of their
### chosen scenario as well as the attributes of the scenario they did NOT choose.

### When a user stopped responding to stated preference cards, the remaining
### columns are marked with NA. 

### The naming convention of this section is as follows: CXX_AX_C/O
### Where the first bit (CXX) indicates the order in which the respondent
### saw this card (C01 represents their first card), the second bit (AX) represents
### which attribute of that given card the column records (A1 is minutes, A2
### is seats, A3 is cost) and the third bit represents whether or not the user
### chose that option or if it is the alternative option the use did not choose
### (C - chosen, O - other)


#create separate frame for new stated choice format
#'squeeze' data frame by only pulling populated answer fields
stated_pref <- survey[,354:ncol(survey)]

for(col in 1:ncol(stated_pref)) { stated_pref[col] <- Map(paste, str_split(stated_pref[2,col], "\"")[[1]][4], stated_pref[col]) }
rm("col")

stated_pref.list <- split(stated_pref, seq(nrow(stated_pref)))

for (index in seq(1, length(stated_pref.list), 1)) {
  dummy_list <- stated_pref.list[[index]]
  dummy_list <- dummy_list[grepl("Option", dummy_list)]
  stated_pref.list[[index]] <- dummy_list
}
rm("dummy_list")

filled_matrix <- data.frame(Q1=character(),Q2=character(),Q3=character(),Q4=character(),
                            Q5=character(),Q6=character(),Q7=character(),Q8=character(),
                            Q9=character(),Q10=character(),Q11=character(),Q12=character(),
                            Q13=character(),Q14=character(),Q15=character(),Q16=character(),
                            Q17=character(),Q18=character(),Q19=character(),Q20=character(),
                            Q21=character(),Q22=character(),Q23=character(),Q24=character(),
                            Q25=character(),Q26=character(),Q27=character())

for (index in seq(1, nrow(survey), 1)) {
  if (ncol(stated_pref.list[[index]]) == 0) {
    for(i in seq(1,27,1)) stated_pref.list[[index]][,i] <- NA 
  }
  if (ncol(stated_pref.list[[index]]) == 9) {
    for(i in seq(10,27,1)) stated_pref.list[[index]][,i] <- NA 
  }
  if (ncol(stated_pref.list[[index]]) == 18) {
    for(i in seq(19,27,1)) stated_pref.list[[index]][,i] <- NA
  }
}
rm("i")
  
for (index in seq(1, length(stated_pref.list), 1)) { filled_matrix[nrow(filled_matrix) + 1,] = stated_pref.list[[index]] }
rm("index","stated_pref","stated_pref.list")

# This is our external reference sheet
reference <- read.csv(paste(directory,"/art-survey-reference.csv",sep=''))

# Bad practice here to manually build such a bulky data frame, but in this case 
# it allowed for more timely and direct manipulation
st_prf_full <- data.frame(C01_A1_C=character(),C01_A2_C=character(),C01_A3_C=character(),
                          C01_A1_O=character(),C01_A2_O=character(),C01_A3_O=character(),
                          C02_A1_C=character(),C02_A2_C=character(),C02_A3_C=character(),
                          C02_A1_O=character(),C02_A2_O=character(),C02_A3_O=character(),
                          C03_A1_C=character(),C03_A2_C=character(),C03_A3_C=character(),
                          C03_A1_O=character(),C03_A2_O=character(),C03_A3_O=character(),
                          C04_A1_C=character(),C04_A2_C=character(),C04_A3_C=character(),
                          C04_A1_O=character(),C04_A2_O=character(),C04_A3_O=character(),
                          C05_A1_C=character(),C05_A2_C=character(),C05_A3_C=character(),
                          C05_A1_O=character(),C05_A2_O=character(),C05_A3_O=character(),
                          C06_A1_C=character(),C06_A2_C=character(),C06_A3_C=character(),
                          C06_A1_O=character(),C06_A2_O=character(),C06_A3_O=character(),
                          C07_A1_C=character(),C07_A2_C=character(),C07_A3_C=character(),
                          C07_A1_O=character(),C07_A2_O=character(),C07_A3_O=character(),
                          C08_A1_C=character(),C08_A2_C=character(),C08_A3_C=character(),
                          C08_A1_O=character(),C08_A2_O=character(),C08_A3_O=character(),
                          C09_A1_C=character(),C09_A2_C=character(),C09_A3_C=character(),
                          C09_A1_O=character(),C09_A2_O=character(),C09_A3_O=character(),
                          C10_A1_C=character(),C10_A2_C=character(),C10_A3_C=character(),
                          C10_A1_O=character(),C10_A2_O=character(),C10_A3_O=character(),
                          C11_A1_C=character(),C11_A2_C=character(),C11_A3_C=character(),
                          C11_A1_O=character(),C11_A2_O=character(),C11_A3_O=character(),
                          C12_A1_C=character(),C12_A2_C=character(),C12_A3_C=character(),
                          C12_A1_O=character(),C12_A2_O=character(),C12_A3_O=character(),
                          C13_A1_C=character(),C13_A2_C=character(),C13_A3_C=character(),
                          C13_A1_O=character(),C13_A2_O=character(),C13_A3_O=character(),
                          C14_A1_C=character(),C14_A2_C=character(),C14_A3_C=character(),
                          C14_A1_O=character(),C14_A2_O=character(),C14_A3_O=character(),
                          C15_A1_C=character(),C15_A2_C=character(),C15_A3_C=character(),
                          C15_A1_O=character(),C15_A2_O=character(),C15_A3_O=character(),
                          C16_A1_C=character(),C16_A2_C=character(),C16_A3_C=character(),
                          C16_A1_O=character(),C16_A2_O=character(),C16_A3_O=character(),
                          C17_A1_C=character(),C17_A2_C=character(),C17_A3_C=character(),
                          C17_A1_O=character(),C17_A2_O=character(),C17_A3_O=character(),
                          C18_A1_C=character(),C18_A2_C=character(),C18_A3_C=character(),
                          C18_A1_O=character(),C18_A2_O=character(),C18_A3_O=character(),
                          C19_A1_C=character(),C19_A2_C=character(),C19_A3_C=character(),
                          C19_A1_O=character(),C19_A2_O=character(),C19_A3_O=character(),
                          C20_A1_C=character(),C20_A2_C=character(),C20_A3_C=character(),
                          C20_A1_O=character(),C20_A2_O=character(),C20_A3_O=character(),
                          C21_A1_C=character(),C21_A2_C=character(),C21_A3_C=character(),
                          C21_A1_O=character(),C21_A2_O=character(),C21_A3_O=character(),
                          C22_A1_C=character(),C22_A2_C=character(),C22_A3_C=character(),
                          C22_A1_O=character(),C22_A2_O=character(),C22_A3_O=character(),
                          C23_A1_C=character(),C23_A2_C=character(),C23_A3_C=character(),
                          C23_A1_O=character(),C23_A2_O=character(),C23_A3_O=character(),
                          C24_A1_C=character(),C24_A2_C=character(),C24_A3_C=character(),
                          C24_A1_O=character(),C24_A2_O=character(),C24_A3_O=character(),
                          C25_A1_C=character(),C25_A2_C=character(),C25_A3_C=character(),
                          C25_A1_O=character(),C25_A2_O=character(),C25_A3_O=character(),
                          C26_A1_C=character(),C26_A2_C=character(),C26_A3_C=character(),
                          C26_A1_O=character(),C26_A2_O=character(),C26_A3_O=character(),
                          C27_A1_C=character(),C27_A2_C=character(),C27_A3_C=character(),
                          C27_A1_O=character(),C27_A2_O=character(),C27_A3_O=character())

# Loop through each cell, and populate it and the next five in the row with the
# associated data from the reference CSV. Then skip five indices in the loop, 
# and continue until the matrix is full.
for (row in seq(1, nrow(survey), 1)) {
  for (col in seq(1, 27, 1)) {
    
    starting_cell <- ((col-1) * 6) + 1
    
    if (is.na(filled_matrix[row,col])) {
      for (index in seq(0,5,1)) {
        st_prf_full[row,(starting_cell+index)] <- NA
      }
    }
    
    if (!is.na(filled_matrix[row,col])) {
      q_data <- str_split(as.character(filled_matrix[row,col]), " ")
      q_reference_id <- gsub("ID","", q_data[[1]][1])
      q_choice_id <- q_data[[1]][3]

      reference_row <- reference[which(reference$ï..q_id == q_reference_id),]
      u_time <- reference_row[2] * 10
      c_seats <- reference_row[3]
      c_cost <- reference_row[4]
      o_seats <- reference_row[5]
      o_cost <- reference_row[6]
      
      # Reverse the order of the cards depending on which option the respondent chose
      if (q_choice_id == 1) {
        st_prf_full[row,(starting_cell)] <- u_time
        st_prf_full[row,(starting_cell + 1)] <- c_seats
        st_prf_full[row,(starting_cell + 2)] <- c_cost
        st_prf_full[row,(starting_cell + 3)] <- u_time
        st_prf_full[row,(starting_cell + 4)] <- o_seats
        st_prf_full[row,(starting_cell + 5)] <- o_cost
      }
      
      if (q_choice_id == 2) {
        st_prf_full[row,(starting_cell)] <- u_time
        st_prf_full[row,(starting_cell + 1)] <- o_seats
        st_prf_full[row,(starting_cell + 2)] <- o_cost
        st_prf_full[row,(starting_cell + 3)] <- u_time
        st_prf_full[row,(starting_cell + 4)] <- c_seats
        st_prf_full[row,(starting_cell + 5)] <- c_cost
      }
        
    }
  }
}
rm("o_seats","q_data","reference_row","u_time","col","index","q_choice_id","q_reference_id","row",
   "starting_cell","c_cost","c_seats","filled_matrix","o_cost","reference","temp_frame")

st_prf_full[3,] <- names(st_prf_full)
survey <- cbind(survey[,1:353],st_prf_full)
rm("st_prf_full")
write.csv(survey, paste(directory,"/art-dummy.csv",sep=''))

