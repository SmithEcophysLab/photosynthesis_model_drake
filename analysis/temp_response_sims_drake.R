# temp_response_sims_drake.R
## code to to simulate the teemperarture response of photosynthesis using parameters from Drake et al.

## libraries
# install.packages('R.utils')
library(R.utils)
library(ggplot2)
library(pracma)

## load up model and functions
source('../model_code/photosynthesis_model.R')
sourceDirectory('../model_code/functions')

## load up parameters
params <- read.csv('../data/Temp_response_parameters.csv')

## run model

### CAF006_H
#### get subsetted data
params_CAF006_H <- subset(params, ID == 'CAF006_H')
#### run with T response of phi and jmax
sim_CAF006_H_yesphi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF006_H$Jmax25_1,
                                                    vcmax25 = params_CAF006_H$Vcmax25_1,
                                                    rec_a = params_CAF006_H$a,
                                                    rec_m1 = params_CAF006_H$m1,
                                                    rec_s1 = params_CAF006_H$s1,
                                                    rec_m2 = params_CAF006_H$m2,
                                                    rec_s2 = params_CAF006_H$s2,
                                                    phi_psii_tresp = 'yes',
                                                    jmax_tresp = 'yes',
                                                    tmean = 25)
#### run with T response of phi only
sim_CAF006_H_yesphi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF006_H$Jmax25_1,
                                                    vcmax25 = params_CAF006_H$Vcmax25_1,
                                                    rec_a = params_CAF006_H$a,
                                                    rec_m1 = params_CAF006_H$m1,
                                                    rec_s1 = params_CAF006_H$s1,
                                                    rec_m2 = params_CAF006_H$m2,
                                                    rec_s2 = params_CAF006_H$s2,
                                                    phi_psii_tresp = 'yes',
                                                    jmax_tresp = 'no',
                                                   tmean = 25)
#### run with T response of jmax only
sim_CAF006_H_nophi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF006_H$Jmax25_1,
                                                    vcmax25 = params_CAF006_H$Vcmax25_1,
                                                    rec_a = params_CAF006_H$a,
                                                    rec_m1 = params_CAF006_H$m1,
                                                    rec_s1 = params_CAF006_H$s1,
                                                    rec_m2 = params_CAF006_H$m2,
                                                    rec_s2 = params_CAF006_H$s2,
                                                    phi_psii_tresp = 'no',
                                                    jmax_tresp = 'yes',
                                                   tmean = 25)
#### run with no T response
sim_CAF006_H_nophi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF006_H$Jmax25_1,
                                                    vcmax25 = params_CAF006_H$Vcmax25_1,
                                                    rec_a = params_CAF006_H$a,
                                                    rec_m1 = params_CAF006_H$m1,
                                                    rec_s1 = params_CAF006_H$s1,
                                                    rec_m2 = params_CAF006_H$m2,
                                                    rec_s2 = params_CAF006_H$s2,
                                                    phi_psii_tresp = 'no',
                                                    jmax_tresp = 'no',
                                                  tmean = 25)
#### make plot
plot_CAF006_H <- ggplot(data = sim_CAF006_H_yesphi_yesjmax, aes(y=aj, x=temperature_c))+
  geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_H_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_H_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_H_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
  ylim(c(0, 25)) +
  ggtitle('CAF006_H')

### CAF006_L
#### get subsetted data
params_CAF006_L <- subset(params, ID == 'CAF006_L')
#### run with T response of phi and jmax
sim_CAF006_L_yesphi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF006_L$Jmax25_1,
                                                    vcmax25 = params_CAF006_L$Vcmax25_1,
                                                    rec_a = params_CAF006_L$a,
                                                    rec_m1 = params_CAF006_L$m1,
                                                    rec_s1 = params_CAF006_L$s1,
                                                    rec_m2 = params_CAF006_L$m2,
                                                    rec_s2 = params_CAF006_L$s2,
                                                    phi_psii_tresp = 'yes',
                                                    jmax_tresp = 'yes',
                                                    tmean = 15)
#### run with T response of phi only
sim_CAF006_L_yesphi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                   jmax25 = params_CAF006_L$Jmax25_1,
                                                   vcmax25 = params_CAF006_L$Vcmax25_1,
                                                   rec_a = params_CAF006_L$a,
                                                   rec_m1 = params_CAF006_L$m1,
                                                   rec_s1 = params_CAF006_L$s1,
                                                   rec_m2 = params_CAF006_L$m2,
                                                   rec_s2 = params_CAF006_L$s2,
                                                   phi_psii_tresp = 'yes',
                                                   jmax_tresp = 'no',
                                                   tmean = 15)
#### run with T response of jmax only
sim_CAF006_L_nophi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                   jmax25 = params_CAF006_L$Jmax25_1,
                                                   vcmax25 = params_CAF006_L$Vcmax25_1,
                                                   rec_a = params_CAF006_L$a,
                                                   rec_m1 = params_CAF006_L$m1,
                                                   rec_s1 = params_CAF006_L$s1,
                                                   rec_m2 = params_CAF006_L$m2,
                                                   rec_s2 = params_CAF006_L$s2,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'yes',
                                                   tmean = 15)
