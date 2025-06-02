# load required packages 
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

# dengue data 
dengue_data <- read.csv("data/dengue_data.csv")

# Univariate Poisson Regression: Effect of Rainfall on Dengue Cases
uv_poisson <- glm(DengueCases ~ Rainfall, 
                  data = dengue_data, 
                  family = poisson(link = "log"))  

# Reporting results
report(uv_poisson)

# table 
uv_poisson |> 
  tbl_regression() |> 
  bold_p(t = 0.05) |> 
  bold_labels() |> 
  as_gt()


# Multivariate Poisson Regression: Effect of Rainfall and Temperature
mv_poisson <- glm(DengueCases ~ Rainfall + Temperature, 
                  data = dengue_data, 
                  family = poisson(link = "log"))  

# table 
mv_poisson |> 
  tbl_regression() |> 
  bold_p(t = 0.05) |> 
  bold_labels() |> 
  as_gt()



