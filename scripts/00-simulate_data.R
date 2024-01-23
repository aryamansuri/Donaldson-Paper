#### Preamble ####
# Purpose: Simulates data of all homicides occurences from 2004 to 2023 as 
#          recorded by the Toronto Police
# Author: Aryaman Suri
# Date: 22 January 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Data sets:
## - https://open.toronto.ca/dataset/police-annual-statistical-report-homicide/
# Note: Only download the WGS84 Projection in the .csv format


#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("janitor")
library(tidyverse)
library(janitor)

#### Data expectations ####
# Homicides occur more frequently in warmer months as compared to colder months

#### Simulate data ####
simulated_data <-
  tibble(
    # Use 1 through to 12 to represent each month
    "Month" = 1:12,
    # Randomly pick an option, with replacement, 12 times
    "Homicide_count" = sample(
      x = c(28, 35, 20, 14, 53, 44),
      size = 12,
      replace = TRUE
    )
  )
simulated_data

#### Simulate number of homicides for the warmer months ####

set.seed(300)

simulated_data <-
  tibble(
    # Use 1 through to 6 to represent each warm month
    "Month" = 1:6,
    # Randomly pick an option, with replacement, 6 times
    "Homicide_count" = sample(
      x = c(28, 35, 20, 14, 53, 44),
      size = 6,
      replace = TRUE
    )
  )
simulated_data

#### Simulate number of homicides for the colder months ####

set.seed(300)

simulated_data <-
  tibble(
    # Use 1 through to 6 to represent each cold month
    "Month" = 1:6,
    # Randomly pick an option, with replacement, 6 times
    "Homicide_count" = sample(
      x = c(28, 35, 20, 14, 53, 44),
      size = 6,
      replace = TRUE
    )
  )
simulated_data

#### Graph homicides for the cold months ####
#Code referenced from: https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html

set.seed(300)

# Create data
data <- data.frame(
  months=c("October", "November","December","January","February","March") ,  
  Homicides=c(28,35,20,14,53,44)
)

# Barplot
ggplot(data, aes(x=months, y=Homicides)) + 
  geom_bar(stat = "identity") 

#### Graph homicides for the warm months ####
#Code referenced from: https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html

set.seed(300)

# Create data
data <- data.frame(
  months=c("April", "May","June","July","August","September") ,  
  Homicides=c(28,35,20,14,53,44)
)

# Barplot
ggplot(data, aes(x=months, y=Homicides)) + 
  geom_bar(stat = "identity") 

#### Data Validation ####

# Check that there are between 1 and 12 months #
# Referenced code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
simulate_data$Month |> min() == 1
simulate_data$Month |> max() == 12
