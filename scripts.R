# install package
install.packages("tidyverse")
install.packages("skimr")
install.packages("openxlsx")
install.packages("readxl")
insta

# load package
library(tidyverse)
library(skimr)
library(openxlsx)
library(readxl)
library(dplyr) 

# data
install.packages("gapminder")
library(gapminder)


# data exploration
# 1. dimension
dim(gapminder)
ncol(gapminder)
nrow(gapminder)

# 2. data structure
glimpse(gapminder)
str(gapminder)


# data inspection
# 1. first few rows
head(gapminder)
head(gapminder, n = 10)

# 2. last few rows
tail(gapminder)
tail(gapminder, n = 15)

# 3. sampling
sample_n(gapminder, 10)


# 4. fraction
sample_frac(gapminder, 0.30)


# missing value

is.na(gapminder)
is.na(airquality)

# How many?
sum(is.na(gapminder))
sum(is.na(airquality))

# Which columns?
colSums(is.na(gapminder))
colSums(is.na(airquality))

# Duplicated row
duplicated(gapminder)
duplicated(airquality)

# How many?
sum(duplicated(gapminder))
sum(duplicated(airquality))

# Summary
summary(gapminder)
skim(gapminder)

# Pick column
# 1. by name
select(gapminder, country)

select(gapminder, country, continent)


# by column number
select(gapminder, 1)
select(gapminder, 3)

select(gapminder, c(1,3,4))

select(gapminder, 1:3)


# by first letter
select(gapminder, starts_with("c"))

# by last letter
select(gapminder, ends_with("p"))


# Remove column
# 1. by name
select(gapminder, -country)

select(gapminder, -c(country, continent))


# by column number
select(gapminder, -1)
select(gapminder, -3)

select(gapminder, -c(1,3,4))

select(gapminder, -(1:3))


# filter
# equality
filter(gapminder, country == "Bangladesh")

# not equality
filter(gapminder, country != "Bangladesh")


# grater 
filter(gapminder, lifeExp > 30)

# less 
filter(gapminder, lifeExp < 25)

# grater or equal
filter(gapminder, lifeExp >= 30)

# less or equal
filter(gapminder, lifeExp <= 25)

# multiple condition

filter(gapminder, country %in% c("India", "Bangladesh", "Pakistan"))

# select & filter
select(gapminder, country, continent, lifeExp)
filter(gapminder, lifeExp > 30)

# How?
gapminder_new <- select(gapminder, country, continent, lifeExp)
filter(gapminder_new, lifeExp > 30)

# pipe operator (clt+shirt+M) |> (chaining method)

gapminder |> 
  select(country, continent, lifeExp) |> 
  filter(lifeExp > 30)

# mutate ~ creating new columns

gapminder |> 
  mutate(gdp = gdpPercap * pop / 10^6 )


# rename
gapminder |> 
  rename(population = pop)

# sort 


gapminder

















