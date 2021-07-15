library("caret")
library("foreign")
library("ggplot2")
library("MASS")

out_folder <- "C:/Users/micha/Desktop/"

#run initial correlation between all variables
data = read.csv(paste(out_folder,"tracts-x.csv",sep=""),stringsAsFactors=T)
table <- round(cor(data), 2)

#remove non-correlated columns
table <- as.data.frame.matrix(table)
table <- table[abs(table$TRIP.ORIGINS) >= 0.1, abs(table$TRIP.ORIGINS) >= 0.1]

#reduce data based on multicollinearity results to just 
#those significant in one or more of the four models

vars1 <- c("TRIP_ORIGINS","TRIP_DESTI","TRIP_ACTIV","TRIP_VMT","INTR_PER_ACRE","RESIDENTIAL_ROADS_PERC",
           "RAPID_TRANSIT_ACCESS","TOTAL_EMPLOYMENT","JOBS_PPL_PER_ARCE",
           "POP_FEMALE_PERC","POP_AGE_18_34_PERC","POP_AGE_45_64_PERC","POP_AGE_65_PERC","EDU_2_PERC",
           "RACE_BAA_PERC","RACE_OTHER","VEH_1","TENURE_OWN_PERC","AVG_HH_SIZE_RENT","CONNECTED_NODE_RATIO")
dat1 <- data[,vars1]


##############################################
##############################################
############## COMBINED MODELS ###############
##############################################
##############################################


# Full origin model
# zeroes error seems to only occur here
mod2a <- glm.nb(TRIP_ORIGINS ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  JOBS_PPL_PER_ARCE + POP_FEMALE_PERC + POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
                  EDU_2_PERC + RACE_OTHER + VEH_1 + AVG_HH_SIZE_RENT +
                  TENURE_OWN_PERC + CONNECTED_NODE_RATIO + RAPID_TRANSIT_ACCESS,
                data=dat1)
summary(mod2a); logLik(mod2a)

# Full destination model
mod2a <- glm.nb(TRIP_DESTI ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
               JOBS_PPL_PER_ARCE + POP_FEMALE_PERC + POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
               EDU_2_PERC + RACE_OTHER + VEH_1 + AVG_HH_SIZE_RENT +
               TENURE_OWN_PERC + CONNECTED_NODE_RATIO + RAPID_TRANSIT_ACCESS,
               data=dat1)
summary(mod2a); logLik(mod2a)

# Trimmed destination model
mod2a <- glm.nb(TRIP_DESTI ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  JOBS_PPL_PER_ARCE + POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
                  EDU_2_PERC + RACE_OTHER + VEH_1 +
                  CONNECTED_NODE_RATIO,
                data=dat1)
summary(mod2a); logLik(mod2a)



# Full activity model
mod2a <- glm.nb(TRIP_ACTIV ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  JOBS_PPL_PER_ARCE + POP_FEMALE_PERC + POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
                  POP_AGE_65_PERC + EDU_2_PERC + RACE_BAA_PERC + RACE_OTHER + VEH_1 + 
                  TENURE_OWN_PERC + AVG_HH_SIZE_RENT + CONNECTED_NODE_RATIO + RAPID_TRANSIT_ACCESS,
                data=dat1)
summary(mod2a); logLik(mod2a)

# Trimmed activity model
mod2a <- glm.nb(TRIP_ACTIV ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  POP_FEMALE_PERC + POP_AGE_18_34_PERC + 
                  POP_AGE_65_PERC + EDU_2_PERC + RACE_BAA_PERC + RACE_OTHER + 
                  AVG_HH_SIZE_RENT + CONNECTED_NODE_RATIO,
                data=dat1)
summary(mod2a); logLik(mod2a)




# Full VMT model
mod2a <- glm.nb(TRIP_VMT ~ RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  POP_FEMALE_PERC + POP_AGE_45_64_PERC + POP_AGE_65_PERC + 
                  TENURE_OWN_PERC + AVG_HH_SIZE_RENT + CONNECTED_NODE_RATIO + 
                  RAPID_TRANSIT_ACCESS,
                data=dat1)
summary(mod2a); logLik(mod2a)

# Trimmed VMT model
mod2a <- glm.nb(TRIP_VMT ~ RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  POP_AGE_65_PERC + TENURE_OWN_PERC + CONNECTED_NODE_RATIO + 
                  RAPID_TRANSIT_ACCESS,
                data=dat1)
