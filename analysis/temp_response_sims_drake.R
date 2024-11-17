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
params <- read.csv('../data/A_temp_data.csv')
head(params)

## run model

### CAF006_H
#### get subsetted data
params_CAF006_H <- subset(params, Accession == 'CAF006' & Treatment == 'H')
#### run with T response of phi and jmax
sim_CAF006_H_yesphi_yesjmax <- photosynthesis_model(temperature_c = params_CAF006_H$Tleaf,
                                                    jmax_ref = params_CAF006_H$jmax_ref,
                                                    vcmax_ref = params_CAF006_H$vcmax_ref,
                                                    t_ref = params_CAF006_H$t_ref,
                                                    phi_psii = params_CAF006_H$Average.of.PhiPS2,
                                                    par = params_CAF006_H$PAR,
                                                    phi_psii_tresp = 'no',
                                                    jmax_tresp = 'yes',
                                                    tmean = 25,
                                                    ci = params_CAF006_H$Average.of.Ci)
#### run with T response of phi only
sim_CAF006_H_yesphi_nojmax <- photosynthesis_model(temperature_c = params_CAF006_H$Tleaf,
                                                   jmax_ref = params_CAF006_H$jmax_ref,
                                                   vcmax_ref = params_CAF006_H$vcmax_ref,
                                                   t_ref = params_CAF006_H$t_ref,
                                                   phi_psii = params_CAF006_H$Average.of.PhiPS2,
                                                   par = params_CAF006_H$PAR,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'no',
                                                   tmean = 25,
                                                   ci = params_CAF006_H$Average.of.Ci)
#### run with T response of jmax only
sim_CAF006_H_nophi_yesjmax <- photosynthesis_model(temperature_c = params_CAF006_H$Tleaf,
                                                   jmax_ref = params_CAF006_H$jmax_ref,
                                                   vcmax_ref = params_CAF006_H$vcmax_ref,
                                                   t_ref = params_CAF006_H$t_ref,
                                                   phi_psii = mean(params_CAF006_H$Average.of.PhiPS2),
                                                   par = params_CAF006_H$PAR,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'yes',
                                                   tmean = 25,
                                                   ci = params_CAF006_H$Average.of.Ci)
#### run with no T response
sim_CAF006_H_nophi_nojmax <- photosynthesis_model(temperature_c = params_CAF006_H$Tleaf,
                                                  jmax_ref = params_CAF006_H$jmax_ref,
                                                  vcmax_ref = params_CAF006_H$vcmax_ref,
                                                  t_ref = params_CAF006_H$t_ref,
                                                  phi_psii = mean(params_CAF006_H$Average.of.PhiPS2),
                                                  par = params_CAF006_H$PAR,
                                                  phi_psii_tresp = 'no',
                                                  jmax_tresp = 'no',
                                                  tmean = 25,
                                                  ci = params_CAF006_H$Average.of.Ci)
#### make plot
plot_CAF006_H <- ggplot(data = sim_CAF006_H_yesphi_yesjmax, aes(y=a, x=temperature_c))+
  geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_H_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_H_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF006_H_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
  geom_line(data = params_CAF006_H, aes(x=Tleaf, y=Average.of.A), lty = 2) +
  ylim(c(-15, 45)) +
  ggtitle('CAF006_H')

### CAF006_L
#### get subsetted data
params_CAF006_L <- subset(params, Accession == 'CAF006' & Treatment == 'L')
#### run with T response of phi and jmax
sim_CAF006_L_yesphi_yesjmax <- photosynthesis_model(temperature_c = params_CAF006_L$Tleaf,
                                                      jmax_ref = params_CAF006_L$jmax_ref,
                                                      vcmax_ref = params_CAF006_L$vcmax_ref,
                                                      t_ref = params_CAF006_L$t_ref,
                                                      phi_psii = params_CAF006_L$Average.of.PhiPS2,
                                                      par = params_CAF006_L$PAR,
                                                      phi_psii_tresp = 'no',
                                                      jmax_tresp = 'yes',
                                                      tmean = 25,
                                                      ci = params_CAF006_L$Average.of.Ci)
#### run with T response of phi only
sim_CAF006_L_yesphi_nojmax <- photosynthesis_model(temperature_c = params_CAF006_L$Tleaf,
                                                     jmax_ref = params_CAF006_L$jmax_ref,
                                                     vcmax_ref = params_CAF006_L$vcmax_ref,
                                                     t_ref = params_CAF006_L$t_ref,
                                                     phi_psii = params_CAF006_L$Average.of.PhiPS2,
                                                     par = params_CAF006_L$PAR,
                                                     phi_psii_tresp = 'no',
                                                     jmax_tresp = 'no',
                                                     tmean = 25,
                                                     ci = params_CAF006_L$Average.of.Ci)
