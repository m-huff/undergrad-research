library(stringr) 
library(dummies) 
library(ape)

survey <- read.csv("C:/Users/micha/Desktop/art-survey-raw-newcols.csv")

#fix ZIP codes with leading zeroes for current address
survey$Q1 <- str_pad(survey$Q1, 5, side = "left", pad = "0")
survey$Q347 <- str_pad(survey$Q347, 5, side = "left", pad = "0")

#create a version to insert dummy variables into
survey_dummies <- survey

#AGE
temp_frame <- dummy(survey_dummies$Q2)[,3:7]
temp_frame[3,] <- c("age_cat_1", "age_cat_2", "age_cat_3", "age_cat_4", "age_cat_5")
survey_dummies <- cbind(survey_dummies[,1:21], temp_frame, survey_dummies[,22:ncol(survey_dummies)])

#RACE
temp_frame <- data.frame(rac_cat_1=character(),rac_cat_2=character(),rac_cat_3=character(),rac_cat_4=character(),
                         rac_cat_5=character(),rac_cat_6=character(),rac_cat_7=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$rac_cat_1<-ifelse(grepl("White/Caucasian",survey_dummies$Q3),"1","0")
temp_frame$rac_cat_2<-ifelse(grepl("Latino/Hispanic",survey_dummies$Q3),"1","0")
temp_frame$rac_cat_3<-ifelse(grepl("Black/African American",survey_dummies$Q3),"1","0")
temp_frame$rac_cat_4<-ifelse(grepl("Asian",survey_dummies$Q3),"1","0")
temp_frame$rac_cat_5<-ifelse(grepl("American Indian or Alaska Native",survey_dummies$Q3),"1","0")
temp_frame$rac_cat_6<-ifelse(grepl("Native Hawaiian or other Pacific Islander",survey_dummies$Q3),"1","0")
temp_frame$rac_cat_7<-ifelse(grepl("Self-describe",survey_dummies$Q3),"1","0")
temp_frame[3,] <- c("rac_cat_1","rac_cat_2","rac_cat_3","rac_cat_4","rac_cat_5","rac_cat_6","rac_cat_7")
survey_dummies <- cbind(survey_dummies[,1:27], temp_frame, survey_dummies[,28:ncol(survey_dummies)])

#GENDER
temp_frame <- dummy(survey_dummies$Q4)[,3:7]
temp_frame <- temp_frame[,-2]
temp_frame[3,] <- c("gen_cat_1","gen_cat_2","gen_cat_3","gen_cat_4")
survey_dummies <- cbind(survey_dummies[,1:36], temp_frame, survey_dummies[,37:ncol(survey_dummies)])

#EDUCATION
temp_frame <- dummy(survey_dummies$Q5)[,3:8]
temp_frame <- temp_frame[,-3]
temp_frame[3,] <- c("edu_cat_1","edu_cat_2","edu_cat_3","edu_cat_4","edu_cat_5")
survey_dummies <- cbind(survey_dummies[,1:42], temp_frame, survey_dummies[,43:ncol(survey_dummies)])

#INCOME
temp_frame <- dummy(survey_dummies$Q6)[,2:9]
temp_frame <- temp_frame[,-6]
temp_frame <- temp_frame[,-7]
temp_frame[3,] <- c("hhinc_cat_1","hhinc_cat_1","hhinc_cat_1","hhinc_cat_1","hhinc_cat_1",'hhinc_cat_1')
survey_dummies <- cbind(survey_dummies[,1:48], temp_frame, survey_dummies[,49:ncol(survey_dummies)])

#TENURE
temp_frame <- dummy(survey_dummies$Q7)[,4:6]
temp_frame[3,] <- c("ten_cat_1","ten_cat_2","ten_cat_3")
survey_dummies <- cbind(survey_dummies[,1:55], temp_frame, survey_dummies[,56:ncol(survey_dummies)])

#HOUSING TYPE
temp_frame <- dummy(survey_dummies$Q8)[,3:8]
temp_frame[3,] <- c("unit_cat_1","unit_cat_2","unit_cat_3","unit_cat_4","unit_cat_5","unit_cat_6")
survey_dummies <- cbind(survey_dummies[,1:60], temp_frame, survey_dummies[,61:ncol(survey_dummies)])

#HH ADULT COUNT
temp_frame <- dummy(survey_dummies$Q9)[,3:6]
temp_frame[3,] <- c("hhadu_cat_1","hhadu_cat_2","hhadu_cat_3","hhadu_cat_4")
survey_dummies <- cbind(survey_dummies[,1:68], temp_frame, survey_dummies[,69:ncol(survey_dummies)])

#CHILD COUNT
temp_frame <- dummy(survey_dummies$Q10)[,3:6]
temp_frame[3,] <- c("hhkid_cat_1","hhkid_cat_2","hhkid_cat_3","hhkid_cat_4")
survey_dummies <- cbind(survey_dummies[,1:73], temp_frame, survey_dummies[,74:ncol(survey_dummies)])

#BEFORE COVID ALL TRAVEL
temp_frame <- data.frame(b19_mode_1=character(),b19_mode_2=character(),b19_mode_3=character(),b19_mode_4=character(),
                         b19_mode_5=character(),b19_mode_6=character(),b19_mode_7=character(),b19_mode_8=character(),
                         b19_mode_9=character(),b19_mode10=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$b19_mode_1<-ifelse(grepl("Drive alone",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_2<-ifelse(grepl("Carpool, vanpool, or passenger in a car",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_3<-ifelse(grepl("Bus",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_4<-ifelse(grepl("Train",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_5<-ifelse(grepl("Bicycle",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_6<-ifelse(grepl("Walk",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_7<-ifelse(grepl("Ridehailing",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_8<-ifelse(grepl("Taxicab",survey_dummies$Q11),"1","0")
temp_frame$b19_mode_9<-ifelse(grepl("Electric-scooter",survey_dummies$Q11),"1","0")
temp_frame$b19_mode10<-ifelse(grepl("Other",survey_dummies$Q11),"1","0")
temp_frame[3,] <- c("b19_mode_1","b19_mode_2","b19_mode_3","b19_mode_4","b19_mode_5","b19_mode_6","b19_mode_7","b19_mode_8","b19_mode_9","b19_mode10")
survey_dummies <- cbind(survey_dummies[,1:78], temp_frame, survey_dummies[,79:ncol(survey_dummies)])

#BEFORE COVID MOST USED MODE
temp_frame <- dummy(survey_dummies$Q348)[,4:14]
temp_frame <- temp_frame[,-6]
temp_frame[3,] <- c("b19_pmod1","b19_pmod2","b19_pmod3","b19_pmod4","b19_pmod5","b19_pmod6","b19_pmod7","b19_pmod8","b19_pmod9","b19_pmod10")
survey_dummies <- cbind(survey_dummies[,1:90], temp_frame, survey_dummies[,91:ncol(survey_dummies)])

#DURING COVID ALL TRAVEL
temp_frame <- data.frame(d19_mode_1=character(),d19_mode_2=character(),d19_mode_3=character(),d19_mode_4=character(),
                         d19_mode_5=character(),d19_mode_6=character(),d19_mode_7=character(),d19_mode_8=character(),
                         d19_mode_9=character(),d19_mode10=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$d19_mode_1<-ifelse(grepl("Drive alone",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_2<-ifelse(grepl("Carpool, vanpool, or passenger in a car",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_3<-ifelse(grepl("Bus",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_4<-ifelse(grepl("Train",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_5<-ifelse(grepl("Bicycle",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_6<-ifelse(grepl("Walk",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_7<-ifelse(grepl("Ridehailing",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_8<-ifelse(grepl("Taxicab",survey_dummies$Q26),"1","0")
temp_frame$d19_mode_9<-ifelse(grepl("Electric-scooter",survey_dummies$Q26),"1","0")
temp_frame$d19_mode10<-ifelse(grepl("Other",survey_dummies$Q26),"1","0")
temp_frame[3,] <- c("d19_mode_1","d19_mode_2","d19_mode_3","d19_mode_4","d19_mode_5","d19_mode_6","d19_mode_7","d19_mode_8","d19_mode_9","d19_mode10")
survey_dummies <- cbind(survey_dummies[,1:102], temp_frame, survey_dummies[,103:ncol(survey_dummies)])

#DURING COVID MOST USED MODE
temp_frame <- dummy(survey_dummies$Q27)[,3:14]
temp_frame <- temp_frame[,-4]
temp_frame <- temp_frame[,-5]
temp_frame[3,] <- c("d19_pmod1","d19_pmod2","d19_pmod3","d19_pmod4","d19_pmod5","d19_pmod6","d19_pmod7","d19_pmod8","d19_pmod9","d19_pmod10")
survey_dummies <- cbind(survey_dummies[,1:114], temp_frame, survey_dummies[,115:ncol(survey_dummies)])

#AUTOMOBILES
temp_frame <- dummy(survey_dummies$Q31)[,3:6]
temp_frame[3,] <- c("hhcar_cat1","hhcar_cat2","hhcar_cat3","hhcar_cat4")
survey_dummies <- cbind(survey_dummies[,1:126], temp_frame, survey_dummies[,127:ncol(survey_dummies)])

#LICENSES
temp_frame <- data.frame(lic_cat_1=character(),lic_cat_2=character(),
                         lic_cat_3=character(),lic_cat_4=character(),
                         lic_cat_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$lic_cat_1<-ifelse(grepl("Driver's license",survey_dummies$Q32),"1","0")
temp_frame$lic_cat_2<-ifelse(grepl("Transit pass",survey_dummies$Q32),"1","0")
temp_frame$lic_cat_3<-ifelse(grepl("Carshare membership",survey_dummies$Q32),"1","0")
temp_frame$lic_cat_4<-ifelse(grepl("Bikeshare membership",survey_dummies$Q32),"1","0")
temp_frame$lic_cat_5<-ifelse(grepl("Other",survey_dummies$Q32),"1","0")
survey_dummies <- cbind(survey_dummies[,1:131], temp_frame, survey_dummies[,132:ncol(survey_dummies)])

#WORK
temp_frame <- data.frame(work_cat_1=character(),work_cat_2=character(),
                         work_cat_3=character(),work_cat_4=character(),
                         work_cat_5=character(),work_cat_6=character(),
                         work_cat_7=character(),work_cat_8=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$work_cat_1<-ifelse(grepl("Full-time work",survey_dummies$Q33),"1","0")
temp_frame$work_cat_2<-ifelse(grepl("Part-time work",survey_dummies$Q33),"1","0")
temp_frame$work_cat_3<-ifelse(grepl("Full-time student",survey_dummies$Q33),"1","0")
temp_frame$work_cat_4<-ifelse(grepl("Part-time student",survey_dummies$Q33),"1","0")
temp_frame$work_cat_5<-ifelse(grepl("Retired",survey_dummies$Q33),"1","0")
temp_frame$work_cat_6<-ifelse(grepl("Unemployed and looking for work",survey_dummies$Q33),"1","0")
temp_frame$work_cat_7<-ifelse(grepl("Unemployed and NOT looking for work",survey_dummies$Q33),"1","0")
temp_frame$work_cat_8<-ifelse(grepl("Other",survey_dummies$Q33),"1","0")
survey_dummies <- cbind(survey_dummies[,1:138], temp_frame, survey_dummies[,139:ncol(survey_dummies)])

#RIDEHAIL BEFORE COVID
temp_frame <- dummy(survey_dummies$Q35)[,4:11]
temp_frame <- temp_frame[,-6]
temp_frame[3,] <- c("b19_rhail_1","b19_rhail_2","b19_rhail_3","b19_rhail_4","b19_rhail_5","b19_rhail_6","b19_rhail_7")
survey_dummies <- cbind(survey_dummies[,1:148], temp_frame, survey_dummies[,149:ncol(survey_dummies)])

#RIDEHAIL DURING COVID
temp_frame <- dummy(survey_dummies$Q36)[,5:11]
temp_frame[3,] <- c("d19_rhail_1","d19_rhail_2","d19_rhail_3","d19_rhail_4","d19_rhail_5","d19_rhail_6","d19_rhail_7")
survey_dummies <- cbind(survey_dummies[,1:156], temp_frame, survey_dummies[,157:ncol(survey_dummies)])

#RIDEHAIL AFTER COVID
temp_frame <- dummy(survey_dummies$Q37)[,5:9]
temp_frame[3,] <- c("a19_rhail_1","a19_rhail_2","a19_rhail_3","a19_rhail_4","a19_rhail_5")
survey_dummies <- cbind(survey_dummies[,1:164], temp_frame, survey_dummies[,165:ncol(survey_dummies)])

#USED RIDEHAIL POOLED
temp_frame <- dummy(survey_dummies$Q38)[,3:7]
temp_frame <- temp_frame[,-3]
temp_frame <- temp_frame[,-3]
temp_frame[3,] <- c("past_pool_1","past_pool_2","past_pool_3")
survey_dummies <- cbind(survey_dummies[,1:170], temp_frame, survey_dummies[,171:ncol(survey_dummies)])

#USED AV
temp_frame <- dummy(survey_dummies$Q39)[,4:7]
temp_frame <- temp_frame[,-3]
temp_frame[3,] <- c("past_av_1","past_av_2","past_av_3")
survey_dummies <- cbind(survey_dummies[,1:174], temp_frame, survey_dummies[,175:ncol(survey_dummies)])

#TRIP TYPES BY TRAVEL OPTIONS - COMMERCIAL
temp_frame <- data.frame(topt_com_1=character(),topt_com_2=character(),
                         topt_com_3=character(),topt_com_4=character(),
                         topt_com_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$topt_com_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q40_1),"1","0")
temp_frame$topt_com_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q40_1),"1","0")
temp_frame$topt_com_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q40_1),"1","0")
temp_frame$topt_com_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q40_1),"1","0")
temp_frame$topt_com_5<-ifelse(grepl("None of these services",survey_dummies$Q40_1),"1","0")
survey_dummies <- cbind(survey_dummies[,1:178], temp_frame, survey_dummies[,179:ncol(survey_dummies)])

#TRIP TYPES BY TRAVEL OPTIONS - SHOPPING
temp_frame <- data.frame(topt_shp_1=character(),topt_shp_2=character(),
                         topt_shp_3=character(),topt_shp_4=character(),
                         topt_shp_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$topt_shp_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q40_2),"1","0")
temp_frame$topt_shp_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q40_2),"1","0")
temp_frame$topt_shp_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q40_2),"1","0")
temp_frame$topt_shp_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q40_2),"1","0")
temp_frame$topt_shp_5<-ifelse(grepl("None of these services",survey_dummies$Q40_2),"1","0")
survey_dummies <- cbind(survey_dummies[,1:184], temp_frame, survey_dummies[,185:ncol(survey_dummies)])

#TRIP TYPES BY TRAVEL OPTIONS - SOCIAL
temp_frame <- data.frame(topt_soc_1=character(),topt_soc_2=character(),
                         topt_soc_3=character(),topt_soc_4=character(),
                         topt_soc_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$topt_soc_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q40_3),"1","0")
temp_frame$topt_soc_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q40_3),"1","0")
temp_frame$topt_soc_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q40_3),"1","0")
temp_frame$topt_soc_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q40_3),"1","0")
temp_frame$topt_soc_5<-ifelse(grepl("None of these services",survey_dummies$Q40_3),"1","0")
survey_dummies <- cbind(survey_dummies[,1:190], temp_frame, survey_dummies[,191:ncol(survey_dummies)])

#TRIP TYPES BY TRAVEL OPTIONS - CHG
temp_frame <- data.frame(topt_chg_1=character(),topt_chg_2=character(),
                         topt_chg_3=character(),topt_chg_4=character(),
                         topt_chg_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$topt_chg_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q40_4),"1","0")
temp_frame$topt_chg_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q40_4),"1","0")
temp_frame$topt_chg_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q40_4),"1","0")
temp_frame$topt_chg_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q40_4),"1","0")
temp_frame$topt_chg_5<-ifelse(grepl("None of these services",survey_dummies$Q40_4),"1","0")
survey_dummies <- cbind(survey_dummies[,1:196], temp_frame, survey_dummies[,197:ncol(survey_dummies)])

#TRIP TYPES BY TRAVEL OPTIONS - OTHER
temp_frame <- data.frame(topt_oth_1=character(),topt_oth_2=character(),
                         topt_oth_3=character(),topt_oth_4=character(),
                         topt_oth_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$topt_oth_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q40_5),"1","0")
temp_frame$topt_oth_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q40_5),"1","0")
temp_frame$topt_oth_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q40_5),"1","0")
temp_frame$topt_oth_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q40_5),"1","0")
temp_frame$topt_oth_5<-ifelse(grepl("None of these services",survey_dummies$Q40_5),"1","0")
survey_dummies <- cbind(survey_dummies[,1:202], temp_frame, survey_dummies[,203:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - PERSONAL CAR NOT AVAILABLE
temp_frame <- data.frame(r1_nodrv_1=character(),r1_nodrv_2=character(),
                         r1_nodrv_3=character(),r1_nodrv_4=character(),
                         r1_nodrv_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_nodrv_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_1),"1","0")
temp_frame$r1_nodrv_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_1),"1","0")
temp_frame$r1_nodrv_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_1),"1","0")
temp_frame$r1_nodrv_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_1),"1","0")
temp_frame$r1_nodrv_5<-ifelse(grepl("None of these services",survey_dummies$Q41_1),"1","0")
survey_dummies <- cbind(survey_dummies[,1:208], temp_frame, survey_dummies[,209:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - NO PARKING
temp_frame <- data.frame(r1_noprk_1=character(),r1_noprk_2=character(),
                         r1_noprk_3=character(),r1_noprk_4=character(),
                         r1_noprk_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_noprk_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_2),"1","0")
temp_frame$r1_noprk_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_2),"1","0")
temp_frame$r1_noprk_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_2),"1","0")
temp_frame$r1_noprk_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_2),"1","0")
temp_frame$r1_noprk_5<-ifelse(grepl("None of these services",survey_dummies$Q41_2),"1","0")
survey_dummies <- cbind(survey_dummies[,1:214], temp_frame, survey_dummies[,215:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - MULTITASKING
temp_frame <- data.frame(r1_mtask_1=character(),r1_mtask_2=character(),
                         r1_mtask_3=character(),r1_mtask_4=character(),
                         r1_mtask_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_mtask_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_3),"1","0")
temp_frame$r1_mtask_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_3),"1","0")
temp_frame$r1_mtask_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_3),"1","0")
temp_frame$r1_mtask_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_3),"1","0")
temp_frame$r1_mtask_5<-ifelse(grepl("None of these services",survey_dummies$Q41_3),"1","0")
survey_dummies <- cbind(survey_dummies[,1:220], temp_frame, survey_dummies[,221:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - NO ROAD NETWORK
temp_frame <- data.frame(r1_notrn_1=character(),r1_notrn_2=character(),
                         r1_notrn_3=character(),r1_notrn_4=character(),
                         r1_notrn_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_notrn_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_4),"1","0")
temp_frame$r1_notrn_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_4),"1","0")
temp_frame$r1_notrn_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_4),"1","0")
temp_frame$r1_notrn_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_4),"1","0")
temp_frame$r1_notrn_5<-ifelse(grepl("None of these services",survey_dummies$Q41_4),"1","0")
survey_dummies <- cbind(survey_dummies[,1:226], temp_frame, survey_dummies[,227:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - QUICKER
temp_frame <- data.frame(r1_trnqck_1=character(),r1_trnqck_2=character(),
                         r1_trnqck_3=character(),r1_trnqck_4=character(),
                         r1_trnqck_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_trnqck_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_5),"1","0")
temp_frame$r1_trnqck_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_5),"1","0")
temp_frame$r1_trnqck_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_5),"1","0")
temp_frame$r1_trnqck_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_5),"1","0")
temp_frame$r1_trnqck_5<-ifelse(grepl("None of these services",survey_dummies$Q41_5),"1","0")
survey_dummies <- cbind(survey_dummies[,1:232], temp_frame, survey_dummies[,233:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - WEATHER
temp_frame <- data.frame(r1_wthr_1=character(),r1_wthr_2=character(),
                         r1_wthr_3=character(),r1_wthr_4=character(),
                         r1_wthr_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_wthr_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_6),"1","0")
temp_frame$r1_wthr_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_6),"1","0")
temp_frame$r1_wthr_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_6),"1","0")
temp_frame$r1_wthr_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_6),"1","0")
temp_frame$r1_wthr_5<-ifelse(grepl("None of these services",survey_dummies$Q41_6),"1","0")
survey_dummies <- cbind(survey_dummies[,1:238], temp_frame, survey_dummies[,239:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - HEALTH
temp_frame <- data.frame(r1_health_1=character(),r1_health_2=character(),
                         r1_health_3=character(),r1_health_4=character(),
                         r1_health_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_health_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_7),"1","0")
temp_frame$r1_health_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_7),"1","0")
temp_frame$r1_health_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_7),"1","0")
temp_frame$r1_health_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_7),"1","0")
temp_frame$r1_health_5<-ifelse(grepl("None of these services",survey_dummies$Q41_7),"1","0")
survey_dummies <- cbind(survey_dummies[,1:244], temp_frame, survey_dummies[,244:ncol(survey_dummies)])

