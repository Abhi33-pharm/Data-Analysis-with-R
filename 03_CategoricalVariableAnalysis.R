# import data
data <- read.csv("data/pulse_data.csv", stringsAsFactors = TRUE)

# Categorical summary
# - frequency
# - percentage
# - proportion

# 1. Numerical summary for categorical variables
table(data$Gender)
prop.table(table(data$Gender))
prop.table(table(data$Gender)) * 100

# 2. Graphical summary
barplot(table(data$Gender))
pie(table(data$Gender))
