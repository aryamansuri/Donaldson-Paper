#### Preamble ####
# Purpose: Downloads and saves the data from the OpenDataToronto portal
# Author: Aryaman Suri
# Date: 22 January 2024
# Contact: aryaman.suri2mail.utoronto.ca
# License: MIT
# Pre-requisites: none


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
raw_homicide_data <-
  read_csv(
    file = 
      "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc/resource/f7076075-31c8-4dca-a3ce-967b887e511f/download/Homicides%20-%204326.csv",
    show_col_types = FALSE,
    skip = 1
  )

#### Save data ####
write_csv(raw_homicide_data, "inputs/data/raw_homicide_data.csv") 



         