summary(mod2a); logLik(mod2a)



##############################################
##############################################
############ SOCIOECONOMIC MODELS ############
##############################################
##############################################



# Socioeconomic destination model
mod2a <- glm.nb(TRIP_DESTI ~ 
                  POP_FEMALE_PERC + POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
                  EDU_2_PERC + RACE_OTHER + VEH_1 + AVG_HH_SIZE_RENT +
                  TENURE_OWN_PERC,
                data=dat1)
summary(mod2a); logLik(mod2a)

# Trimmed socioeconomic destination model
mod2a <- glm.nb(TRIP_DESTI ~ 
                  POP_FEMALE_PERC + POP_AGE_18_34_PERC + 
                  EDU_2_PERC + RACE_OTHER + VEH_1 +
                  TENURE_OWN_PERC, data=dat1)
summary(mod2a); logLik(mod2a)



# Socioeconomic activity model
mod2a <- glm.nb(TRIP_ACTIV ~ POP_FEMALE_PERC + POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
                  POP_AGE_65_PERC + EDU_2_PERC + RACE_BAA_PERC + RACE_OTHER + VEH_1 + 
                  TENURE_OWN_PERC + AVG_HH_SIZE_RENT, data=dat1)
summary(mod2a); logLik(mod2a)

# Trimmed socioeconomic activity model
mod2a <- glm.nb(TRIP_ACTIV ~ POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
                  POP_AGE_65_PERC + EDU_2_PERC + RACE_OTHER + 
                  TENURE_OWN_PERC + AVG_HH_SIZE_RENT, data=dat1)
summary(mod2a); logLik(mod2a)



# Socioeconomic VMT model
mod2a <- glm.nb(TRIP_VMT ~ POP_FEMALE_PERC + POP_AGE_45_64_PERC + POP_AGE_65_PERC + 
                  TENURE_OWN_PERC + AVG_HH_SIZE_RENT, data=dat1)
summary(mod2a); logLik(mod2a)

# Trimmed socioeconomic VMT model
mod2a <- glm.nb(TRIP_VMT ~ POP_FEMALE_PERC + POP_AGE_65_PERC + 
                  TENURE_OWN_PERC + AVG_HH_SIZE_RENT, data=dat1)
summary(mod2a); logLik(mod2a)



# Socioeconomic origin model
mod2a <- glm.nb(TRIP_ORIGINS ~ POP_FEMALE_PERC + POP_AGE_18_34_PERC + POP_AGE_45_64_PERC + 
                  EDU_2_PERC + RACE_OTHER + VEH_1 + AVG_HH_SIZE_RENT +
                  TENURE_OWN_PERC, data=dat1)
summary(mod2a); logLik(mod2a)

# Trimmed socioeconomic origin model
mod2a <- glm.nb(TRIP_ORIGINS ~ POP_FEMALE_PERC + POP_AGE_18_34_PERC + 
                  EDU_2_PERC + RACE_OTHER + TENURE_OWN_PERC, data=dat1)
summary(mod2a); logLik(mod2a)



##############################################
##############################################
############## BUILT ENV MODELS ##############
##############################################
##############################################


# Built destination model
mod2a <- glm.nb(TRIP_DESTI ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  JOBS_PPL_PER_ARCE + CONNECTED_NODE_RATIO + RAPID_TRANSIT_ACCESS,
                data=dat1)
summary(mod2a); logLik(mod2a)



# Built activity model
mod2a <- glm.nb(TRIP_ACTIV ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  JOBS_PPL_PER_ARCE + CONNECTED_NODE_RATIO + RAPID_TRANSIT_ACCESS,
                data=dat1)
summary(mod2a); logLik(mod2a)



# Built VMT model
mod2a <- glm.nb(TRIP_VMT ~ RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  CONNECTED_NODE_RATIO + RAPID_TRANSIT_ACCESS, data=dat1)
summary(mod2a); logLik(mod2a)



# Built origin model
#zeroing issue happens here too
mod2a <- glm.nb(TRIP_ORIGINS ~ INTR_PER_ACRE + RESIDENTIAL_ROADS_PERC + TOTAL_EMPLOYMENT + 
                  JOBS_PPL_PER_ARCE + CONNECTED_NODE_RATIO + RAPID_TRANSIT_ACCESS, data=dat1)
summary(mod2a); logLik(mod2a)
