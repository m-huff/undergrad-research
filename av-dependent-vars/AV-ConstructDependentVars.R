library(dplyr)

# Read survey data in.
dat <- read.csv("D:/Manually Transferred Files/AV Research/art-lc.csv")

# There were more incomplete records...
dat <- dat[!is.na(dat$urban_20),]

### Construct all of our dependent variables as change scores.

# Urban/Rural Living Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(area_chg_score = case_when(
    urban_20==0 & urban_21==0 ~ "Stay Rural",
    urban_20==1 & urban_21==1 ~ "Stay Urban",
    urban_20==0 & urban_21==1 ~ "Move Urban",
    urban_20==1 & urban_21==0 ~ "Move Rural"
  ))

# "Drive alone" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod1_chg_score = case_when(
    b19_pmod1==0 & d19_pmod1==0 ~ "Never Used",
    b19_pmod1==1 & d19_pmod1==1 ~ "Continued Use",
    b19_pmod1==0 & d19_pmod1==1 ~ "Add Use",
    b19_pmod1==1 & d19_pmod1==0 ~ "Drop Use"
  ))

# "Carpool, vanpool, or passenger in a car" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod2_chg_score = case_when(
    b19_pmod2==0 & d19_pmod2==0 ~ "Never Used",
    b19_pmod2==1 & d19_pmod2==1 ~ "Continued Use",
    b19_pmod2==0 & d19_pmod2==1 ~ "Add Use",
    b19_pmod2==1 & d19_pmod2==0 ~ "Drop Use"
  ))

# "Bus" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod3_chg_score = case_when(
    b19_pmod3==0 & d19_pmod3==0 ~ "Never Used",
    b19_pmod3==1 & d19_pmod3==1 ~ "Continued Use",
    b19_pmod3==0 & d19_pmod3==1 ~ "Add Use",
    b19_pmod3==1 & d19_pmod3==0 ~ "Drop Use"
  ))

# "Train (e.g., commuter rail, subway, light rail, streetcar)" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod4_chg_score = case_when(
    b19_pmod4==0 & d19_pmod4==0 ~ "Never Used",
    b19_pmod4==1 & d19_pmod4==1 ~ "Continued Use",
    b19_pmod4==0 & d19_pmod4==1 ~ "Add Use",
    b19_pmod4==1 & d19_pmod4==0 ~ "Drop Use"
  ))

# "Bicycle" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod5_chg_score = case_when(
    b19_pmod5==0 & d19_pmod5==0 ~ "Never Used",
    b19_pmod5==1 & d19_pmod5==1 ~ "Continued Use",
    b19_pmod5==0 & d19_pmod5==1 ~ "Add Use",
    b19_pmod5==1 & d19_pmod5==0 ~ "Drop Use"
  ))

# "Walk" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod6_chg_score = case_when(
    b19_pmod6==0 & d19_pmod6==0 ~ "Never Used",
    b19_pmod6==1 & d19_pmod6==1 ~ "Continued Use",
    b19_pmod6==0 & d19_pmod6==1 ~ "Add Use",
    b19_pmod6==1 & d19_pmod6==0 ~ "Drop Use"
  ))

# "Ridehailing (e.g., Uber, Lyft)" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod7_chg_score = case_when(
    b19_pmod7==0 & d19_pmod7==0 ~ "Never Used",
    b19_pmod7==1 & d19_pmod7==1 ~ "Continued Use",
    b19_pmod7==0 & d19_pmod7==1 ~ "Add Use",
    b19_pmod7==1 & d19_pmod7==0 ~ "Drop Use"
  ))

# "Taxicab" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod8_chg_score = case_when(
    b19_pmod8==0 & d19_pmod8==0 ~ "Never Used",
    b19_pmod8==1 & d19_pmod8==1 ~ "Continued Use",
    b19_pmod8==0 & d19_pmod8==1 ~ "Add Use",
    b19_pmod8==1 & d19_pmod8==0 ~ "Drop Use"
  ))

# "Electric-scooter (e.g., Lime, Spin, Bird)" Change Score
# AS PRIMARY MODE
dat <- dat %>%
  mutate(pmod9_chg_score = case_when(
    b19_pmod9==0 & d19_pmod9==0 ~ "Never Used",
    b19_pmod9==1 & d19_pmod9==1 ~ "Continued Use",
    b19_pmod9==0 & d19_pmod9==1 ~ "Add Use",
    b19_pmod9==1 & d19_pmod9==0 ~ "Drop Use"
  ))

