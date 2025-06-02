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

# Factors associated with quality of life in the univariate linear regression analysis
tbl1 <- data |> 
  select(1:17, QOL_Score) |> 
  tbl_uvregression(
    y = QOL_Score, 
    method = lm
  ) |> 
  bold_p(t = 0.05) 


# Factors associated with quality of life in the univariate logistic regression analysis
tbl2 <- data |> 
  select(1:17, QOL_Status_Nominal) |> 
  tbl_uvregression(
    y = QOL_Status_Nominal, 
    method = glm, 
    ethod.args = list(family = binomial)
  ) |> 
  bold_p(t = 0.05) 


# table merge 
tbl_merge(
  tbls = list(tbl1, tbl2),
  tab_spanner = c("**Linear Regression**", "**Logistic Regression**")
) |> 
  as_gt() |> 
  gtsave("tables/merged_table.docx")







