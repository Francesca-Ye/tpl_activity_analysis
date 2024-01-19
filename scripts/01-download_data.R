#### Preamble ####
# Purpose: Download and save the required data sets from Open Data Toronto in 
# order to create a report that looks at the annual Toronto Public Library 
# circulation and workspace usage counts by each Toronto Ward and their
# respective population. Uses "Library Branch General Information", "Library 
# Circulation", and "Library Visits."
# Author: Francesca Ye
# Email: francesca.ye@mail.utoronto.ca
# Date: 19 January 2024
# Prerequisites: Access to Open Data Toronto

#### Work space set up ####
# install.packages("dplyr")
# install.packages("opendatatoronto")

library(dplyr)
library(opendatatoronto)

#### Read and Download the Data ####

# Read Library Branch General Information Data Set
raw_library_branch_data <-
  show_package("f5aa9b07-da35-45e6-b31f-d6790eb9bd9b")

# Save Library Branch General Information Data Set
write_csv(
  x = raw_library_branch_data,
  file = "~/tplactivityanalysis/inputs/data/00-unedited_branch_data.csv"
)

# Read Library Circulation Data Set
raw_library_circulation_data <-
  show_package("80f89d58-fc77-41b4-8d7d-c8f056168a6a")

# Save Library Circulation Data Set
write_csv(
  x = raw_library_circulation_data,
  file = "~/tplactivityanalysis/inputs/data/01-unedited_circulation_data.csv"
)

# Read Library Visits Data Set
raw_library_visits_data <-
  show_package("932efbb4-644f-401b-9f59-af0b31713f44")

# Save Library Visits Data Set
write_csv(
  x = raw_library_visits_data,
  file = "~/tplactivityanalysis/inputs/data/02-unedited_visit_data.csv"
)
