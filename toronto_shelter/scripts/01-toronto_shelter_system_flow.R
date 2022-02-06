#### Preamble ####
# Purpose: Gather information on the Toronto shelter system flow in 2020 to
# 2021
# Author: Min Chang
# Data: 4 Feburary 2022
# Contact: hyemin.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - None


#### Workspace setup ####

library(opendatatoronto)
library(tidyverse)
library(kableExtra)
library(forcats)
library(ggplot2)
library(knitr)
library(dplyr)
#install.packages("knitr")
#install.packages("ggplot2")
#install.packages("forcats")
#install.packages("kableExtra")

#### Gather Data #####
#Based on: https://open.toronto.ca/dataset/toronto-shelter-system-flow/
# Every dataset is part of a package of data and has its own specific ids.Visit
# the website above to obtain the ID. 
package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")


# Every dataset has its own resources (e.g. dataset) which can be retrieved
# by using the specific ID. 
resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")

# We want to gather data that contains information about the Toronto shelter
# system flow in 2020 to 2021.
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

#Get the dataset
data <- filter(datastore_resources, row_number()==1) %>% get_resource()


#### Save ####
write_csv(data,"inputs/data/toronto_shelter_system_flow.csv")




         