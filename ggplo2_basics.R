# data manipulation
library(tidyverse)

# advanced visualization
library(ggpubr)
library(sjPlot)

# themes
library(ggthemes)
library(hrbrthemes)

# colors
library(RColorBrewer)
library(viridis)
library(paletteer)

# data
data <- read.csv("data/pulse_data.csv", stringsAsFactors = T)
glimpse(data)

# Steps in data visualization with ggplot2
# 1. Aesthetic (X, Y)
# 2. Visual property (charts type)
# 3. Position, shape, color, etc.
# 4. Data
# 5. A column in a dataset / variable

# ggplot2 template
ggplot(data =, aes(x = "", y = "")) + geom_type()


# simple bar chart
ggplot(data, aes(x = Alcohol)) +
  geom_bar()

# add color
ggplot(data, aes(x = Alcohol, fill = "#527E87FF")) +
  geom_bar()

# fill by a category
ggplot(data, aes(x = Alcohol, fill = Gender)) +
  geom_bar()

# position ~ dodge
ggplot(data, aes(x = Alcohol, fill = Gender)) +
  geom_bar(position = "dodge")

# boxplot
ggplot(data, aes(x = Gender, y = BMI)) +
  geom_boxplot()

# color by a category
ggplot(data, aes(x = Gender, y = BMI, fill = Alcohol)) +
  geom_boxplot()

# violin plot (for large data)
ggplot(data, aes(x = Gender, y = BMI)) +
  geom_violin()

# color by a category
ggplot(data, aes(x = Gender, y = BMI, fill = Alcohol)) +
  geom_violin()

# scatter plot
ggplot(data, aes(x = BMI, y = Weight)) +
  geom_point()

# group scatter plot
ggplot(data, aes(x = BMI, y = Weight, color = Gender)) +
  geom_point()

# line chart
ggplot(data, aes(x = Age, y = Height)) +
  geom_line()

# group line chart
ggplot(data, aes(x = Age, y = Height, color = Gender)) +
  geom_line()

# histogram
ggplot(data, aes(x = BMI)) +
  geom_histogram()

# play with bin size,binwitdth
ggplot(data, aes(x = BMI)) +
  geom_histogram(bins = 20, binwidth = 4)

# group histogram
ggplot(data, aes(x = BMI, fill = Gender)) +
  geom_histogram()

# density plot
ggplot(data, aes(x = BMI)) +
  geom_density()

# group density plot
ggplot(data, aes(x = BMI, fill = Gender)) +
  geom_density()

# splitting figures (facet)
ggplot(data, aes(x = BMI, fill = Gender)) +
  geom_density()+
  facet_wrap(~Gender)