#### run with no T response
sim_CAF006_L_nophi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                  jmax25 = params_CAF006_L$Jmax25_1,
                                                  vcmax25 = params_CAF006_L$Vcmax25_1,
                                                  rec_a = params_CAF006_L$a,
                                                  rec_m1 = params_CAF006_L$m1,
                                                  rec_s1 = params_CAF006_L$s1,
                                                  rec_m2 = params_CAF006_L$m2,
                                                  rec_s2 = params_CAF006_L$s2,
                                                  phi_psii_tresp = 'no',
                                                  jmax_tresp = 'no',
                                                  tmean = 15)
#### make plot
plot_CAF006_L <- ggplot(data = sim_CAF006_L_yesphi_yesjmax, aes(y=aj, x=temperature_c))+
  geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_L_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_L_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_L_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
  ylim(c(0, 25)) +
  ggtitle('CAF006_L')

### CAF0216_H
#### get subsetted data
params_CAF0216_H <- subset(params, ID == 'CAF0216_H')
#### run with T response of phi and jmax
sim_CAF0216_H_yesphi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF0216_H$Jmax25_1,
                                                    vcmax25 = params_CAF0216_H$Vcmax25_1,
                                                    rec_a = params_CAF0216_H$a,
                                                    rec_m1 = params_CAF0216_H$m1,
                                                    rec_s1 = params_CAF0216_H$s1,
                                                    rec_m2 = params_CAF0216_H$m2,
                                                    rec_s2 = params_CAF0216_H$s2,
                                                    phi_psii_tresp = 'yes',
                                                    jmax_tresp = 'yes',
                                                    tmean = 25)
#### run with T response of phi only
sim_CAF0216_H_yesphi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                   jmax25 = params_CAF0216_H$Jmax25_1,
                                                   vcmax25 = params_CAF0216_H$Vcmax25_1,
                                                   rec_a = params_CAF0216_H$a,
                                                   rec_m1 = params_CAF0216_H$m1,
                                                   rec_s1 = params_CAF0216_H$s1,
                                                   rec_m2 = params_CAF0216_H$m2,
                                                   rec_s2 = params_CAF0216_H$s2,
                                                   phi_psii_tresp = 'yes',
                                                   jmax_tresp = 'no',
                                                   tmean = 25)
#### run with T response of jmax only
sim_CAF0216_H_nophi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                   jmax25 = params_CAF0216_H$Jmax25_1,
                                                   vcmax25 = params_CAF0216_H$Vcmax25_1,
                                                   rec_a = params_CAF0216_H$a,
                                                   rec_m1 = params_CAF0216_H$m1,
                                                   rec_s1 = params_CAF0216_H$s1,
                                                   rec_m2 = params_CAF0216_H$m2,
                                                   rec_s2 = params_CAF0216_H$s2,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'yes',
                                                   tmean = 25)
#### run with no T response
sim_CAF0216_H_nophi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                  jmax25 = params_CAF0216_H$Jmax25_1,
                                                  vcmax25 = params_CAF0216_H$Vcmax25_1,
                                                  rec_a = params_CAF0216_H$a,
                                                  rec_m1 = params_CAF0216_H$m1,
                                                  rec_s1 = params_CAF0216_H$s1,
                                                  rec_m2 = params_CAF0216_H$m2,
                                                  rec_s2 = params_CAF0216_H$s2,
                                                  phi_psii_tresp = 'no',
                                                  jmax_tresp = 'no',
                                                  tmean = 25)
#### make plot
plot_CAF0216_H <- ggplot(data = sim_CAF0216_H_yesphi_yesjmax, aes(y=aj, x=temperature_c))+
  geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_H_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_H_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_H_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
  ylim(c(0, 25)) +
  ggtitle('CAF0216_H')

### CAF0216_L
#### get subsetted data
params_CAF0216_L <- subset(params, ID == 'CAF0216_L')
#### run with T response of phi and jmax
sim_CAF0216_L_yesphi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                     jmax25 = params_CAF0216_L$Jmax25_1,
                                                     vcmax25 = params_CAF0216_L$Vcmax25_1,
                                                     rec_a = params_CAF0216_L$a,
                                                     rec_m1 = params_CAF0216_L$m1,
                                                     rec_s1 = params_CAF0216_L$s1,
                                                     rec_m2 = params_CAF0216_L$m2,
                                                     rec_s2 = params_CAF0216_L$s2,
                                                     phi_psii_tresp = 'yes',
                                                     jmax_tresp = 'yes',
                                                     tmean = 15)
