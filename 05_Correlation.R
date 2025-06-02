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

# Perform correlation (+1, -1)
# Strength of the correlation: +1, -1
cor(data$General_Health, data$QOL_Score)

# Correlation matrix 
num_data <- data |> 
  select(18:28)

# correlation matrix 
corr_result <- correlation(num_data)
corr_result |> 
  summary(reundant = TRUE) |> 
  plot()
ggsave("figures/correlation_mat.png", dpi = 300)







