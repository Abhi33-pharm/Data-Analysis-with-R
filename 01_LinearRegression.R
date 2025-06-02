# load required packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

# import the data
data <- read.csv("data/Thalassemia_QoL_Clean.csv")

# Outcome = numeric (quality of life score)
# Simple/Univariate Linear Regression (y = mx + c)
# Impact of `gender`(independent=x) on `quality of life score` (outcome/dependent)
uv_model1 <- lm(QOL_Score ~ Gender, data = data)
uv_model2 <- lm(QOL_Score ~ Marital_Status, data = data)
report(uv_model2)

# univariate regression table for linear regression
data |>
  select(1:17, QOL_Score) |>
  tbl_uvregression(
    y = QOL_Score,
    method = lm
  ) |>
  bold_p(t = 0.05) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/UV_LinearReg.docx")


# Multivariate Linear Regression (y = m1x1 + m2x2 + m3x3 + c)
# Impact of gender (x1), age (x2) and `marital status (x3)` on `quality of life score` (outcome/dependent=y)
mv_model <- lm(QOL_Score ~ Age_of_Participants + Gender + Marital_Status + Type_of_Family, data = data)
report(mv_model)

# multivariate regression analysis table
mv_model |>
  tbl_regression() |>
  bold_p(t = 0.05) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/MV_LinearReg.docx")


# merge tables
uv_tbl <- data |>
  select(1:4, QOL_Score) |>
  tbl_uvregression(
    y = QOL_Score,
    method = lm
  ) |>
  bold_p(t = 0.05) |>
  bold_labels()
uv_tbl

mv_tbl <- mv_model |>
  tbl_regression() |>
  bold_p(t = 0.05) |>
  bold_labels()
mv_tbl

tbl_merge(
  tbls = list(uv_tbl, mv_tbl),
  tab_spanner = c("**Univariate**", "**Multivariate**")
) |>
  as_gt() |>
  gtsave("tables/uv_mv_merged.docx")

