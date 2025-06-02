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

# Multivariate: Impact of `gender (x1)`, `marital_status(x2)`, `type of family(x3)` on `quality of life score (y)`
# y(outcome/dependent) = `quality of life score` = numeric (Linear Regression)
# x(independent) = gender,  marital_status, type_of_family 
# Equation: y = mx1 + mx2 + mx3 + c 
mv_lm <- lm(QOL_Score ~ Gender + Marital_Status + Type_of_Family, data = data)
report(mv_lm)

mv_lm |> 
  tbl_regression() |> 
  bold_p(t = 0.05) |> 
  bold_labels() |> 
  as_gt() |> 
  gtsave("tables/MV_LM.docx")

# Multivariate: Impact of `gender (x1)`, `marital_status(x2)`, `type of family(x3)` on `quality of status(y)`
# y(outcome/dependent) = `quality of status` = nominal/category (Logistic Regression)
# x(independent) = gender,  marital_status, type_of_family
mv_logreg <- glm(QOL_Status_Nominal ~ Gender + Marital_Status + Type_of_Family, family = "binomial", data = data)
report(mv_logreg)

mv_logreg |> 
  tbl_regression(exponentiate = T) |> 
  bold_p(t = 0.05) |> 
  bold_labels() |> 
  as_gt() |> 
  gtsave("tables/MV_Logreg.docx")

