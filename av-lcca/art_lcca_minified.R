### QUESTIONS REMAINING
# What to do if a respondent only put one of the races we aren't using in the cluster analysis?
# What to do if a user put multiple races? Is this all going to be dummies?

library("mclust")
library("pastecs")
library("dplyr")
library("stringr")

dat <- read.csv("D:/Manually Transferred Files/AV Research/art-change.csv",header=TRUE)

# We need to only use complete records. This comes back into
# play when we create separate data frames for each LCCA.
dat <- subset(dat, progress == '100')

### MOBILITY CLUSTER VARIABLES
  # HH Cars
    # 0
    # 1
    # 2
    # 3 or more
  # Driver's License
    # Yes/No
  # Transit Pass
    # Yes/No
  # Carshare Membership
    # Yes/No
  # Bikeshare Membership
    # Yes/No

### INDIVIDUAL CLUSTER VARIABLES
  # AGE
    # 18-34 
    # 35-44
    # 45-64
    # Over 65
  # Male
    # Yes/No
  # Education
    # Less than bachelors
    # Bachelors
    # Graduate degree
  # Occupation (Working)
    # Yes/No
  # Student
    # Yes/No

### HOUSEHOLD CLUSTER VARS (SAME CLUSTER MODEL AS INDIVIDUAL)
  # HH Income
    # Under $35,000
    # $35,000 - $75,000
    # $75,000 - $150,000
    # Above $150,000
  # HH Children
    # 0
    # 1
    # 2 or more
  # HH Adults
    # 1
    # 2
    # 3 or more

### Manipulate the survey data into the above format where the survey
### collected it and we binned it differently. Each change is described
### below through comments.

# Change age to correct categories.
dat$age_cat_1_2 <- dat$age_cat_1 + dat$age_cat_2

# Bin together the educational categories below bachelors into
# a 'Less than bachelors' category, and change to numeric.
dat$edu_cat_1_2 <- dat$edu_cat_1 + dat$edu_cat_2
dat$edu_cat_less <- dat$edu_cat_1_2 + dat$edu_cat_3

# Create new variable that captures whether or not respondent is a student.
dat$student<-ifelse(grepl("-time student",dat$work_cat),"1","0")

# Reclassify the income variables to trim them down to four distinct
# categories for easier latent class clustering.
dat$hhinc_1_2 <- dat$hhinc_cat_1 + dat$hhinc_cat_2
dat$hhinc_3_4 <- dat$hhinc_cat_3 + dat$hhinc_cat_4
dat$hhinc_5_6 <- dat$hhinc_cat_5 + dat$hhinc_cat_6

# Reclass the HH composition variables to have three variables for them
# across the board.
dat$hhkid_2_more <- dat$hhkid_cat_3 + dat$hhkid_cat_4
dat$hhadu_3_more <- dat$hhadu_cat_3 + dat$hhadu_cat_4

# Reclass occupational variable into either working (work or student)
# or retired/unemployed. Searching for the phrase "-time" captures
# all of these variables.
dat$work_bin<-ifelse(grepl("-time",dat$work_cat),"1","0")

### Now that our variables are classified like we want them to be,
### we'll pull them out of the full data set and into their own
### data frames for isolated viewing and manipulation.

# Pull our relevant variables into INDIVIDUAL VARIABLES DATAFRAME
vars_indiv <- dat[,c(549,50,51,52,63,551,72,73,552,558,553,554,555,81,102,103,556,97,98,557)]
colnames(vars_indiv) <- c("AGE_1","AGE_2","AGE_3","AGE_4",
                          "MALE",
                          "EDU_1","EDU_2","EDU_3",
                          "STUDENT","WORKING",
                          "HHINC_1","HHINC_2","HHINC_3","HHINC_4",
                          "HHKID_0","HHKID_1","HHKID_2+",
                          "HHADU_1","HHADU_2","HHADU_3+")


# Fix numeric/character typings in these columns, remove non-numeric.
vars_indiv <- vars_indiv %>% mutate_all(na_if,"")
vars_indiv <- na.omit(vars_indiv)
vars_indiv <- data.frame(lapply(vars_indiv,as.numeric))


