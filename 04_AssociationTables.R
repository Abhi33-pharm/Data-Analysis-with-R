# load packages 
library(tidyverse)
library(gtsummary)
library(gt)

# load the data 
data <- read.csv("data/Thalassemia_QoL.csv")

# Association Tables 
data |> 
  select(9:16, Gender) |> 
  tbl_summary(
    by = Gender,
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"
    ), 
    type = c("Severity", "Previous_3Months_Transfution", "Splenectomy_Status") ~ "categorical" 
  ) |> 
  bold_labels() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table6.docx")
