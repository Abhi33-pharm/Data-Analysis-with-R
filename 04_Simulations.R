# Numbers of samples
n <- 1000

# 1. Normal Distribution (e.g., blood pressure, height, or test scores)
# The normal distribution is widely used for `continuous data` that tend to cluster around a mean.
mean <- 120
sd <- 15
normal_data <- rnorm(n, mean, sd)
normal_data

hist(normal_data)
plot(density(normal_data))


# 2. Binomial Distribution (e.g., infection rates, pass/fail outcomes)
# Binomial distribution is used for binary outcomes (success/failure) over multiple trials.
size <- 100
prob <- 0.3
bionomial_data <- rbinom(n, size, prob)
bionomial_data
barplot(table(bionomial_data))

# 3. Poisson Distribution (e.g., number of disease cases in a specific area)
lambda <- 5
poison_data <- rpois(n, lambda)
poison_data
barplot(table(poison_data))

# Example 1. Simulating the Total Number of Cases in an Outbreak
# Assume an outbreak where the number of cases in a population follows a Poisson distribution
n_simulations <- 1000
lambda <- 50
poison_simulation <- rpois(n_simulations, lambda)
barplot(table(poison_simulation))
