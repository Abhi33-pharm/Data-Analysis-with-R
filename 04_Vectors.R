# 1. Vectors
# A vector in R is a sequence of elements, often used for storing health-related data like patient outcomes, measurements, etc.
# Common types in healthcare include logical (TRUE/FALSE), integer (counts), numeric (continuous data), character (categorical labels), and more.

# Create different types of vectors using the c() function
patient_status <- c(TRUE, FALSE, TRUE)        # Logical: Patient status (True = Healthy, False = Unhealthy)
blood_pressure <- c(120L, 130L, 140L)         # Integer: Blood pressure readings (systolic)
cholesterol_levels <- c(180.5, 200.1, 210.8) # Numeric: Cholesterol levels (mg/dL)
disease_types <- c("Hypertension", "Diabetes", "Asthma") # Character: Disease labels
medication_doses <- c(10+2i, 20+3i, 15+1i)   # Complex: Dosage adjustments (e.g., for dual therapies)

# 2. Vector Creation Using the ":" Operator (Useful in Epidemiology for Ranges)
age_range <- 18:65            # Sequence of ages for a study (e.g., patients aged 18 to 65)
age_range

# 3. Creating Sequences for Study Periods
time_points <- seq(1, 12, by = 3)  # Time points for quarterly data (e.g., patient visits)
time_points

# 4. Repeating Observations (E.g., Follow-up Visits)
follow_up_visits <- rep("Visit", times = 5)   # Repeating "Visit" 5 times for follow-up visits
follow_up_visits

# 5. Combining Health Data Vectors
age_data <- c(25, 34, 56, 45)               # Age data for patients
blood_sugar_levels <- c(90, 110, 130, 115)   # Corresponding blood sugar levels
combined_health_data <- c(age_data, blood_sugar_levels)  # Combine age and blood sugar data
combined_health_data

# 6. Mixed Healthcare Data Types
patient_names <- c("John", "Sara", "Michael")  # Character: Patient names
diagnosis_codes <- c("I10", "E11", "J45")      # Character: ICD-10 diagnosis codes
medication_names <- c("Atenolol", "Metformin", "Albuterol") # Medication names
treatment_durations <- c(30, 60, 90)            # Treatment durations in days

# 7. Vector Properties for Healthcare Data
# Length of the vector
patient_ages <- c(30, 45, 60, 35)
vector_length <- length(patient_ages)
vector_length

# Type and Structure of the Data
vector_type <- typeof(patient_ages)
vector_type

# Check structure of patient data
vector_structure <- str(patient_ages)   
vector_structure

# 8. Indexing and Subsetting Healthcare Data
# Accessing specific patient data (e.g., age)
second_patient_age <- patient_ages[2]
second_patient_age

# Subsetting based on certain conditions (e.g., patients older than 50)
older_patients <- patient_ages[patient_ages > 50]
older_patients

# Exclude specific entries (e.g., remove second patient data)
reduced_ages <- patient_ages[-2]
reduced_ages

# 9. Vector Operations for Statistical Analysis
# Arithmetic operations on healthcare data (e.g., calculating total and mean patient age)
age_sum <- sum(patient_ages)
age_mean <- mean(patient_ages)
age_sum
age_mean

# 10. Handling Missing Data (NA) in Health Records
# Create a vector with missing values (NA)
blood_sugar_levels <- c(90, NA, 130, 110)

# Check for missing values in health data
missing_data_check <- is.na(blood_sugar_levels)
missing_data_check

# Remove missing values (e.g., exclude incomplete patient records)
cleaned_blood_sugar_levels <- na.omit(blood_sugar_levels)
cleaned_blood_sugar_levels

# Replace missing values with a mean or a standard value (e.g., average blood sugar)
blood_sugar_levels[is.na(blood_sugar_levels)] <- mean(blood_sugar_levels, na.rm = TRUE)
blood_sugar_levels

# 11. Vector Recycling (Useful for different length datasets in public health analysis)
age_data <- c(30, 40)
blood_pressure_data <- c(120, 130, 140, 150)

# Recycled operation, where shorter vector is recycled to match the longer one (e.g., calculating rate of increase)
rate_of_increase <- age_data + blood_pressure_data  # This will repeat age data to match blood pressure data length
rate_of_increase

# 12. Advanced Operations for Healthcare Analysis
# Sorting healthcare data (e.g., sorting patients by age)
sorted_ages <- sort(patient_ages, decreasing = TRUE)
sorted_ages

# Finding unique health conditions among patients (e.g., diseases)
unique_diseases <- unique(disease_types)
unique_diseases

# Finding specific patient information
find_patient <- match(34, patient_ages)   # Find the index of the patient aged 34
find_patient

# Test if a patient is in the database (membership test)
is_patient_present <- 45 %in% patient_ages
is_patient_present

# 13. Apply Functions for Statistical Calculations
# Apply function to calculate squared values of patient ages for a model
age_squared <- sapply(patient_ages, function(x) x^2)
age_squared

# 14. Practice Exercise
# Task focused on healthcare data analysis:
exercise_instruction <- "
1. Create a vector with ages of 10 patients in a clinical study, ranging from 25 to 75.
2. Calculate the mean and standard deviation of their ages.
3. Identify all patients whose age is greater than 50.
4. Replace any age less than 30 with 20.
"
exercise_instruction
