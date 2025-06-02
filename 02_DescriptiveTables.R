# load required packages
library(tidyverse)
library(gtsummary)
library(gt)

# import the data
data <- read.csv("data/Thalassemia_QoL_Clean.csv")

# Table 1. Demonstrates the demographic characteristics of the patients (N=365)
data |>
  select(1:8) |>
  tbl_summary(
    statistic = all_continuous() ~ "{mean}±{sd}"
  ) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/Table1.docx")


# Table 2. Clinical characteristics of thalassemia patients
data |>
  select(9:17) |>
  tbl_summary(
    statistic = all_continuous() ~ "{mean}±{sd}",
    type = c("Severity", "Previous_3Months_Transfution", "Splenectomy_Status") ~ "categorical"
  ) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/Table2.docx")