survey_dummies <- survey_dummies[,-250]

#FACTORS FOR TRIP CHOICE - SECURITY
temp_frame <- data.frame(r1_secure_1=character(),r1_secure_2=character(),
                         r1_secure_3=character(),r1_secure_4=character(),
                         r1_secure_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_secure_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_8),"1","0")
temp_frame$r1_secure_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_8),"1","0")
temp_frame$r1_secure_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_8),"1","0")
temp_frame$r1_secure_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_8),"1","0")
temp_frame$r1_secure_5<-ifelse(grepl("None of these services",survey_dummies$Q41_8),"1","0")
survey_dummies <- cbind(survey_dummies[,1:250], temp_frame, survey_dummies[,251:ncol(survey_dummies)])

#FACTORS FOR TRIP CHOICE - OTHER
temp_frame <- data.frame(r1_other_1=character(),r1_other_2=character(),
                         r1_other_3=character(),r1_other_4=character(),
                         r1_other_5=character())

for (i in seq(1,2646,1)) {
  temp_frame[nrow(temp_frame) + 1,] <- NA
}

temp_frame$r1_other_1<-ifelse(grepl("Ridehailing (exclusive)",survey_dummies$Q41_9),"1","0")
temp_frame$r1_other_2<-ifelse(grepl("Ridesharing (pooled)",survey_dummies$Q41_9),"1","0")
temp_frame$r1_other_3<-ifelse(grepl("Autonomous ridehailing",survey_dummies$Q41_9),"1","0")
temp_frame$r1_other_4<-ifelse(grepl("Autonomous ridesharing",survey_dummies$Q41_9),"1","0")
temp_frame$r1_other_5<-ifelse(grepl("None of these services",survey_dummies$Q41_9),"1","0")
survey_dummies <- cbind(survey_dummies[,1:256], temp_frame, survey_dummies[,257:ncol(survey_dummies)])

