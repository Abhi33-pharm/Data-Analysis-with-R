# import data
data <- read.csv("data/pulse_data.csv", stringsAsFactors = TRUE)

# check data structure
str(data)

# check missing values
is.na(data)
sum(is.na(data))
sum(is.na(data$Height))

# 1. Numerical summary
# summary functions (min, max, range)
min(data$Height, na.rm = T)
max(data$Height, na.rm = T)
range(data$Height, na.rm = T)
max(data$Height, na.rm = T) - min(data$Height, na.rm = T)

# summary functions (central values)
mean(data$Height, na.rm = T)
median(data$Height, na.rm = T)

# summary functions (dispersion)
sd(data$Height, na.rm = T)
IQR(data$Height, na.rm = T)

# impact of outliers
sys_bp <- c(99, 110, 95, 87, 111, 100)

min(sys_bp)
max(sys_bp)
max(sys_bp) - min(sys_bp)

mean(sys_bp)
sd(sys_bp)

# add outliers
sys_bp2 <- c(99, 110, 95, 87, 111, 100, 450)

min(sys_bp2)
max(sys_bp2)
max(sys_bp2) - min(sys_bp2)

mean(sys_bp2)
sd(sys_bp2)

median(sys_bp2)
q1 <- quantile(sys_bp2, 0.25)
q1

q2 <- quantile(sys_bp2, 0.5)
q2

q3 <- quantile(sys_bp2, 0.75)
q3

iqr <- q3 - q1
iqr

# 2. Graphical summary
# histogram
hist(
  data$Height
)

# density plot
plot(density(data$Height, na.rm = T))

# Summary
# - min, max, range
# - mean, sd
# - median, IQR
# - impact of outliers
# - visual analysis




