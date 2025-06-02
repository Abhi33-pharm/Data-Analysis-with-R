# import data
data <- read.csv("data/pulse_data.csv")

# exploring the data
# 1. check the dimension of the data
dim(data)
ncol(data)
nrow(data)

# 2. check the data structure
str(data)

# 3. why data structure is so important
# 1. Numerical summary (min, max, mean, median, Q1, Q2, Q3)
# 2. Categorical summary (frequency, percentage)
summary(data)

# 4. convert the data structure (as family)
data$Gender <- as.factor(data$Gender)
data$Smokes <- as.factor(data$Smokes)
data$Alcohol <- as.factor(data$Alcohol)
data$Exercise <- as.factor(data$Exercise)
data$Ran <- as.factor(data$Ran)

