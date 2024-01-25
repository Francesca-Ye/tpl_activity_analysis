#### Preamble ####
# Purpose: Download and save the required data sets from Open Data Toronto in 
# order to create a report that looks at the annual Toronto Public Library 
# circulation and work space usage counts by each Toronto Ward and city-wide
# annual totals. Uses "Library Branch General Information", "Library Circulation", 
# and "Library Visits."
# Author: Francesca Ye
# Email: francesca.ye@mail.utoronto.ca
# Date: 19 January 2024
# Prerequisites: Access to Open Data Toronto

#### Work Space Set Up ####

# install.packages("dplyr")
# install.packages("opendatatoronto")

library(dplyr)
library(opendatatoronto)

#### Read and Download the Data ####

# Read Library Branch General Information Data Set
raw_library_branch_data <-
  read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/f5aa9b07-da35-45e6-b31f-d6790eb9bd9b/resource/1c9e7b16-c8fc-4925-9639-1253b6e02422/download/tpl-branch-general-information-2023.csv")

# Save Library Branch General Information Data Set
write_csv(
  x = raw_library_branch_data,
  file = "~/tpl_activity_analysis/inputs/data/00-unedited_branch_data.csv"
)

# Read Library Circulation Data Set
raw_library_circulation_data <-
  read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80f89d58-fc77-41b4-8d7d-c8f056168a6a/resource/d27bb12b-2575-442f-a410-a720e1de09bf/download/tpl-circulation-annual-by-branch-2012-2022.csv")

# Save Library Circulation Data Set
write_csv(
  x = raw_library_circulation_data,
  file = "~/tpl_activity_analysis/inputs/data/01-unedited_circulation_data.csv"
)

# Read Library Visits Data Set
raw_library_visits_data <-
  read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/932efbb4-644f-401b-9f59-af0b31713f44/resource/a6c98238-39c9-4043-b32a-98d113ccba93/download/tpl-visits-annual-by-branch-2012-2022.csv")

# Save Library Visits Data Set
write_csv(
  x = raw_library_visits_data,
  file = "~/tpl_activity_analysis/inputs/data/02-unedited_visit_data.csv"
)
