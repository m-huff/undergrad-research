### QUESTIONS REMAINING
# What to do if a respondent only put one of the races we aren't using in the cluster analysis?
# What to do if a user put multiple races? Is this all going to be dummies?

library("mclust")
library("pastecs")
library("dplyr")
library("stringr")

dat <- read.csv("C:/Users/micha/Desktop/AV Research/art-change.csv",header=TRUE)

# We need to only use complete records. This comes back into
# play when we create separate data frames for each LCCA.
dat <- subset(dat, progress == '100')

### MOBILITY CLUSTER VARIABLES
# Vehicle ownership (Cars per household, 0/1/more)
# Driver's license (Yes/No)
# Transit pass (Yes/No)
# Carshare membership (Yes/No)
# Bikeshare membership (Yes/No)

### INDIVIDUAL CLUSTER VARIABLES
# AGE
  # 18-34 - 1
  # 35-44 - 2
  # 45-64 - 3
  # Over 65 - 4
# Race (ASI, BAA, WHI, LAT)
# Gender (M/F/O)
# Education (Less than bachelors/Bachelors/Grad degree)
# Occupation (Part-/Full-time or Unemployed/Retired)
# Student (Yes/No)

### HOUSEHOLD CLUSTER VARS (SAME CLUSTER MODEL AS INDIVIDUAL)
# HH Income (Categorical - Steve)
# HH Children (0/1/2 or more)
# HH Adults (1/2/3 or more)

### Manipulate the survey data into the above format where the survey
### collected it and we binned it differently. Each change is described
### below through comments.

# Change age to numeric categories.
dat$age_cat <-replace(dat$age_cat, dat$age_cat %in% c("18 - 24 years", 
                                                      "25 - 34 years"), 1)
dat$age_cat <-replace(dat$age_cat, dat$age_cat %in% c("35 - 44 years"), 2)
dat$age_cat <-replace(dat$age_cat, dat$age_cat %in% c("45 - 64 years"), 3)
dat$age_cat <-replace(dat$age_cat, dat$age_cat %in% c("65+ years"), 4)

# Bin together the educational categories below bachelors into
# a 'Less than bachelors' category, and change to numeric.
dat$edu_cat<-replace(dat$edu_cat, dat$edu_cat %in% c("Associate degree or some college",
                                                     "High school degree or equivalent",
                                                     "Some high school"), 1)
dat$edu_cat<-replace(dat$edu_cat, dat$edu_cat %in% c("Bachelor degree"), 2)
dat$edu_cat<-replace(dat$edu_cat, dat$edu_cat %in% c("Graduate degree (Masters, PhD)"), 3)

# Create new variable that captures whether or not respondent is a student.
dat$student<-ifelse(grepl("-time student",dat$work_cat),"1","0")

# Reclass occupational variable into either working (work or student)
# or retired/unemployed. Searching for the phrase "-time" captures
# all of these variables.
dat$work_cat<-ifelse(grepl("-time",dat$work_cat),"1","0")

# Reclassify the income variables to trim them down to four distinct
# categories for easier latent class clustering.
dat$hhinc_cat<-replace(dat$hhinc_cat, dat$hhinc_cat %in% c("Under $15,000", "$15,000 - $34,999"), 1)
dat$hhinc_cat<-replace(dat$hhinc_cat, dat$hhinc_cat %in% c("$35,000 - $49,999", "$50,000 - $74,999"), 2)
dat$hhinc_cat<-replace(dat$hhinc_cat, dat$hhinc_cat %in% c("$75,000 - $99,999", "$100,000 - $149,999"), 3)
dat$hhinc_cat<-replace(dat$hhinc_cat, dat$hhinc_cat %in% "Above $150,000", 4)

# Reclass the HH composition variables to have three variables for them
# across the board.
dat$hhadu_cat<-replace(dat$hhadu_cat, dat$hhadu_cat %in% c("3", "4 or more"),
                                                           3)
dat$hhkid_cat<-replace(dat$hhkid_cat, dat$hhkid_cat %in% c("2", "3 or more"),
                                                           2)

# Reclass race to capture all of the racial/ethnic groups represented
# as greater than 2% of the total population. When reclassing race, we
# grab the respondent's selection that is contained within the four
# groups we will be analyzing.
for (i in seq(1,length(dat$rac_cat),1)) {dat$rac_cat[i]<-str_split(dat$rac_cat[i],",")[[1]][1]}
dat$rac_cat <- replace(dat$rac_cat, dat$rac_cat %in% "White/Caucasian", 1)
dat$rac_cat <- replace(dat$rac_cat, dat$rac_cat %in% "Black/African American", 2)
dat$rac_cat <- replace(dat$rac_cat, dat$rac_cat %in% "Latino/Hispanic", 3)
dat$rac_cat <- replace(dat$rac_cat, dat$rac_cat %in% "Asian", 4)