#START OF 1-5 PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q43)[,1:7]
temp_frame <- temp_frame[,-2]
temp_frame <- temp_frame[,-1]
temp_frame[3,] <- c("av01_crash_1","av01_crash_2","av01_crash_3","av01_crash_4","av01_crash_5")
survey_dummies <- cbind(survey_dummies[,1:262], temp_frame, survey_dummies[,263:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q44)[,3:7]
temp_frame[3,] <- c("av02_roads_1","av02_roads_2","av02_roads_3","av02_roads_4","av02_roads_5")
survey_dummies <- cbind(survey_dummies[,1:268], temp_frame, survey_dummies[,269:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q45)[,3:7]
temp_frame[3,] <- c("av03_mcars_1","av03_mcars_2","av03_mcars_3","av03_mcars_4","av03_mcars_5")
survey_dummies <- cbind(survey_dummies[,1:274], temp_frame, survey_dummies[,275:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q46)[,3:7]
temp_frame[3,] <- c("av04_emerg_1","av04_emerg_2","av04_emerg_3","av04_emerg_4","av04_emerg_5")
survey_dummies <- cbind(survey_dummies[,1:280], temp_frame, survey_dummies[,281:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q47)[,3:7]
temp_frame[3,] <- c("av06_noexp_1","av06_noexp_2","av06_noexp_3","av06_noexp_4","av06_noexp_5")
survey_dummies <- cbind(survey_dummies[,1:286], temp_frame, survey_dummies[,287:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q48)[,3:7]
temp_frame[3,] <- c("av07_cyber_1","av07_cyber_2","av07_cyber_3","av07_cyber_4","av07_cyber_5")
survey_dummies <- cbind(survey_dummies[,1:292], temp_frame, survey_dummies[,293:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q49)[,3:7]
temp_frame[3,] <- c("av08_pinfo_1","av08_pinfo_2","av08_pinfo_3","av08_pinfo_4","av08_pinfo_5")
survey_dummies <- cbind(survey_dummies[,1:298], temp_frame, survey_dummies[,299:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q50)[,3:7]
temp_frame[3,] <- c("av09_alert_1","av09_alert_2","av09_alert_3","av09_alert_4","av09_alert_5")
survey_dummies <- cbind(survey_dummies[,1:304], temp_frame, survey_dummies[,305:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q51)[,3:7]
temp_frame[3,] <- c("av10_strng_1","av10_strng_2","av10_strng_3","av10_strng_4","av10_strng_5")
survey_dummies <- cbind(survey_dummies[,1:310], temp_frame, survey_dummies[,311:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q52)[,3:7]
temp_frame[3,] <- c("av11_child_1","av11_child_2","av11_child_3","av11_child_4","av11_child_5")
survey_dummies <- cbind(survey_dummies[,1:316], temp_frame, survey_dummies[,317:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q53)[,3:7]
temp_frame[3,] <- c("av12_human_1","av12_human_2","av12_human_3","av12_human_4","av12_human_5")
survey_dummies <- cbind(survey_dummies[,1:322], temp_frame, survey_dummies[,323:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q54)[,3:7]
temp_frame[3,] <- c("av13_atten_1","av13_atten_2","av13_atten_3","av13_atten_4","av13_atten_5")
survey_dummies <- cbind(survey_dummies[,1:328], temp_frame, survey_dummies[,329:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q55)[,3:7]
temp_frame[3,] <- c("av14_dtect_1","av14_dtect_2","av14_dtect_3","av14_dtect_4","av14_dtect_5")
survey_dummies <- cbind(survey_dummies[,1:334], temp_frame, survey_dummies[,335:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q56)[,3:7]
temp_frame[3,] <- c("av15_traff_1","av15_traff_2","av15_traff_3","av15_traff_4","av15_traff_5")
survey_dummies <- cbind(survey_dummies[,1:340], temp_frame, survey_dummies[,341:ncol(survey_dummies)])

#PREFERENCE AGREE/DISAGREE QUESTIONS
temp_frame <- dummy(survey_dummies$Q57)[,3:7]
temp_frame[3,] <- c("av16_oride_1","av16_oride_2","av16_oride_3","av16_oride_4","av16_oride_5")
survey_dummies <- cbind(survey_dummies[,1:346], temp_frame, survey_dummies[,347:ncol(survey_dummies)])



#create separate frame for new stated choice format
#'squeeze' data frame by only pulling populated answer fields
#stated_pref <- survey[,81:324]
stated_pref <- survey_dummies[,352:595]

for(col in 1:ncol(stated_pref)) {
  stated_pref[col] <- Map(paste, str_split(stated_pref[2,col], "\"")[[1]][4], stated_pref[col])
}
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

for (index in seq(1, 2646, 1)) {
  if (ncol(stated_pref.list[[index]]) == 0) {
    for(i in seq(1,27,1))
      stated_pref.list[[index]][,i] <- NA
  }
  if (ncol(stated_pref.list[[index]]) == 9) {
    for(i in seq(10,27,1))
      stated_pref.list[[index]][,i] <- NA
  }
  if (ncol(stated_pref.list[[index]]) == 18) {
    for(i in seq(19,27,1))
      stated_pref.list[[index]][,i] <- NA
  }
}
rm("i")
  
for (index in seq(1, length(stated_pref.list), 1)) {
 filled_matrix[nrow(filled_matrix) + 1,] = stated_pref.list[[index]]
}
rm("index","stated_pref","stated_pref.list")

#build output sheet, run through 'squeezed' data
reference <- read.csv("C:/Users/micha/Desktop/art-survey-reference.csv")

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

#loop through all cells in filled_matrix, one by one to keep it in order
#split the string, read question number and choice - 1/2
for (row in seq(1, 2646, 1)) {
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
rm("o_seats","q_data","reference_row","u_time","col","index","q_choice_id",
   "q_reference_id","row","starting_cell","c_cost","c_seats","filled_matrix",
   "o_cost","reference")

#srvy_no_dummies <- cbind(survey[,1:80],st_prf_full)
srvy_no_dummies <- cbind(survey_dummies[,1:351],st_prf_full)

#write.csv(srvy_no_dummies, "C:/Users/micha/Desktop/art-no-dummy.csv")
write.csv(srvy_no_dummies, "C:/Users/micha/Desktop/art-dummy.csv")