# Pull our relevant variables into MOBILITY VARIABLES DATAFRAME
vars_mobil <- dat[,c(155,156,157,158,160,161,162,163)]
colnames(vars_mobil) <- c("HHCAR_0","HHCAR_1","HHCAR_2","HHCAR_3+",
                          "DRIVERS_LIC","TRNS_PASS","CARSHR_MEM",
                          "BIKESHR_MEM")

vars_mobil <- vars_mobil %>% mutate_all(na_if,"")
vars_mobil <- na.omit(vars_mobil)
vars_mobil <- data.frame(lapply(vars_mobil,as.numeric))

#####################
### INTO THE LCCA ###
#####################

# Estimate BIC (Bayesian information criterion) for the MOBILITY variables.
m1bic <- mclustBIC(vars_mobil)
m1bic <- mclustBIC(vars_mobil, G=1:15, x=m1bic)
summary(m1bic)

# Estimate BIC (Bayesian information criterion) for the INDIVIDUAL variables.
m2bic <- mclustBIC(vars_indiv)
m2bic <- mclustBIC(vars_indiv, G=1:20, x=m2bic)
summary(m2bic)

#LCCA for MOBILITY VARIABLES
m1 <- Mclust(vars_mobil, x=m1bic, )
summary(m1, parameters=TRUE)
plot(m1, what = "classification")
table(m1$classification)

#LCCA for INDIVIDUAL VARIABLES
m2 <- Mclust(vars_indiv, x=m2bic)
summary(m2, parameters=TRUE)
plot(m2, what = "classification")
table(m2$classification)

# Examine LCCA results
# Class assignment and relative probability of class assignment
dat$mobil_lcca <- m1$classification
dat$indiv_lcca <- m2$classification
m_cabix3 <- round(m1$z,5)
m_cabix3 <- as.data.frame(as.matrix(m_cabix3))
i_cabix3 <- round(m2$z,5)
i_cabix3 <- as.data.frame(as.matrix(i_cabix3))
colnames(m_cabix3) <- c("M_ZSCORE1","M_ZSCORE2","M_ZSCORE3","M_ZSCORE4","M_ZSCORE_5", "M_ZSCORE_6")
colnames(i_cabix3) <- c("I_ZSCORE1","I_ZSCORE2","I_ZSCORE3","I_ZSCORE4")
dat <- cbind(dat,m_cabix3)
dat <- cbind(dat,i_cabix3)
head(dat)

# Calculate average probability of alternative cluster classifications
# m_cl1 <- dat[dat$mobil_lcca==1,]
# m_cl2 <- dat[dat$mobil_lcca==2,]
# m_cl3 <- dat[dat$mobil_lcca==3,]
# m_cl4 <- dat[dat$mobil_lcca==4,]
# m_cl4 <- dat[dat$mobil_lcca==5,]
# m_cl4 <- dat[dat$mobil_lcca==6,]
# m_cl1x <- round(colMeans(m_cl1[,43:46]),2)
# m_cl2x <- round(colMeans(m_cl2[,43:46]),2)
# m_cl3x <- round(colMeans(m_cl3[,43:46]),2)
# m_cl4x <- round(colMeans(m_cl4[,43:46]),2)

# i_cl1 <- dat[dat$indiv_lcca==1,]
# i_cl2 <- dat[dat$indiv_lcca==2,]
# i_cl3 <- dat[dat$indiv_lcca==3,]
# _cl4 <- dat[dat$indiv_lcca==4,]
# i_cl1x <- round(colMeans(i_cl1[,43:46]),2)
# i_cl2x <- round(colMeans(i_cl2[,43:46]),2)
# i_cl3x <- round(colMeans(i_cl3[,43:46]),2)
# i_cl4x <- round(colMeans(i_cl4[,43:46]),2)

# m_m1tab <- do.call("rbind", list(m_cl1x, m_cl2x, m_cl3x, m_cl4x))
# _m1tab <- as.data.frame(as.matrix(m_m1tab))

# i_m2tab <- do.call("rbind", list(i_cl1x, i_cl2x, i_cl3x, i_cl4x))
# i_m2tab <- as.data.frame(as.matrix(i_m2tab))

# print(m1tab)
# print(m2tab)

write.csv(dat, file="D:/Manually Transferred Files/AV Research/art-lcca.csv")