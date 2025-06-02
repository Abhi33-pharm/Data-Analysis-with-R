# 1. Introduction to Factors

# In R, a factor is a data structure used to represent categorical data, such as gender, age group, or species type.
# Factors are R's way of storing categorical variables, which can take a limited number of unique values (levels).
# Factors are stored as integers, with a corresponding set of labels, and are useful for representing nominal or ordinal data.

# Factors are important when working with categorical data, as they ensure correct handling of categories during analysis.

# 2. Creating Factors

# 2.1 Using the `factor()` function
# The `factor()` function is used to create a factor variable from a vector of categorical values.
# R automatically identifies the unique values (levels) of the factor.

# Example: Create a simple factor
gender <- factor(c("Male", "Female", "Female", "Male", "Female"))
gender

# 2.2 Specifying Levels Explicitly
# You can specify the levels (categories) of a factor explicitly using the `levels` argument. This allows you to set a custom order of levels.

# Example: Create a factor with specified levels
education <- factor(c("PhD", "Masters", "Bachelors", "PhD", "Masters"), 
                    levels = c("Bachelors", "Masters", "PhD"))
education

# 3. Factor Levels

# Each factor has a set of **levels**, which are the unique categories that the factor can take.
# The levels define the distinct values or categories for the variable.
# Factors store these values as integers internally, which are associated with the levels.

# Example: Display the levels of a factor
levels(education)

# 4. Accessing Factor Information

# 4.1 Accessing the Integer Representation
# Each level of a factor is internally represented by an integer.
# You can view the integer codes that R uses to store the factor by using the `as.integer()` function.

# Example: Get the integer representation of a factor
gender_integer <- as.integer(gender)
gender_integer

# 4.2 Accessing the Levels of a Factor
# The `levels()` function returns the levels (unique categories) of the factor.

# Example: Get the levels of a factor
education_levels <- levels(education)
education_levels

# 5. Modifying Factors

# 5.1 Changing Factor Levels
# You can modify the levels of a factor by using the `levels()` function or the `factor()` function. 
# Be careful when changing levels, as it may affect how the data is interpreted.

# Example: Change the levels of a factor
levels(gender) <- c("M", "F")
gender

# 5.2 Reordering Factor Levels
# Factors can be reordered, which may be necessary for ordinal data or to arrange categories in a specific order.

# Example: Reordering factor levels
education <- factor(c("PhD", "Masters", "Bachelors", "PhD", "Masters"),
                    levels = c("Bachelors", "Masters", "PhD"))
education

# You can reorder levels using the `relevel()` function. This function moves a specified level to the first position.

# Example: Releveling a factor
education <- relevel(education, ref = "Masters")
education

# 6. Summary of Factor Data

# 6.1 Summary of Factors
# The `summary()` function gives a summary of the factor variable, including the count of each level.

# Example: Summary of a factor
summary(education)

# 6.2 Frequency Table of Factors
# The `table()` function generates a frequency table that shows how often each level of a factor occurs.

# Example: Frequency table for a factor
table(gender)

# 7. Handling Missing Values in Factors

# 7.1 Missing Values (NA)
# Factors can contain missing values (NA). R handles missing values in factors in the same way it handles other types of data.

# Example: Create a factor with missing values
status <- factor(c("Single", "Married", NA, "Single", "Married"))
status

# 7.2 Checking for Missing Values
# Use the `is.na()` function to check for missing values in factors.

# Example: Check for missing values
is.na(status)

# 8. Converting Factors to Other Data Types

# 8.1 Converting a Factor to a Character Vector
# Factors can be converted to character vectors using the `as.character()` function.

# Example: Convert a factor to a character vector
gender_char <- as.character(gender)
gender_char

# 8.2 Converting a Factor to Numeric
# Factors are internally stored as integers. You can convert a factor to its numeric representation using `as.numeric()`. 
# This will return the internal integer codes used to represent the factor levels, not the level names.

# Example: Convert a factor to numeric
gender_numeric <- as.numeric(gender)
gender_numeric

# 9. Practice Exercises on Factors

# The exercises below can be used for practice. Execute the code to test your understanding of factors.

exercise_instruction <- "
1. Create a factor with the levels 'Low', 'Medium', and 'High' to represent the severity of a disease.
2. Create a factor for a categorical variable representing different blood groups: 'A', 'B', 'AB', 'O'.
3. Convert the factor variable representing blood groups to a character vector.
4. Change the levels of the disease severity factor to 'Mild', 'Moderate', and 'Severe'.
5. Check for missing values in a factor variable and display the positions of any missing values.
"
exercise_instruction
