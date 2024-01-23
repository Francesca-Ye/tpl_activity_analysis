#### Preamble ####
# Purpose: Clean the required data sets from Open Data Toronto in 
# order to create a report that looks at the annual Toronto Public Library 
# circulation and work space usage counts by each Toronto Ward in addition to 
# annual totals of library circulation and visits across the entire city. Uses 
# "Library Branch General Information", "Library Circulation", and "Library 
# Visits."
# Author: Francesca Ye
# Email: francesca.ye@mail.utoronto.ca
# Date: 19 January 2024
# Prerequisites: Access to raw data from Open Data Toronto for "Library Branch
# information", "Library Circulation", and "Library Visits"

#### Clean and Merge Data Sets ####

# Work space set up ####
#install.packages("tidyverse")
#install.packages("janitor")
#install.packages("dplyr")
#install.packages("readr")

library(tidyverse)
library(janitor)
library(dplyr)
library(readr)

#### Clean Data Sets ####

# Clean Branch Data Set Names
cleaned_branch_data <-
  clean_names(raw_library_branch_data)

# Remove Non-Physical Branches from the Branch Data Set
cleaned_branch_data <-
  subset(cleaned_branch_data, physical_branch != 0)

# Select Relevant Data Columns
cleaned_branch_data <-
  cleaned_branch_data |>
  select(branch_code, ward_no, ward_name)

# Save Cleaned Data
write_csv(
  x = cleaned_branch_data,
  file = "~/tplactivityanalysis/outputs/data/00-cleaned_branch_data.csv"
)

# Clean Circulation Data Set Names
cleaned_circulation_data <-
  clean_names(raw_library_circulation_data)

# Remove Non-Physical Branch Data from the Circulation Data Set
cleaned_circulation_data <-
  subset(cleaned_circulation_data, !(branch_code %in% c("AL", "BKONE", "BKTWO", "DS", "HLS", "IL", "LD", "ME", "OS", "PR", "SB", "VIR")))

# Remove 2012 - 2017 Circulation Data
cleaned_circulation_data <-
  subset(cleaned_circulation_data, !(year %in% c(2012:2017)))

# Remove id Column
cleaned_circulation_data <-
  cleaned_circulation_data |>
  select(year, branch_code, circulation)

# Save Cleaned Data
write_csv(
  x = cleaned_circulation_data,
  file = "~/tplactivityanalysis/outputs/data/01-cleaned_circulation_data.csv"
)

# Clean Visits Data Set Names
cleaned_visits_data <-
  clean_names(raw_library_visits_data)

# Remove Non-Physical Branch Data from Visits Data Set
cleaned_visits_data <-
  subset(cleaned_visits_data, !(branch_code %in% c("AL", "BKONE", "BKTWO", "DS", "HLS", "IL", "LD", "ME", "OS", "PR", "SB", "VIR")))

# Remove 2012 - 2017 Visits Data
cleaned_visits_data <-
  subset(cleaned_visits_data, !(year %in% c(2012:2017)))

# Remove id Column
cleaned_visits_data <-
  cleaned_visits_data |>
  select(branch_code, year, visits)

# Save Cleaned Data
write_csv(
  x = cleaned_visits_data,
  file = "~/tplactivityanalysis/outputs/data/02-cleaned_visits_data.csv"
)

#### Merge Data Sets ####

# Merge Branch and Circulation Data by Branch Code
branch_circulation_data <-
  merge(cleaned_branch_data, cleaned_circulation_data, by = "branch_code", 
        all.x = TRUE)

# Sum the circulation Column Totals by ward_no and year
branch_circulation_data <-
  branch_circulation_data |>
  group_by(ward_no, year) |>
  summarise(ward_total = sum(circulation))

# Save the Merged Data
write_csv(
  x = branch_circulation_data,
  file = "~/tplactivityanalysis/outputs/data/03-annual_circulation_by_ward_data.csv"
)

# Sum the total annual circulation by year
annual_circulation_data <-
  branch_circulation_data |>
  group_by(year) |>
  summarise(annual_total = sum(ward_total))

# Save the Merged Data
write_csv(
  x = annual_circulation_data,
  file = "~/tplactivityanalysis/outputs/data/04-annual_circulation_data.csv"
)

# Merge Branch and Visits Data by Branch Code
branch_visits_data <-
  merge(cleaned_branch_data, cleaned_visits_data, by = "branch_code", 
        all.x = TRUE)

# Sum the visits Column Totals by ward_no and year
branch_visits_data <-
  branch_visits_data |>
  group_by(ward_no, year) |>
  summarise(ward_total = sum(visits))

#Save the Merged Data
write_csv(
  x = branch_visits_data,
  file = "~/tplactivityanalysis/outputs/data/05-annual_visits_by_ward_data.csv"
)

# Sum the total annual visits by year
annual_visits_data <-
  branch_visits_data |>
  group_by(year) |>
  summarise(annual_total = sum(ward_total))

# Save the Merged Data
write_csv(
  x = annual_visits_data,
  file = "~/tplactivityanalysis/outputs/data/06-annual_visits_data.csv"
)