#### run with T response of jmax only
sim_CAF006_L_nophi_yesjmax <- photosynthesis_model(temperature_c = params_CAF006_L$Tleaf,
                                                     jmax_ref = params_CAF006_L$jmax_ref,
                                                     vcmax_ref = params_CAF006_L$vcmax_ref,
                                                     t_ref = params_CAF006_L$t_ref,
                                                     phi_psii = mean(params_CAF006_L$Average.of.PhiPS2),
                                                     par = params_CAF006_L$PAR,
                                                     phi_psii_tresp = 'no',
                                                     jmax_tresp = 'yes',
                                                     tmean = 25,
                                                     ci = params_CAF006_L$Average.of.Ci)
#### run with no T response
sim_CAF006_L_nophi_nojmax <- photosynthesis_model(temperature_c = params_CAF006_L$Tleaf,
                                                    jmax_ref = params_CAF006_L$jmax_ref,
                                                    vcmax_ref = params_CAF006_L$vcmax_ref,
                                                    t_ref = params_CAF006_L$t_ref,
                                                    phi_psii = mean(params_CAF006_L$Average.of.PhiPS2),
                                                    par = params_CAF006_L$PAR,
                                                    phi_psii_tresp = 'no',
                                                    jmax_tresp = 'no',
                                                    tmean = 25,
                                                    ci = params_CAF006_L$Average.of.Ci)
