# load required packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

# import the data
data <- read.csv("data/Thalassemia_QoL_Clean.csv") |>
  mutate(QOL_Status_Code = case_when(
    QOL_Status == "Poor" ~ 0,
    QOL_Status == "Good" ~ 1
  ))

# set ref category
data$Gender <- factor(data$Gender, levels = c("Male", "Female"))

#Set ref category for ordinal
data$knowledge <- factor(data$knowledge, levels=c ("Poor","Moderate","Good"), ordered= TRUE)

# Outcome = binary/categorical (quality of life status)
# Simple/Univariate Logistic Regression
# Impact of `gender`(independent=x) on `quality of life score` (outcome/dependent)
uv_logreg_model <- glm(QOL_Status_Code ~ Gender, family = "binomial", data = data)
report(uv_logreg_model)

# univariate regression table for Logistic Regression
data |>
  select(1:4, QOL_Status_Code) |>
  tbl_uvregression(
    method = glm,
    method.args = list(family = binomial),
    y = QOL_Status_Code,
    exponentiate = TRUE
  ) |>
  bold_p(t = 0.05) |>
  as_gt() |>
  gtsave("tables/UV_LogReg.docx")

# OR > 1 ~ Positive
# OR < 1 ~ Negative
# OR = 1 ~ No Association

# Multivariate Logistic Regression
# Impact of gender (x1), age (x2) and `marital status (x3)` on `quality of life score` (outcome/dependent=y)
mv_logreg_model <- glm(QOL_Status_Code ~ Age_of_Participants + Gender + Marital_Status + Type_of_Family, family = "binomial", data = data)
report(mv_logreg_model)

# multivariate regression analysis table
mv_logreg_model |>
  tbl_regression(exponentiate = T) |>
  bold_p(t = 0.05) |>
  bold_labels() |>
  as_gt() |>
  gtsave("tables/MV_LogRegReg.docx")


# merge tables
uv_tbl <- data |>
  select(1:4, QOL_Status_Code) |>
  tbl_uvregression(
    method = glm,
    method.args = list(family = binomial),
    y = QOL_Status_Code,
    exponentiate = TRUE
  )
uv_tbl

mv_tbl <- mv_logreg_model |>
  tbl_regression(exponentiate = T) |>
  bold_p(t = 0.05) |>
  bold_labels()
mv_tbl

tbl_merge(
  tbls = list(uv_tbl, mv_tbl),
  tab_spanner = c("**Univariate**", "**Multivariate**")
) |>
  as_gt() |>
  gtsave("tables/uv_mv_merged_logreg.docx")

