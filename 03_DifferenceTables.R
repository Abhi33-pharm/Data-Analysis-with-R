# load packages 
library(tidyverse)
library(gtsummary)
library(gt)

# load the data 
data <- read.csv("data/Thalassemia_QoL.csv")

# Difference between two groups 
data |> 
  select(18:28, Gender) |> 
  tbl_summary(
    by = Gender, 
    type = everything() ~ "continuous", 
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"
    )
  ) |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table4.docx")

# Difference between more than two groups 
data |> 
  select(18:28, Economic_Class) |> 
  tbl_summary(
    by = Economic_Class, 
    type = everything() ~ "continuous", 
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"
    )
  ) |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table5.docx")