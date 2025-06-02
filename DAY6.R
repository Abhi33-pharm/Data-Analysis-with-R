# Install Packages
install.packages("tidyverse")
install.packages("naniar")
install.packages("readxl")
install.packages("openxlsx")


# Load packages
library(tidyverse)
library(naniar)
library(readxl)
library(openxlsx)


# Finding missing value
test <- c(0, -1, 1, NA)
test

test2 <- test/0
test2


# Look NaN
is.nan(test)
is.nan(test2)

# Look NA
is.na(test)
is.na(test2)


# Look inf
is.infinite(test)
is.infinite(test2)


# anu() & sum()
any(is.na(test))
any(is.na(test2))


sum(is.na(test))
sum(is.na(test2))
sum(is.infinite(test2))

# Default Data
data()

starwars
names(starwars)

# Checking missing value
any(is.na(starwars))

# Checking missing summary
miss_var_summary(starwars)
miss_var_which(starwars)

# Checking missing visual
gg_miss_var(starwars)


# Missing value issue
marks <- c(67, 90, 82, 91, 70, NA)


mean(marks)
median(marks)
sum(marks)

# Remove missing value
mean(marks, na.rm = TRUE)
median(marks, na.rm = T)
sum(marks, na.rm = T)


# Missing value removing from Data frame
dim(starwars)

star_drop <- drop_na(starwars)
gg_miss_var(star_drop)
dim(star_drop)


# Conversion of data character to factor
glimpse(starwars)

gg_miss_var(starwars)

starwars |> 
  mutate_if(is.character, as.factor) |> 
  glimpse()

# Data imputation
mass_med <- median(starwars$mass, na.rm = T)
height_med <- median(starwars$height, na.rm = T)

starwars |> 
  count(sex)


starwar_recode <- starwars |> 
  mutate(mass = replace_na_with(mass, mass_med)) |> 
  mutate(height = replace_na_with(height, height_med)) |> 
  mutate(sex = replace_na_with(sex, "male"))
  

gg_miss_var(starwar_recode)


# Data Import
a <- read_excel("Data/cleaning_diet_data.xlsx")
b <- read.csv("Data/CSV_data.csv")
c <- read.table("Data/text_data.txt")


# Data Export
write.xlsx(a, "Output/xlsx_exporrt.xlsx")
write.csv(a, "Output/csv_export.csv", row.names = F)
write.table(a, "Output/text_export.txt")


# Data upload
data <- read_excel("Data/cleaning_diet_data.xlsx")

data |> 
  count(Treatment)


# first method to clean
data |> 
  mutate(Treatment_recoded = case_when(
    Treatment == "Mint" ~ "Peppermint",
    Treatment == "mint" ~ "Peppermint",
    Treatment == "peppermint" ~ "Peppermint",
    Treatment == "O" ~ "Other",
    Treatment == "Ginger" ~ "Ginger",
    Treatment == "Other" ~ "Other"
  )) |> 
  count(Treatment_recoded)

# Efficient way
data |> 
  mutate(Treatment_recoded = case_when(
    Treatment %in% c("Mint", "mint", "peppermint") ~ "Peppermint",
    Treatment %in% c ("o", "O", "other") ~ "Other",
    TRUE ~ Treatment
  ))

# Categorize
data |> 
  mutate(Effect = case_when(
    Weight_change > 0 ~ "Increase",
    Weight_change == 0 ~ "Same",
    Weight_change < 0 ~ "Decrease"
  ))



# str_detect()

data |> 
  filter(str_detect(string = Treatment, pattern = "inge"))


data |> 
  filter(str_detect(string = Treatment, pattern = "^O"))



# data cleaning with str_detect

data |> 
  mutate(Treatment_recoded = case_when(
    str_detect(string = Treatment, pattern = "int") ~ "Peppermint",
    str_detect(string = Treatment, pattern = "^O|^o") ~ "Other",
    T ~ Treatment
  ))


# Data Reshaping
data <- read_excel("Data/Life_Expectancy.xlsx")


long <- data |> pivot_longer(cols = 2:75,
             names_to = "Year",
             values_to = "Life_expectency")


wide <- long |> 
  pivot_wider(names_from = Year,
              values_from = Life_expectency)



# data merging
demographic <- read.csv("Data/demographics.csv")
test <-  read.csv("Data/tests.csv")
medication <- read.csv("Data/medications.csv")

first_merge <- merge(demographic,
      test,
      by = "PatientID",
      all = T)


Final <- merge(first_merge,
      medication,
      by = "PatientID",
      all = T)


