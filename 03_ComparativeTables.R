# load required packages
library(tidyverse)
library(gtsummary)
library(gt)

# import the data
data <- read.csv("data/Thalassemia_QoL_Clean.csv")

# Table 3. Demographic characteristics of the patients by quality of life status
data |>
  select(1:8, QOL_Status) |>
  tbl_summary(
    statistic = all_continuous() ~ "{mean}±{sd}",
    by = QOL_Status
  ) |>
  add_overall() |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/Table3.docx")

# Table 4. Clinical characteristics of thalassemia patients by quality of status
data |>
  select(9:17, QOL_Status) |>
  tbl_summary(
    statistic = all_continuous() ~ "{mean}±{sd}",
    type = c("Severity", "Previous_3Months_Transfution", "Splenectomy_Status") ~ "categorical",
    by = QOL_Status
  ) |>
  add_overall() |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/Table4.docx")
