### CROSS TABS SCRIPT FOR SEC 2 QUESTIONS ###
### MICHAEL HUFF ###

# Read in the cleaned survey
survey <- read.csv("C:/Users/micha/Desktop/AV Research/art-fix.csv")

# Break the survey down into the elements we want to cross tab
cor_survey <- survey[,c(45,47,48,49,50,51,53,54,55,56,57,58,59,62,63,64,65,68,69,70,71,72,74,75,76,77,78,79,80,81,83,84,85,88,89,90,91,92,93,96,97,98,99,
                        101,102,103,104,106,107,108,109,110,111,112,113,114,115,118,119,120,121,122,123,124,125,126,130,131,132,133,134,135,136,137,
                        138,139,142,143,144,145,146,147,148,149,150,151,154,155,156,157,159,160,161,162,163,166,167,168,169,170,171,172,173,176,177,178,
                        179,180,181,182,184,185,186,187,188,189,190,192,193,194,195,196,198,199,200,202,203,204)]

# Get rid of records with NA values in survey -- these will 
# be the records omitted in the final dataset as well, but 
# the data should be left complete for now.
complete_records <- na.omit(cor_survey)

# Give us a corr table to do manual cross tabs with.
crosstabs <- round(cor(complete_records),2)

# TO DO #
# Generate a series of CSVs that only have the variables
# which are correlated with ONE of our set of dependent
# variables. Need direction.

# Output the correlation table to CSV.
write.csv(crosstabs, "C:/Users/micha/Desktop/art-crosstabs.csv")

# Clean up our workspace.
rm("complete_records","cor_survey","crosstabs","survey")
