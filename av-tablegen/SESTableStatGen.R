### MICHAEL HUFF ###

# Read in our raw CSV file containing COMPLETELY
# filled records. This one, art-dep, is the final
# version of the CSV data to be used for modeling.
dat <- read.csv("C:/Users/micha/Desktop/art-dep.csv")

# Generate stats for males and females.
# gen_cat_1 <- male
# gen_cat_2 <- female
table(dat$gen_cat)

# Generate stats for age groupings.
table(dat$age_cat)

# Generate stats for household income and composition.
table(dat$hhinc_cat)
table(dat$hhadu_cat)
table(dat$hhkid_cat)

# Generate stats for occupation.
# Full-time work
table(dat$work_cat_1)

# Part-time work
table(dat$work_cat_2)

# Full-time student
table(dat$work_cat_3)

# Part-time student
table(dat$work_cat_4)

# Retired
table(dat$retired)

# Unemployed
table(dat$unemployed)
