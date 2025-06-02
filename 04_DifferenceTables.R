# load required packages
library(tidyverse)
library(gtsummary)
library(gt)

# import the data
data <- read.csv("data/Thalassemia_QoL_Clean.csv")


# Difference table for 2 groups
data |>
  select(18:28, Gender) |>
  tbl_summary(
    type = everything() ~ "continuous",
    by = Gender
  ) |>
  add_p() |>
  bold_p(t = 0.05) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/Table4.docx")


# Difference table for 2+ groups
data |>
  select(18:28, Economic_Class) |>
  tbl_summary(
    type = everything() ~ "continuous",
    by = Economic_Class
  ) |>
  add_p() |>
  bold_p(t = 0.05) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/Table5.docx")