#### make plot
plot_CAF006_L <- ggplot(data = sim_CAF006_L_yesphi_yesjmax, aes(y=a, x=temperature_c))+
    geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
    geom_line(data = sim_CAF006_L_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
    geom_line(data = sim_CAF006_L_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
    geom_line(data = sim_CAF006_L_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
    geom_line(data = params_CAF006_L, aes(x=Tleaf, y=Average.of.A), lty = 2) +
    ylim(c(-15, 45)) +
    ggtitle('CAF006_L')


### CAF0216_H
#### get subsetted data
params_CAF0216_H <- subset(params, Accession == 'CAF0216' & Treatment == 'H')
#### run with T response of phi and jmax
sim_CAF0216_H_yesphi_yesjmax <- photosynthesis_model(temperature_c = params_CAF0216_H$Tleaf,
                                                    jmax_ref = params_CAF0216_H$jmax_ref,
                                                    vcmax_ref = params_CAF0216_H$vcmax_ref,
                                                    t_ref = params_CAF0216_H$t_ref,
                                                    phi_psii = params_CAF0216_H$Average.of.PhiPS2,
                                                    par = params_CAF0216_H$PAR,
                                                    phi_psii_tresp = 'no',
                                                    jmax_tresp = 'yes',
                                                    tmean = 25,
                                                    ci = params_CAF0216_H$Average.of.Ci)
#### run with T response of phi only
sim_CAF0216_H_yesphi_nojmax <- photosynthesis_model(temperature_c = params_CAF0216_H$Tleaf,
                                                   jmax_ref = params_CAF0216_H$jmax_ref,
                                                   vcmax_ref = params_CAF0216_H$vcmax_ref,
                                                   t_ref = params_CAF0216_H$t_ref,
                                                   phi_psii = params_CAF0216_H$Average.of.PhiPS2,
                                                   par = params_CAF0216_H$PAR,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'no',
                                                   tmean = 25,
                                                   ci = params_CAF0216_H$Average.of.Ci)
#### run with T response of jmax only
sim_CAF0216_H_nophi_yesjmax <- photosynthesis_model(temperature_c = params_CAF0216_H$Tleaf,
                                                   jmax_ref = params_CAF0216_H$jmax_ref,
                                                   vcmax_ref = params_CAF0216_H$vcmax_ref,
                                                   t_ref = params_CAF0216_H$t_ref,
                                                   phi_psii = mean(params_CAF0216_H$Average.of.PhiPS2),
                                                   par = params_CAF0216_H$PAR,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'yes',
                                                   tmean = 25,
                                                   ci = params_CAF0216_H$Average.of.Ci)
#### run with no T response
sim_CAF0216_H_nophi_nojmax <- photosynthesis_model(temperature_c = params_CAF0216_H$Tleaf,
                                                  jmax_ref = params_CAF0216_H$jmax_ref,
                                                  vcmax_ref = params_CAF0216_H$vcmax_ref,
                                                  t_ref = params_CAF0216_H$t_ref,
                                                  phi_psii = mean(params_CAF0216_H$Average.of.PhiPS2),
                                                  par = params_CAF0216_H$PAR,
                                                  phi_psii_tresp = 'no',
                                                  jmax_tresp = 'no',
                                                  tmean = 25,
                                                  ci = params_CAF0216_H$Average.of.Ci)
#### make plot
plot_CAF0216_H <- ggplot(data = sim_CAF0216_H_yesphi_yesjmax, aes(y=a, x=temperature_c))+
  geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_H_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_H_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_H_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
  geom_line(data = params_CAF0216_H, aes(x=Tleaf, y=Average.of.A), lty = 2) +
  ylim(c(-15, 45)) +
  ggtitle('CAF0216_H')

### CAF0216_L
#### get subsetted data
params_CAF0216_L <- subset(params, Accession == 'CAF0216' & Treatment == 'L')
#### run with T response of phi and jmax
sim_CAF0216_L_yesphi_yesjmax <- photosynthesis_model(temperature_c = params_CAF0216_L$Tleaf,
                                                    jmax_ref = params_CAF0216_L$jmax_ref,
                                                    vcmax_ref = params_CAF0216_L$vcmax_ref,
                                                    t_ref = params_CAF0216_L$t_ref,
                                                    phi_psii = params_CAF0216_L$Average.of.PhiPS2,
                                                    par = params_CAF0216_L$PAR,
                                                    phi_psii_tresp = 'no',
                                                    jmax_tresp = 'yes',
                                                    tmean = 25,
                                                    ci = params_CAF0216_L$Average.of.Ci)
#### run with T response of phi only
sim_CAF0216_L_yesphi_nojmax <- photosynthesis_model(temperature_c = params_CAF0216_L$Tleaf,
                                                   jmax_ref = params_CAF0216_L$jmax_ref,
                                                   vcmax_ref = params_CAF0216_L$vcmax_ref,
                                                   t_ref = params_CAF0216_L$t_ref,
                                                   phi_psii = params_CAF0216_L$Average.of.PhiPS2,
                                                   par = params_CAF0216_L$PAR,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'no',
                                                   tmean = 25,
                                                   ci = params_CAF0216_L$Average.of.Ci)
#### run with T response of jmax only
sim_CAF0216_L_nophi_yesjmax <- photosynthesis_model(temperature_c = params_CAF0216_L$Tleaf,
                                                   jmax_ref = params_CAF0216_L$jmax_ref,
                                                   vcmax_ref = params_CAF0216_L$vcmax_ref,
                                                   t_ref = params_CAF0216_L$t_ref,
                                                   phi_psii = mean(params_CAF0216_L$Average.of.PhiPS2),
                                                   par = params_CAF0216_L$PAR,
                                                   phi_psii_tresp = 'no',
                                                   jmax_tresp = 'yes',
                                                   tmean = 25,
                                                   ci = params_CAF0216_L$Average.of.Ci)
#### run with no T response
sim_CAF0216_L_nophi_nojmax <- photosynthesis_model(temperature_c = params_CAF0216_L$Tleaf,
                                                  jmax_ref = params_CAF0216_L$jmax_ref,
                                                  vcmax_ref = params_CAF0216_L$vcmax_ref,
                                                  t_ref = params_CAF0216_L$t_ref,
                                                  phi_psii = mean(params_CAF0216_L$Average.of.PhiPS2),
                                                  par = params_CAF0216_L$PAR,
                                                  phi_psii_tresp = 'no',
                                                  jmax_tresp = 'no',
                                                  tmean = 25,
                                                  ci = params_CAF0216_L$Average.of.Ci)
#### make plot
plot_CAF0216_L <- ggplot(data = sim_CAF0216_L_yesphi_yesjmax, aes(y=a, x=temperature_c))+
  geom_line(color = 'purple', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_L_yesphi_nojmax, color = 'red', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_L_nophi_yesjmax, color = 'blue', linewidth = 2, alpha = 0.5) +
  geom_line(data = sim_CAF0216_L_nophi_nojmax, color = 'black', linewidth = 2, alpha = 0.5) +
  geom_line(data = params_CAF0216_L, aes(x=Tleaf, y=Average.of.A), lty = 2) +
  ylim(c(-15, 45)) +
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



