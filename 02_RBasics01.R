# Print a message
message <- "Hello World!"
print(message)  # Using print function
cat(message)    # Using cat function

# R as a Calculator
2 + 2           # Addition
2 - 3           # Subtraction
10 * 2          # Multiplication
2 ^ 3           # Exponentiation
10 / 2          # Division
10 %% 2         # Modulus (remainder of division)
11 %% 2         # Modulus with remainder

# Comments in R
# Single-line comment
# This is a single-line comment

# Multi-line comments
# This is the first line of a comment
# This is the second line
# This is the third line

print("Hi, Bangladesh")  # Printing a message

# Creating Variables in R

# Using `leftward` assignment operator `<-`
# Example: Variable name `num` with value 10
num <- 10

# Naming conventions:
# 1. Use meaningful names
# 2. Keep names clean and clear
a <- 30           # Ambiguous name, not recommended
age <- 30         # Descriptive name
my_age <- 30      # Clean and clear

# Reserved Words (Cannot be used as variable names)
?Reserved          # View reserved words in R
# TRUE <- 4       # Error: TRUE is a reserved word

# Getting Help in R
?sum               # Help for the sum function
?mean              # Help for the mean function
?plot              # Help for the plot function

# Data Types in R

# 1. Numeric Data
num1 <- 11         # Integer
num2 <- 10.5       # Float/Decimal
class(num1)        # Check the class of the variable
class(num2)

# 2. Character/Text Data
text <- "Hello CHIRAL"  # Assign text
class(text)             # Check the class

# 3. Logical Data
is_weekday <- TRUE  # Logical value
class(is_weekday)

# Operators in R

# Operators consist of operands and symbols:
# Example: 5 (operand) + (operator) 2 (operand) = 7 (output)

# 1. Arithmetic Operators
num1 <- 20
num2 <- 2

num1 + num2       # Addition
num1 - num2       # Subtraction
num1 * num2       # Multiplication
num1 / num2       # Division
num1 ** num2      # Power
num1 %% 2         # Modulus (remainder of division)
11 %% 2           # Modulus example with remainder

# 2. Relational Operators (Return Logical Values)
2 == 2            # Equal to
2 > 1             # Greater than
2 < 1             # Less than
2 >= 1            # Greater than or equal to
2 <= 1            # Less than or equal to
3 <= 3            # Less than or equal (example)
2 != 3            # Not equal to

# 3. Logical Operators
# Logical operators are used to combine conditions

# AND (&&) - Returns TRUE if all conditions are true
2 == 2 && 4 > 2    # TRUE
2 == 2 && 2 > 4    # FALSE
2 == 2 && 2 < 1    # FALSE

# OR (|) - Returns TRUE if at least one condition is true
2 > 1 | 2 == 1     # TRUE
2 < 1 | 2 == 1     # FALSE
3 == 3 | 3 < 3     # TRUE

# NOT (!) - Negates a condition
!2 == 2            # FALSE
!4 > 10            # TRUE

# Built-in Datasets
# Exploring built-in datasets
iris               # The famous iris dataset
str(iris)          # Structure of the iris dataset
plot(cars)         # Plot the built-in cars dataset
