# load required packages 
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

# data import 
data <- read.csv("data/Thalassemia_QoL.csv")

# data processing 
data <- data |> 
  rename(QOL_Score = Total_SF_Score) |> 
  mutate(QOL_Status_Nominal = case_when(
    QOL_Score <= 50 ~ 0, # "Poor", 
    QOL_Score > 50 ~ 1 # "Good"
  )) |> 
  mutate(QOL_Status_Ordinal = case_when(
    QOL_Score <= 50 ~ 0, # Poor
    QOL_Score > 50 & QOL_Score <= 75 ~ 1, # Moderate 
    QOL_Score > 75 ~ 2 # Good 
  ))

# Univariate: Impact of `gender (x)` on `quality of life score (y)`
# y(outcome/dependent) = `quality of life score` = numeric (Linear Regression)
# x(independent) = gender 
# Equation: y = mx + c 
uv_lm <- lm(QOL_Score ~ Gender, data = data)
report(uv_lm)

uv_lm |> 
  tbl_regression() |> 
  bold_p(t = 0.05)

# Factors associated with quality of life in the univariate linear regression analysis
data |> 
  select(1:17, QOL_Score) |> 
  tbl_uvregression(
    y = QOL_Score, 
    method = lm
  ) |> 
  bold_p(t = 0.05) |> 
  bold_labels() |> 
  as_gt() |> 
  gtsave("tables/UV_LM.docx")


# Univariate: Impact of `gender (x)` on `quality of status(y)`
# y(outcome/dependent) = `quality of status` = nominal/category (Logistic Regression)
# x(independent) = gender 
uv_logreg <- glm(QOL_Status_Nominal ~ Gender, family = "binomial", data = data)
report(uv_logreg) |> 
  summary()

uv_logreg |> 
  tbl_regression(exponentiate = T) |> 
  bold_p(t = 0.05)

# Factors associated with quality of life in the univariate logistic regression analysis
data |> 
  select(1:17, QOL_Status_Nominal) |> 
  tbl_uvregression(
    y = QOL_Status_Nominal, 
    method = glm, 
    ethod.args = list(family = binomial)
  ) |> 
  bold_p(t = 0.05) |> 
  bold_labels() |> 
  as_gt() |> 
  gtsave("tables/UV_Logreg.docx")











