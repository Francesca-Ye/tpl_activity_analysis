#### Preamble ####
# Purpose: Create a simulated data set that looks at the annual Toronto Public 
# Library circulation and workspace usage counts by each Toronto Ward and their
# respective population.
# Author: Francesca Ye
# Email: francesca.ye@mail.utoronto.ca
# Date: 19 January 2024
# Prerequisites: N/A

#### Workspace set up ####
# install.packages("tidyverse")
library(tidyverse)

#### Simulated Data set ####
simulated_library_data <-
  tibble(
    # Create a column for each year 25 times to record annual data
    "Year" = rep(x = 2017:2021, each = 25),
    # Create a column for each of Toronto's 25 wards for each year
    "Ward" = rep(x = 1:25, times = 5),
    # Create a column for the annual library circulation data of each ward
    "Circulation" = sample(x = 0:40000, size = 25 * 5, replace = TRUE),
    # Create a column for the annual library visitation data of each ward
    "Visits" = sample(x = 0:40000, size = 25 * 5, replace = TRUE)
  )

# View the first 6 rows of the simulated data set
# head(simulated_data)

#### Simulated Data Tests ####

# The "Circulation" values are always integers
simulated_library_data$Circulation |>
  class() == "integer"

# The "Visits" values are always integers
simulated_library_data$Visits |>
  class() == "integer"

# The "Ward" values are always integers
simulated_library_data$Ward |>
  class() == "integer
"
# The "Ward" values are exclusively 1-25
simulated_library_data |>
  unique() == 1:25

# The "Ward" values appear exactly 5 times each
simulated_library_data |>
  group_by(Ward) |>
  summarise(count = n()) |>
  filter(count != 5)

# The "Year values are always integers
simulated_library_data$Year |>
  class() == "integer"

# The "Year" values are exclusively 2017-2021
simulated_library_data |>
  unique() == 2017:2021

#The smallest "Year" value is 2017
simulated_library_data$Year |>
  min() == 2017

#The largest "Year" value is 2021
simulated_library_data$Year |>
  max() == 2021

# The "Year" values appear exactly 25 times each
simulated_library_data |>
  group_by(Year) |>
  summarise(count = n()) |>
  filter(count != 25)