#Reclass the HH automobiles question to have three bins.
dat$hhcar_cat <- replace(dat$hhcar_cat, dat$hhcar_cat %in% c("2", "3 or more"), 
                                                             2)

### Now that our variables are classified like we want them to be,
### we'll pull them out of the full data set and into their own
### data frames for isolated viewing and manipulation.

# Pull our relevant variables into two new, trimmed data frames - one for
# individual variables, and one for mobility variables. We also change
# blanks to NAs so we can exclude them.
vars_indiv <- dat[,c(47,53,63,68,166,549,74,96,101)]
colnames(vars_indiv) <- c("AGE_CAT","RACE_CAT","MALE_DMY","EDU_CAT","WORK_DMY",
                          "STU_DMY","HHINC_CAT","HHADU_CAT","HHKID_CAT")

### REMOVE THIS LATER - TALK TO STEVE
### THIS IS BAD
vars_indiv <- subset(vars_indiv, grepl('^\\d+$', vars_indiv$RACE_CAT))

# Fix numeric/character typings in these columns, remove non-numeric.
vars_indiv <- subset(vars_indiv, grepl('^\\d+$', vars_indiv$RACE_CAT))
vars_indiv <- subset(vars_indiv, grepl('^\\d+$', vars_indiv$HHINC_CAT))
vars_indiv <- vars_indiv %>% mutate_all(na_if,"")
vars_indiv <- na.omit(vars_indiv)

vars_indiv <- data.frame(lapply(vars_indiv,as.numeric))

vars_indiv <- vars_indiv %>% mutate_all(na_if,"")
vars_indiv <- na.omit(vars_indiv)

vars_mobil <- dat[,c(154,160,161,162,163)]
colnames(vars_mobil) <- c("HHCAR_CAT","DRIVER_LIC","TRNS_PASS","CSHR_MEM",
                          "BSHR_MEM")

# Fix numeric/character typings in these columns.
vars_mobil$HHCAR_CAT <- as.numeric(vars_mobil$HHCAR_CAT)

vars_mobil <- vars_mobil %>% mutate_all(na_if,"")
vars_mobil <- na.omit(vars_mobil)

rm("dat","i")
#####################
### INTO THE LCCA ###
#####################

# Estimate BIC (Bayesian information criterion) for the mobility variables.
m1bic <- mclustBIC(vars_mobil)
m1bic <- mclustBIC(vars_mobil, G=1:6, x=m1bic)
summary(m1bic)

# Estimate BIC (Bayesian information criterion) for the indiv variables.
m2bic <- mclustBIC(vars_indiv)
m2bic <- mclustBIC(vars_indiv, G=2:5, x=m2bic)
summary(m2bic)

#LCCA
m1 <- Mclust(vars_mobil, x=m1bic, )
summary(m1, parameters=TRUE)
plot(m1, what = "classification")
table(m1$classification)

#LCCA
m2 <- Mclust(vars_indiv, x=m2bic)
summary(m2, parameters=TRUE)
plot(m2, what = "classification")
table(m2$classification)





#### NEED TO TEAR INTO THESE

# Examine LCCA results
# Class assignment and relative probability of class assignment
dat$CLUSTER <- m1$classification
cabix3 <- round(m1$z,5)
cabix3 <- as.data.frame(as.matrix(cabix3))
colnames(cabix3) <- c("ZSCORE1","ZSCORE2","ZSCORE3","ZSCORE4")
dat <- cbind(dat,cabix3)
head(dat)

# Calculate average probability of alternative cluster classifications
cl1 <- dat[dat$CLUSTER==1,]
cl2 <- dat[dat$CLUSTER==2,]
cl3 <- dat[dat$CLUSTER==3,]
cl4 <- dat[dat$CLUSTER==4,]
cl1x <- round(colMeans(cl1[,43:46]),2)
cl2x <- round(colMeans(cl2[,43:46]),2)
cl3x <- round(colMeans(cl3[,43:46]),2)
cl4x <- round(colMeans(cl4[,43:46]),2)
m1tab <- do.call("rbind", list(cl1x, cl2x, cl3x, cl4x))
m1tab <- as.data.frame(as.matrix(m1tab))
print(m1tab)

write.csv(dat[,-1], file="C:/Users/micha/Desktop/AV Research/art-lcca.csv")