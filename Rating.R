# Load packages
library(tidyverse)
library(readxl)
library(lubridate)

# Load data and add variables
matches <- read_excel("Matches.xlsx") %>% 
  mutate(id = row_number()) %>% 
  rowwise() %>% 
  mutate(
    w1 = as.numeric(str_split(str_split(result, ", ")[[1]][1], "-")[[1]][1]),
    l1 = as.numeric(str_split(str_split(result, ", ")[[1]][1], "-")[[1]][2]),
    w2 = as.numeric(str_split(str_split(result, ", ")[[1]][2], "-")[[1]][1]),
    l2 = as.numeric(str_split(str_split(result, ", ")[[1]][2], "-")[[1]][2]),
    w3 = as.numeric(str_split(str_split(result, ", ")[[1]][3], "-")[[1]][1]),
    l3 = as.numeric(str_split(str_split(result, ", ")[[1]][3], "-")[[1]][2])
  ) %>% 
  ungroup()

# Plot rating
matches %>% 
  filter(!is.na(rating_new)) %>%
  ggplot(aes(x = id, y = rating_new)) +
  geom_line() +  
  geom_point() +
  labs(title = "Development of Actual Rating in 2022",
       y = "",
       x = "")

