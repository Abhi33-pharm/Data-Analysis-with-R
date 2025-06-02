# 1. Introduction to Data Frames

# A data frame is one of the most common data structures in R, used to store tabular health data.
# It is a two-dimensional structure where each column can have a different type of data (e.g., numeric, character, factor).
# Data frames are ideal for storing datasets where variables (columns) can have different types, such as patient information, clinical measurements, and categorical data like disease status.

# 2. Creating Data Frames

# 2.1 Using the `data.frame()` Function

# The `data.frame()` function is the main way to create a data frame in R. Each argument passed to this function becomes a column in the data frame.

# Example: Create a simple health data frame
patient_id <- c(101, 102, 103, 104)
age <- c(55, 60, 45, 50)
gender <- c("Male", "Female", "Female", "Male")
disease_status <- c("Diabetes", "Hypertension", "Healthy", "Diabetes")

# Create a data frame from the vectors
health_data <- data.frame(PatientID = patient_id, Age = age, Gender = gender, DiseaseStatus = disease_status)

# Output the data frame
health_data

# Explanation:
# - `PatientID`, `Age`, `Gender`, and `DiseaseStatus` are column names representing patient information and health status.
# - `patient_id`, `age`, `gender`, and `disease_status` are vectors passed as arguments to `data.frame()`, and each of them becomes a column in the data frame.
# - Each row represents a unique patient with their respective health information.

# 2.2 Data Frame with Mixed Data Types

# Columns in a data frame can have different data types, such as numeric, character, or factor. Here, we will add a numeric column for BMI (Body Mass Index).

height <- c(175, 160, 162, 170)  # Numeric column for height in cm
weight <- c(70, 80, 55, 65)  # Numeric column for weight in kg

# Create a new data frame with mixed data types
health_data2 <- data.frame(PatientID = patient_id, Age = age, Gender = gender, Height = height, Weight = weight, DiseaseStatus = disease_status)

# Output the new data frame
health_data2

# 3. Exploring Data Frames

# 3.1 Viewing the Structure of the Data Frame

# The `str()` function provides a compact summary of the data frame, showing the data types of each column and the first few entries.
str(health_data2)

# Explanation:
# - `str(health_data2)` gives an overview of the data frame, showing column names, their data types, and the first few values in each column.
# - This is particularly useful when you have a large dataset and want a quick summary.

# 3.2 Summarizing the Data Frame

# The `summary()` function provides summary statistics for each column of the data frame:
# - For numeric columns, it shows statistics like mean, min, max, and quartiles.
# - For character or factor columns, it shows frequency counts.

summary(health_data2)

# Explanation:
# - The `summary(health_data2)` output gives you an idea of the distribution and basic statistics of the columns.
# - This is particularly useful for understanding the data distribution, especially for numerical health metrics.

# 3.3 Accessing the Column Names

# You can access the names of the columns in a data frame using the `names()` function.

names(health_data2)

# Explanation:
# - `names(health_data2)` returns a character vector with the names of the columns in the data frame.
# - This is useful if you want to know or manipulate the column names programmatically.

# 3.4 Getting the Dimensions of the Data Frame

# To get the dimensions of the data frame (i.e., the number of rows and columns), use the `dim()` function.

dim(health_data2)

# Explanation:
# - `dim(health_data2)` returns a vector with two values: the number of rows and the number of columns in the data frame.
# - This helps you understand the size of the data frame at a glance.

# 3.5 Checking the First and Last Rows

# The `head()` and `tail()` functions are useful for inspecting the first few and the last few rows of a data frame, respectively.

head(health_data2)  # First 6 rows
tail(health_data2)  # Last 6 rows

# Explanation:
# - `head(health_data2)` shows the first 6 rows of the data frame.
# - `tail(health_data2)` shows the last 6 rows of the data frame.
# - These functions are useful for quickly inspecting a portion of the data.

# 3.6 Checking the Data Types of Columns

# To check the data type of each column, you can use the `sapply()` function, which applies the `class()` function to each column.

sapply(health_data2, class)

# Explanation:
# - `sapply(health_data2, class)` returns a vector showing the class (data type) of each column in the data frame.
# - This is helpful when you need to check whether the columns are of the expected types (e.g., numeric, character, etc.).

# 4. Practice Exercise: Data Frame Creation and Exploration

# Below is an exercise to help you practice creating and exploring data frames in the context of health research. Run the code and try to understand the output.

exercise_instruction <- "
1. Create a data frame with columns for patient ID, age, gender, height, weight, and disease status.
   Add at least 5 patients.
2. Use the `summary()` function to see the summary statistics of your data frame.
3. Use `head()` to display the first few rows of the data frame.
4. Use `str()` to check the structure of your data frame.
5. Check the column names of the data frame using the `names()` function.
6. Check the data types of the columns using `sapply()`.
"
exercise_instruction
