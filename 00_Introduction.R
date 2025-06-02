# Install Packages 
install.packages("tidyverse")
install.packages("gtsummary")
install.packages("gt")

# Load required packages 
library(tidyverse)
library(gtsummary)
library(gt)

# To get help (package)
?tidyverse
?gtsummary
?gt

# To get help (function)
?mean
?tbl_summary

# Explore built-in datasets 
data()
CO2 
trial

# Use view 
view(trial)

# tbl_summary (pipe - SHIFT + CLT + M)
trial |> 
  select(trt, age, grade) |> 
  tbl_summary(
    by = trt, 
    missing = "no", 
    statistic = list(
      all_continuous() ~ "{mean}({sd})", 
      all_categorical() ~ "{n}/{N}({p}%)"
    ), 
    digits = all_continuous() ~ 2, 
    label = grade ~ "Tumor Grade"
) |> 
  bold_labels() |> 
  italicize_labels() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/sample_table.docx")
  














