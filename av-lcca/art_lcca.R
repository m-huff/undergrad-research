### AV SURVEY LCCA SCRIPT ###
### MICHAEL HUFF ###

# Install packages.
lapply(c("mclust","pastecs","dplyr","stringr","useful"), library, character.only = TRUE)

# Load survey data and remove incomplete records.
dat <- read.csv("D:/Manually Transferred Files/AV Research/art-change.csv",header=TRUE)
dat <- subset(dat, progress == '100')

### Manipulate the survey data into the above format where the survey
### collected it and we binned it differently. Each change is described
### below through comments.

# Change age to correct categories.
dat$age_cat_2_3 <- dat$age_cat_2 + dat$age_cat_3

# Turn all of the educational variables into a college dummy.
dat$college <- dat$edu_cat_1 + dat$edu_cat_2 + dat$edu_cat_3

# Create new variable that captures whether or not respondent is a student.
dat$student<-ifelse(grepl("-time student",dat$work_cat),"1","0")

# Reclassify the income variables to trim them down to four distinct
# categories for easier latent class clustering.
dat$hhinc_2_3 <- dat$hhinc_cat_2 + dat$hhinc_cat_3
dat$hhinc_4_5 <- dat$hhinc_cat_4 + dat$hhinc_cat_5
dat$hhinc_6_7 <- dat$hhinc_cat_6 + dat$hhinc_cat_7

# Reclass the HH composition variables.
dat$hhkid_2_more <- dat$hhkid_cat_3 + dat$hhkid_cat_4
dat$hhadu_3_more <- dat$hhadu_cat_3 + dat$hhadu_cat_4

# Reclass occupational variable into three dummies.
dat$working<-ifelse(grepl("-time work",dat$work_cat),"1","0")
dat$retired<-ifelse(grepl("Retired",dat$work_cat) & dat$working == 0,"1","0")
dat$unemployed<-ifelse(grepl("Unemployed",dat$work_cat) & dat$working == 0 & dat$retired == 0,"1","0")

# Break down the household vehicles variables into cars per adult dummies.
dat$cars_per_adult <- round(as.numeric(substr(dat$hhcar_cat, 1, 1)) / 
                              as.numeric(substr(dat$hhadu_cat, 1, 1)), digits = 2)

# dat$cpa_1<-ifelse(dat$cars_per_adult == 0,"1","0")
# dat$cpa_2<-ifelse(dat$cars_per_adult > 0 & dat$cars_per_adult < 1,"1","0")
# dat$cpa_3<-ifelse(dat$cars_per_adult == 1,"1","0")
# dat$cpa_4<-ifelse(dat$cars_per_adult > 1,"1","0")
dat$no_hhcar <- ifelse(dat$cars_per_adult == 0,"1","0")
dat$hhcar_1up <- ifelse(dat$cars_per_adult >= 1,"1","0")

# Create binary variable that indicates whether or not there
# are any children present in the household.
dat$kids<-dat$hhkid_cat_2+dat$hhkid_cat_3+dat$hhkid_cat_4

### Now that our variables are classified like we want them to be,
### we'll pull them out of the full data set and into their own
### data frames for isolated viewing and manipulation.

vars_indiv <- data.frame(dat$age_cat_1, dat$age_cat_2_3, dat$age_cat_4, 
                         dat$age_cat_5, dat$gen_cat_1, dat$college, 
                         dat$student, dat$working, dat$hhinc_cat_1, 
                         dat$hhinc_2_3, dat$hhinc_4_5, dat$hhinc_6_7,
                         dat$kids, dat$hhadu_cat_1, dat$hhadu_cat_2, 
                         dat$hhadu_3_more)

vars_indiv <- vars_indiv %>% mutate_all(na_if,"")
vars_indiv <- na.omit(vars_indiv)
vars_indiv <- data.frame(lapply(vars_indiv,as.numeric))

# Pull our relevant variables into MOBILITY VARIABLES DATAFRAME.
vars_mobil <- data.frame(dat$lic_cat_2, dat$lic_cat_3, dat$lic_cat_4,
                         dat$no_hhcar, dat$hhcar_1up)

vars_mobil <- vars_mobil %>% mutate_all(na_if,"")
vars_mobil <- na.omit(vars_mobil)
vars_mobil <- data.frame(lapply(vars_mobil,as.numeric))



#####################
### INTO THE LCCA ###
#####################

# BIC and LCCA estimation for mobility vars.
m1bic <- mclustBIC(vars_mobil)
summary(m1bic)

m1 <- Mclust(vars_mobil, x=m1bic)
summary(m1, parameters=TRUE)
# plot(m1, what = "classification")
table(m1$classification)


# BIC and LCCA estimation for individual- and household-level vars.
m2bic <- mclustBIC(vars_indiv)
summary(m2bic)

m2 <- Mclust(vars_indiv, x=m2bic)
summary(m2, parameters=TRUE)
# plot(m2, what = "classification")
table(m2$classification)



# Examine LCCA results
# Class assignment and relative probability of class assignment
dat$indiv_lcca <- m2$classification
i_cabix3 <- round(m2$z,5)
i_cabix3 <- as.data.frame(as.matrix(i_cabix3))
colnames(i_cabix3) <- c("M_ZSCORE1","M_ZSCORE2","M_ZSCORE3","M_ZSCORE4","M_ZSCORE_5","M_ZSCORE_6")
dat <- cbind(dat,i_cabix3)
head(dat)

write.csv(dat, file="C:/Users/micha/Desktop/art-indiv.csv")
