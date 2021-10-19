### CHANGE SCORE CALCULATOR ###
### MICHAEL HUFF ###

# Our working survey data file.
survey <- read.csv("C:/Users/micha/Desktop/AV Research/art-fix.csv")

columnToNumeric <- function(column) {
  column <- ifelse(grepl("I never used",column),"1",column)
  column <- ifelse(grepl("Rarely",column),"2",column)
  column <- ifelse(grepl("Monthly",column),"3",column)
  column <- ifelse(grepl("Sometimes",column),"4",column)
  column <- ifelse(grepl("Weekly",column),"5",column)
  column <- ifelse(grepl("Regularly",column),"6",column)
  column <- ifelse(grepl("Frequently",column),"7",column)
}

# Define our specific columns, calculate change scores,
# create data frame from this data.
rh_use_scoring <- data.frame(as.numeric(columnToNumeric(survey$b19_rhail)))
rh_use_scoring$during <- as.numeric(columnToNumeric(survey$d19_rhail))
rh_use_scoring$chg_score <- rh_use_scoring$as.numeric.columnToNumeric.survey.b19_rhail.. - rh_use_scoring$during
rh_use_scoring$chg_cat <- rh_use_scoring$chg_score
rh_use_scoring$chg_cat[rh_use_scoring$chg_cat >= 1] <- "Less"
rh_use_scoring$chg_cat[rh_use_scoring$chg_cat < 0] <- "More"
rh_use_scoring$chg_cat[rh_use_scoring$chg_cat == 0] <- "Same"
colnames(rh_use_scoring) <- c("before","during","chg_score","chg_cat")

# Insert this new data frame into the survey data where
# I want it to be.
survey <- cbind(survey[,1:174], rh_use_scoring, survey[,175:ncol(survey)])

# Write out our new working file.
write.csv(survey, "C:/Users/micha/Desktop/AV Research/art-change.csv")
rm(list = ls())