# "Drive alone" Change Score
dat <- dat %>%
  mutate(mode1_chg_score = case_when(
    b19_mode_1==0 & d19_mode_1==0 ~ "Never Used",
    b19_mode_1==1 & d19_mode_1==1 ~ "Continued Use",
    b19_mode_1==0 & d19_mode_1==1 ~ "Add Use",
    b19_mode_1==1 & d19_mode_1==0 ~ "Drop Use"
  ))

# "Carpool, vanpool, or passenger in a car" Change Score
dat <- dat %>%
  mutate(mode2_chg_score = case_when(
    b19_mode_2==0 & d19_mode_2==0 ~ "Never Used",
    b19_mode_2==1 & d19_mode_2==1 ~ "Continued Use",
    b19_mode_2==0 & d19_mode_2==1 ~ "Add Use",
    b19_mode_2==1 & d19_mode_2==0 ~ "Drop Use"
  ))

# "Bus" Change Score
dat <- dat %>%
  mutate(mode3_chg_score = case_when(
    b19_mode_3==0 & d19_mode_3==0 ~ "Never Used",
    b19_mode_3==1 & d19_mode_3==1 ~ "Continued Use",
    b19_mode_3==0 & d19_mode_3==1 ~ "Add Use",
    b19_mode_3==1 & d19_mode_3==0 ~ "Drop Use"
  ))

# "Train (e.g., commuter rail, subway, light rail, streetcar)" Change Score
dat <- dat %>%
  mutate(mode4_chg_score = case_when(
    b19_mode_4==0 & d19_mode_4==0 ~ "Never Used",
    b19_mode_4==1 & d19_mode_4==1 ~ "Continued Use",
    b19_mode_4==0 & d19_mode_4==1 ~ "Add Use",
    b19_mode_4==1 & d19_mode_4==0 ~ "Drop Use"
  ))

# "Bicycle" Change Score
dat <- dat %>%
  mutate(mode5_chg_score = case_when(
    b19_mode_5==0 & d19_mode_5==0 ~ "Never Used",
    b19_mode_5==1 & d19_mode_5==1 ~ "Continued Use",
    b19_mode_5==0 & d19_mode_5==1 ~ "Add Use",
    b19_mode_5==1 & d19_mode_5==0 ~ "Drop Use"
  ))

# "Walk" Change Score
dat <- dat %>%
  mutate(mode6_chg_score = case_when(
    b19_mode_6==0 & d19_mode_6==0 ~ "Never Used",
    b19_mode_6==1 & d19_mode_6==1 ~ "Continued Use",
    b19_mode_6==0 & d19_mode_6==1 ~ "Add Use",
    b19_mode_6==1 & d19_mode_6==0 ~ "Drop Use"
  ))

# "Ridehailing (e.g., Uber, Lyft)" Change Score
dat <- dat %>%
  mutate(mode7_chg_score = case_when(
    b19_mode_7==0 & d19_mode_7==0 ~ "Never Used",
    b19_mode_7==1 & d19_mode_7==1 ~ "Continued Use",
    b19_mode_7==0 & d19_mode_7==1 ~ "Add Use",
    b19_mode_7==1 & d19_mode_7==0 ~ "Drop Use"
  ))

# "Taxicab" Change Score
dat <- dat %>%
  mutate(mode8_chg_score = case_when(
    b19_mode_8==0 & d19_mode_8==0 ~ "Never Used",
    b19_mode_8==1 & d19_mode_8==1 ~ "Continued Use",
    b19_mode_8==0 & d19_mode_8==1 ~ "Add Use",
    b19_mode_8==1 & d19_mode_8==0 ~ "Drop Use"
  ))

# "Electric-scooter (e.g., Lime, Spin, Bird)" Change Score
dat <- dat %>%
  mutate(mode9_chg_score = case_when(
    b19_mode_9==0 & d19_mode_9==0 ~ "Never Used",
    b19_mode_9==1 & d19_mode_9==1 ~ "Continued Use",
    b19_mode_9==0 & d19_mode_9==1 ~ "Add Use",
    b19_mode_9==1 & d19_mode_9==0 ~ "Drop Use"
  ))

# Construct future travel intentions as a set of four indicators
# like the above dependent variables.
dat <- dat %>%
  mutate(future_chg_score = case_when(
    before > 1 & a19_rhail=="I will not use these services." ~ "Drop Use",
    before==1 & a19_rhail=="I will not use these services." | before==1 & a19_rhail=="I will use these services the same amount as I did before the COVID-19 pandemic." ~ "Never Used",
    before==1 & a19_rhail!="I will not use these services." |  before==1 & a19_rhail=="I will use these services the same amount as I did before the COVID-19 pandemic." ~ "Add Use",
    before > 1 & a19_rhail!="I will not use these services." ~ "Continued Use"
  ))

# Write out to new CSV.
write.csv(dat, "C:/Users/micha/Desktop/art-dep.csv")