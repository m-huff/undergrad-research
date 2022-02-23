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

# Get HH size (approximated) from the stats we have.
dat <- dat %>%
  mutate(adult_ct = case_when(
    hhadu_cat == "4 or more" ~ 4,
    hhadu_cat == "3"  ~ 3,
    hhadu_cat == "2"  ~ 2,
    hhadu_cat == "1"  ~ 1
  ))

dat <- dat %>%
  mutate(child_ct = case_when(
    hhkid_cat == "3 or more" ~ 3,
    hhkid_cat == "2"  ~ 2,
    hhkid_cat == "1"  ~ 1,
    hhkid_cat == "0"  ~ 0
  ))

dat$hhsize <- dat$adult_ct + dat$child_ct
table(dat$hhsize)

# Generate stats for education.
table(dat$edu_cat)

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
