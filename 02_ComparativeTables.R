# load packages 
library(tidyverse)
library(gtsummary)
library(gt)

# load the data 
data <- read.csv("data/Thalassemia_QoL.csv")

# Domain summary 
data |> 
  select(18:28, Gender) |> 
  tbl_summary(
    by = Gender, 
    type = everything() ~ "continuous", 
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"
    )
  ) |> 
  bold_labels() |> 
  as_gt() |> 
  gtsave("tables/Table3.docx")
