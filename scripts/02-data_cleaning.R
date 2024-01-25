#### Preamble ####
# Purpose: Cleans the raw plane data recorded by simplifying names and selecting the relevant columns from the data set
# Author: Aryaman Suri
# Date: 22 January 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)

#### Clean data ####

# Read in the raw homicide statistics data. 
readr::read_csv("inputs/data/raw_homicide_data.csv")

#### Basic cleaning - homicide statistics ####
# based on code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
raw_homicide_statistics <-
  read_csv(
    file = "inputs/data/raw_homicide_data.csv",
    show_col_types = FALSE
  )

cleaned_homicide_data <-
  raw_homicide_statistics |>
  janitor::clean_names() |>
  select(homicide_type, occ_month)


#### Save cleaned data ####
write_csv(cleaned_homicide_data, "outputs/data/cleaned_homicide_data.csv")

#### Seperate the homicides in the warm months and the cold months ####
# We will consider October through March as cold months and April through September as warm months
# This distinction is done based on: https://weatherspark.com/y/19863/Average-Weather-in-Toronto-Canada-Year-Round

cleaned_cold_data <-
  cleaned_homicide_data %>%
  filter(occ_month == "October" | occ_month == "November" | occ_month == "December"
         | occ_month == "January" | occ_month == "February" | occ_month == "March") %>%
  group_by(homicide_type) %>%
  summarise(
    responses = sum(homicide_type == "Shooting" | homicide_type == "Stabbing"
                    | homicide_type == "Other", na.rm = TRUE)
  )

cleaned_warm_data <-
  cleaned_homicide_data %>%
  filter(occ_month == "April" | occ_month == "May" | occ_month == "June"
         | occ_month == "July" | occ_month == "August" | occ_month == "September") %>%
  group_by(homicide_type) %>%
  summarise(
    responses = sum(homicide_type == "Shooting" | homicide_type == "Stabbing"
                    | homicide_type == "Other", na.rm = TRUE)
  )

#### We also want the data for homicides for each month across 20 years ####

cleaned_monthly_data <-
  cleaned_homicide_data%>%
  filter(homicide_type == "Shooting" | homicide_type == "Stabbing" | homicide_type == "Other")%>%
  group_by(occ_month)%>%
  summarise(
    responses = sum(occ_month == "October" | occ_month == "November" | occ_month == "December" | occ_month == "January" | occ_month == "February" | occ_month == "March" | occ_month == "April" | occ_month == "May" | occ_month == "June" | occ_month == "July" | occ_month == "August" | occ_month == "September")
  )

#### We also want the data for homicides categorized into the types of homicides ####

cleaned_categorized_data <-
  cleaned_homicide_data %>%
  filter(occ_month == "October" | occ_month == "November" | occ_month == "December" | occ_month == "January" | occ_month == "February" | occ_month == "March" | occ_month == "April" | occ_month == "May" | occ_month == "June" | occ_month == "July" | occ_month == "August" | occ_month == "September") %>%
  group_by(homicide_type)%>%
  summarise(
    responses = sum(homicide_type == "Shooting" | homicide_type == "Stabbing" | homicide_type == "Other")
  )

#### We want the data for warm weather homicides and cold weather homicides merged into one table####

cleaned_comparing_data <-
  inner_join(x = cleaned_cold_homicide_data, y = cleaned_warm_homicide_data, by = "homicide_type")

colnames(cleaned_comparing_data) <-
  c("Homicide Type", "Cold Months", "Warm Months")

#### Save cleaned data ####
write_csv(cleaned_homicide_data, "outputs/data/cleaned_homicide_data.csv")
write_csv(cleaned_warm_data, "outputs/data/cleaned_warm_homicide_data.csv")
write_csv(cleaned_cold_data, "outputs/data/cleaned_cold_homicide_data.csv")
write_csv(cleaned_monthly_data, "outputs/data/cleaned_monthly_data.csv")
write_csv(cleaned_categorized_data, "outputs/data/cleaned_categorized_data.csv")
write_csv(cleaned_comparing_data, "outputs/data/cleaned_comparing_data.csv")

