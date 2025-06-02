# load required packages
library(tidyverse)
library(naniar)

# import the data
raw_data <- read.csv("data/Thalassemia_QoL.csv")

# recode the data
clean_data <- raw_data |>
  mutate(Gender = case_when(
    Gender == 1 ~ "Male",
    Gender == 2 ~ "Female"
  )) |>
  mutate(Marital_Status = case_when(
    Marital_Status == 1 ~ "Single",
    Marital_Status == 2 ~ "Married"
  )) |>
  mutate(Type_of_Family = case_when(
    Type_of_Family == 1 ~ "Nuclear",
    Type_of_Family == 2 ~ "Joint",
    Type_of_Family == 3 ~ "Broken"
  )) |>
  mutate(QOL_Status = case_when(
    QOL_Score <= 50 ~ "Poor",
    QOL_Score > 50 ~ "Good"
  ))

# check missing values
sum(is.na(clean_data))
gg_miss_var(clean_data)

# drop missing values
clean_data <- drop_na(clean_data)

# export the clean data
write.csv(clean_data, "data/Thalassemia_QoL_Clean.csv", row.names = FALSE)

