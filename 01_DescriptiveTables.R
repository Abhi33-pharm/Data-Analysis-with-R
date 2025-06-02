# load packages 
library(tidyverse)
library(gtsummary)
library(gt)

# load the data 
data <- read.csv("data/Thalassemia_QoL.csv")

# Table 1. The demographic characteristics of the patients
data |> 
  select(1:8) |> 
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"
    )
  ) |> 
  bold_labels() |> 
  as_gt() |> 
  gtsave("tables/Table1.docx")


# Table 2. Clinical characteristics of thalassemia patients
data |> 
  select(9:17) |> 
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"
    ), 
    type = c("Severity", "Previous_3Months_Transfution", "Splenectomy_Status") ~ "categorical" 
  ) |> 
  bold_labels() |> 
  as_gt() |> 
  gtsave("tables/Table2.docx")