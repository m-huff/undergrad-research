require(foreign)
require(ggplot2)
require(MASS)

#read raw data in
#FOR ORIGIN MODEL, READ IN TRIMMED ORIGIN DATASET
data.full <- read.csv("C:/Users/micha/Desktop/HURA/hura-master.csv")

#generate correlation table
cor_table <- round(cor(data_in),2)

#spit out for manual multicollinearity test
#write.csv(cor_table, "C:/Users/micha/Desktop/cor_csv.csv")
rm("cor_table")

#pull significant and noncollinear variables in
cor_vars <- c("X5way_ct","second_pct","popemp_acr","wac1_acre","rac3_acre",
           "wac3_pct","rac1_pct","rapidt_acs","beta_ind","X45_64_pct",
           "X65up_pct","veh3_pct","X75_150k_pc","X4way_pct","baa_pct",
           "other_pct","all_vmt","all_orign","all_dest")
data.model <- data_in[,cor_vars]
rm("cor_vars")

#the data from just the cells inside the trip origin zone, makes almost all variables non-significant
#data.origin_zones <- read.csv("C:/Users/micha/Desktop/HURA/hura-origin-zones.csv")
#data.origin_zones <- data.origin_zones[,cor_vars]

#full origin model, combined socio + built environment
#result -- all significant to 0.1%
models.full_origin <- MASS::glm.nb(all_orign ~ X5way_ct + second_pct + popemp_acr + 
                                   wac1_acre + rac3_acre + wac3_pct + rac1_pct + 
                                   rapidt_acs + beta_ind + X45_64_pct + X65up_pct +
                                   X75_150k_pc + X4way_pct + baa_pct + other_pct,
#                                   data=data.origin_zones)
                                   data=data.model)
summary(models.full_origin); logLik(models.full_origin)

#full destination model, combined socio + built environment
models.full_dest <- MASS::glm.nb(all_dest ~ X5way_ct + second_pct + popemp_acr + 
                                 wac1_acre + rac3_acre + wac3_pct + rac1_pct + 
                                 rapidt_acs + beta_ind + X45_64_pct + X65up_pct +
                                 X75_150k_pc + X4way_pct + baa_pct + other_pct,
                                 data=data.model)
summary(models.full_dest); logLik(models.full_dest)

#trimmed destination model, using results of previous full dest model
models.full_dest_trimmed <- MASS::glm.nb(all_dest ~ X5way_ct + second_pct + popemp_acr + 
                                    wac1_acre + rac3_acre + wac3_pct + rac1_pct + 
                                    rapidt_acs + X65up_pct + X4way_pct + other_pct,
                                    data=data.model)
summary(models.full_dest_trimmed); logLik(models.full_dest_trimmed)

#a further trimmed destination model, using results of previous trimmed model
#results -- all significant to varying degrees
models.full_dest_trimmed_2 <- MASS::glm.nb(all_dest ~ X5way_ct + second_pct + popemp_acr + 
                                      wac1_acre + rac3_acre + wac3_pct + rac1_pct + 
                                      X65up_pct + X4way_pct + other_pct,
                                      data=data.model)
summary(models.full_dest_trimmed_2); logLik(models.full_dest_trimmed_2)

#full vmt model, combined socio and built environment
models.full_vmt <- MASS::glm.nb(all_vmt ~ X5way_ct + second_pct + popemp_acr + 
                                   wac1_acre + rac3_acre + wac3_pct + rac1_pct + 
                                   rapidt_acs + beta_ind + X45_64_pct + X65up_pct +
                                   X75_150k_pc + X4way_pct + baa_pct + other_pct,
                                   data=data.model)
summary(models.full_vmt); logLik(models.full_vmt)

#trimmed vmt model based on results of previous full model
#results -- all significant to varying degrees
models.full_vmt_trimmed <- MASS::glm.nb(all_vmt ~ second_pct + popemp_acr + wac1_acre + 
                                   rac3_acre + rapidt_acs + beta_ind + X65up_pct +
                                   X4way_pct + other_pct, data=data.model)
summary(models.full_vmt_trimmed); logLik(models.full_vmt_trimmed)



######################
#### SPLIT MODELS ####
######################

#origin model for just socioeconomic metrics
#full origin model, combined socio + built environment
#result -- 'baa_pct' non significant
models.socio_origin <- MASS::glm.nb(all_orign ~ popemp_acr + wac1_acre + rac3_acre + 
                                    wac3_pct + rac1_pct + X45_64_pct + X65up_pct +
                                   X75_150k_pc + baa_pct + other_pct,
#                                  data=data.origin_zones)
                                   data=data.model)
summary(models.socio_origin); logLik(models.socio_origin)

#trimmed socio origin model based on results of last full socio model
#results -- all significant, X75_150k_pc less so than others
models.socio_origin_trimmed <- MASS::glm.nb(all_orign ~ popemp_acr + wac1_acre + rac3_acre + 
                                            wac3_pct + rac1_pct + X45_64_pct + X65up_pct +
                                            X75_150k_pc + other_pct,
#                                           data=data.origin_zones)
                                            data=data.model)
summary(models.socio_origin_trimmed); logLik(models.socio_origin_trimmed)

#full built origin model
#results -- all significant to highest degree
models.built_origin <- MASS::glm.nb(all_orign ~ X5way_ct + second_pct + rapidt_acs + 
                                    beta_ind + X4way_pct,
#                                   data=data.origin_zones)
                                    data=data.model)
summary(models.built_origin); logLik(models.built_origin)

#socio destination model full
models.socio_dest <- MASS::glm.nb(all_dest ~ popemp_acr + wac1_acre + rac3_acre + 
                                  wac3_pct + rac1_pct + X45_64_pct + X65up_pct +
                                  X75_150k_pc + baa_pct + other_pct,
                                  data=data.model)
summary(models.socio_dest); logLik(models.socio_dest)

#trimmed socio destination model based on results of previous model
#results -- all significant to highest degree
models.socio_dest_trimmed <- MASS::glm.nb(all_dest ~ popemp_acr + wac1_acre + rac3_acre + 
                                          X65up_pct + other_pct, data=data.model)
summary(models.socio_dest_trimmed); logLik(models.socio_dest_trimmed)

#full built destination model
#result -- all significant, beta_index less than others
models.built_dest <- MASS::glm.nb(all_dest ~ X5way_ct + second_pct + rapidt_acs + 
                                  beta_ind + X4way_pct, data=data.model)
summary(models.built_dest); logLik(models.built_dest)

#full socio vmt model
models.socio_vmt <- MASS::glm.nb(all_vmt ~ popemp_acr + wac1_acre + rac3_acre + 
                                 wac3_pct + rac1_pct + X45_64_pct + X65up_pct +
                                 X75_150k_pc + baa_pct + other_pct,
                                 data=data.model)
summary(models.socio_vmt); logLik(models.socio_vmt)

#trimmed socio vmt model based on results of previous model
#results -- all significant to varying degrees
models.socio_vmt_trimmed <- MASS::glm.nb(all_vmt ~ popemp_acr + wac1_acre + rac3_acre + 
                                         wac3_pct + X45_64_pct + X65up_pct +
                                         X75_150k_pc + baa_pct, data=data.model)
summary(models.socio_vmt_trimmed); logLik(models.socio_vmt_trimmed)

#full built vmt model
#results -- significant to varying degrees
models.built_vmt <- MASS::glm.nb(all_vmt ~ X5way_ct + second_pct + rapidt_acs + beta_ind + 
                                 X4way_pct, data=data.model)
summary(models.built_vmt); logLik(models.built_vmt)
