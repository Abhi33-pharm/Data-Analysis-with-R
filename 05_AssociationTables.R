# load required packages
library(tidyverse)
library(gtsummary)
library(gt)

# import the data
data <- read.csv("data/Thalassemia_QoL_Clean.csv")

# Association tables
data |>
  select(2:16, QOL_Status) |>
  tbl_summary(
    type = everything() ~ "categorical",
    by = QOL_Status
  ) |>
  add_p() |>
  bold_p(t = 0.05) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/Table5.docx")

