# test_photosynthesis_model.R
## code to test the photosynthesis model

## libraries
# install.packages('R.utils')
library(R.utils)
library(ggplot2)
library(pracma)

## load up model and functions
source('photosynthesis_model.R')

## run model

t_response_rec1 <- photosynthesis_model(temperature_c = seq(5, 50, 5), phi_psii_tresp = "rec", jmax_tresp = 'yes')
t_response_rec2 <- photosynthesis_model(temperature_c = seq(5, 50, 5), phi_psii_tresp = "rec", jmax_tresp = 'no')

co2_response <- photosynthesis_model(ca_ppm = seq(200, 2000, 50))

ggplot(data = co2_response, aes(x = ca_ppm, y = a)) +
  geom_line(col = 'black', size = 2) +
  geom_line(col = 'red', size = 2, lty = 2, aes(y = aj)) +
  geom_line(col = 'blue', size = 2, lty = 2, aes(y = ac))

par_response <- photosynthesis_model(par = seq(0, 500, 50))

ggplot(data = par_response, aes(x = par, y = a)) +
  geom_line(col = 'black', size = 2) +
  geom_line(col = 'red', size = 2, lty = 2, aes(y = aj)) +
  geom_line(col = 'blue', size = 2, lty = 2, aes(y = ac))

temperature_response <- photosynthesis_model(temperature_c = seq(0, 50, 5), phi_psii_tresp = "bernacchi",
                                             par = 500)

ggplot(data = temperature_response, aes(x = temperature_c, y = a)) +
  geom_line(col = 'black', size = 2) +
  geom_line(col = 'red', size = 2, lty = 2, aes(y = aj)) +
  geom_line(col = 'blue', size = 2, lty = 2, aes(y = ac))

temperature_response2 <- photosynthesis_model(temperature_c = seq(0, 50, 5), phi_psii_tresp = "no",
                                              par = 500)

ggplot(data = temperature_response2, aes(x = temperature_c, y = a)) +
  geom_line(col = 'black', size = 2) +
  geom_line(col = 'red', size = 2, lty = 2, aes(y = aj)) +
  geom_line(col = 'blue', size = 2, lty = 2, aes(y = ac))
  
