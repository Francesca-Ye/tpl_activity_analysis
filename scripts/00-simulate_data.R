#### Preamble ####
# Purpose: Create a simulated data set that looks at the annual Toronto Public 
# Library circulation and work space usage counts by each Toronto ward.
# Author: Francesca Ye
# Email: francesca.ye@mail.utoronto.ca
# Date: 19 January 2024
# Prerequisites: N/A

#### Work space set up ####
# install.packages("tidyverse")
library(tidyverse)

#### Simulated Data set ####
simulated_library_data <-
  tibble(
    # Create a column for each year 25 times to record annual data
    "Year" = rep(x = 2018:2022, each = 25),
    # Create a column for each of Toronto's 25 wards for each year
    "Ward" = rep(x = 1:25, times = 5),
    # Create a column for the annual library circulation data of each ward
    "Circulation" = sample(x = 0:40000, size = 25 * 5, replace = TRUE),
    # Create a column for the annual library visitation data of each ward
    "Visits" = sample(x = 0:40000, size = 25 * 5, replace = TRUE)
  )


