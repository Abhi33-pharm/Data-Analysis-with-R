# load required packages
library(tidyverse)
library(gtsummary)
library(easystats)
library(gt)

# import the data
data <- read.csv("data/Thalassemia_QoL_Clean.csv")

# impact of `gender` on quality of life (y = mx + c)
model <- lm(QOL_Score ~ Gender + Marital_Status, data = data)
report(model)

model |>
  tbl_regression() |>
  bold_p(t = 0.05) |>
  as_gt() |>
  gtsave("tables/sample_reg.docx")