#### run with T response of phi only
sim_CAF0216_L_yesphi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF0216_L$Jmax25_1,
                                                    vcmax25 = params_CAF0216_L$Vcmax25_1,
                                                    rec_a = params_CAF0216_L$a,
                                                    rec_m1 = params_CAF0216_L$m1,
                                                    rec_s1 = params_CAF0216_L$s1,
                                                    rec_m2 = params_CAF0216_L$m2,
                                                    rec_s2 = params_CAF0216_L$s2,
                                                    phi_psii_tresp = 'yes',
                                                    jmax_tresp = 'no',
                                                    tmean = 15)
#### run with T response of jmax only
sim_CAF0216_L_nophi_yesjmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                    jmax25 = params_CAF0216_L$Jmax25_1,
                                                    vcmax25 = params_CAF0216_L$Vcmax25_1,
                                                    rec_a = params_CAF0216_L$a,
                                                    rec_m1 = params_CAF0216_L$m1,
                                                    rec_s1 = params_CAF0216_L$s1,
                                                    rec_m2 = params_CAF0216_L$m2,
                                                    rec_s2 = params_CAF0216_L$s2,
                                                    phi_psii_tresp = 'no',
                                                    jmax_tresp = 'yes',
                                                    tmean = 15)
#### run with no T response
sim_CAF0216_L_nophi_nojmax <- photosynthesis_model(temperature_c = seq(1, 50, 1),
                                                   jmax25 = params_CAF0216_L$Jmax25_1,
                                                   vcmax25 = params_CAF0216_L$Vcmax25_1,
                                                   rec_a = params_CAF0216_L$a,
                                                   rec_m1 = params_CAF0216_L$m1,
                                                   rec_s1 = params_CAF0216_L$s1,
                                                   rec_m2 = params_CAF0216_L$m2,
                                                   rec_s2 = params_CAF0216_L$s2,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'no',
                                                   tmean = 15)
#### make plot
plot_CAF0216_L <- ggplot(data = sim_CAF0216_L_yesphi_yesjmax, aes(y=aj, x=temperature_c))+
  geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_L_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_L_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_L_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
  ylim(c(0, 25)) +
  ggtitle('CAF0216_L')

### output data and figures
sim_CAF006_H_yesphi_yesjmax$ID <- "CAF006_H"
sim_CAF006_H_nophi_yesjmax$ID <- "CAF006_H"
sim_CAF006_H_yesphi_nojmax$ID <- "CAF006_H"
sim_CAF006_H_nophi_nojmax$ID <- "CAF006_H"
sim_CAF006_L_yesphi_yesjmax$ID <- "CAF006_L"
sim_CAF006_L_nophi_yesjmax$ID <- "CAF006_L"
sim_CAF006_L_yesphi_nojmax$ID <- "CAF006_L"
sim_CAF006_L_nophi_nojmax$ID <- "CAF006_L"
sim_CAF0216_H_yesphi_yesjmax$ID <- "CAF0216_H"
sim_CAF0216_H_nophi_yesjmax$ID <- "CAF0216_H"
sim_CAF0216_H_yesphi_nojmax$ID <- "CAF0216_H"
sim_CAF0216_H_nophi_nojmax$ID <- "CAF0216_H"
sim_CAF0216_L_yesphi_yesjmax$ID <- "CAF0216_L"
sim_CAF0216_L_nophi_yesjmax$ID <- "CAF0216_L"
sim_CAF0216_L_yesphi_nojmax$ID <- "CAF0216_L"
sim_CAF0216_L_nophi_nojmax$ID <- "CAF0216_L"

sims_combined <- rbind(sim_CAF006_H_yesphi_yesjmax, sim_CAF006_H_nophi_yesjmax, sim_CAF006_H_yesphi_nojmax, sim_CAF006_H_nophi_nojmax,
                       sim_CAF006_L_yesphi_yesjmax, sim_CAF006_L_nophi_yesjmax, sim_CAF006_L_yesphi_nojmax, sim_CAF006_L_nophi_nojmax,
                       sim_CAF0216_H_yesphi_yesjmax, sim_CAF0216_H_nophi_yesjmax, sim_CAF0216_H_yesphi_nojmax, sim_CAF0216_H_nophi_nojmax,
                       sim_CAF0216_L_yesphi_yesjmax, sim_CAF0216_L_nophi_yesjmax, sim_CAF0216_L_yesphi_nojmax, sim_CAF0216_L_nophi_nojmax)

# write.csv(sims_combined, '../results/results_drake_sims.csv')

jpeg(filename = "../results/plot_CAF006_H.jpeg", 
     width = 9, height = 7, units = 'in', res = 600)
plot(plot_CAF006_H)
dev.off()

jpeg(filename = "../results/plot_CAF006_L.jpeg", 
     width = 9, height = 7, units = 'in', res = 600)
plot(plot_CAF006_L)
dev.off()

jpeg(filename = "../results/plot_CAF0216_H.jpeg", 
     width = 9, height = 7, units = 'in', res = 600)
plot(plot_CAF0216_H)
dev.off()

jpeg(filename = "../results/plot_CAF0216_L.jpeg", 
     width = 9, height = 7, units = 'in', res = 600)
plot(plot_CAF0216_L)
dev.off()



