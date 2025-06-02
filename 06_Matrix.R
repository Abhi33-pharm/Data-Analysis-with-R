# 1. Introduction to Matrices 

# A matrix is a two-dimensional array in R. It has rows and columns, with elements of the same type.
# Matrices are useful for representing data with two dimensions, such as datasets and numerical computations.

# Example: Create different types of matrices using matrix() function
matrix_numeric <- matrix(1:6, nrow = 2, ncol = 3)  # Numeric matrix
matrix_logical <- matrix(c(TRUE, FALSE, TRUE, FALSE), nrow = 2, ncol = 2)  # Logical matrix
matrix_character <- matrix(c("apple", "banana", "cherry", "date"), nrow = 2, ncol = 2) # Character matrix

# Display matrices directly (R will display them automatically when called)
matrix_numeric
matrix_logical
matrix_character

# 2. Matrix Creation Techniques

# 2.1 Using `matrix()` function
# The `matrix()` function is used to create matrices by specifying data, number of rows (nrow), and number of columns (ncol).

# Example: Create a 3x3 matrix
matrix_example <- matrix(1:9, nrow = 3, ncol = 3)
matrix_example

# 2.2 Matrix from a Vector
# You can create a matrix from a vector by specifying the number of rows and columns.

# Example: Creating a matrix from a vector of numbers
vector_data <- 1:12
matrix_from_vector <- matrix(vector_data, nrow = 3, ncol = 4) # 3 rows and 4 columns
matrix_from_vector

# 2.3 Matrix with Specific Values (like 0, NA, or random values)
# You can create matrices filled with zeros, NAs, or random numbers.

# Example: Creating a 3x3 matrix of zeros
matrix_zeros <- matrix(0, nrow = 3, ncol = 3)
matrix_zeros

# Example: Creating a 3x3 matrix of random numbers
set.seed(123)  # Set seed for reproducibility
matrix_random <- matrix(runif(9), nrow = 3, ncol = 3) # 9 random numbers between 0 and 1
matrix_random

# 3. Indexing and Subsetting Matrices

# You can access elements of a matrix by specifying the row and column indices.

# Example: Access the element in the 2nd row and 3rd column
element_2_3 <- matrix_example[2, 3]
element_2_3

# Access entire row or column
second_row <- matrix_example[2, ]
second_row

third_column <- matrix_example[, 3]
third_column

# Use logical indexing to subset a matrix
logical_subset <- matrix_example[matrix_example > 5]
logical_subset

# 4. Matrix Operations

# 4.1 Arithmetic Operations
# You can perform arithmetic operations on matrices element-wise.

# Example: Add two matrices of the same size
matrix_a <- matrix(1:9, nrow = 3, ncol = 3)
matrix_b <- matrix(9:1, nrow = 3, ncol = 3)
matrix_sum <- matrix_a + matrix_b
matrix_sum

# Example: Multiply two matrices element-wise
matrix_product <- matrix_a * matrix_b
matrix_product

# 4.2 Matrix Transposition
# The transpose of a matrix swaps its rows and columns.

# Example: Transpose a matrix
matrix_transposed <- t(matrix_a)
matrix_transposed

# 4.3 Matrix Multiplication
# Matrix multiplication is different from element-wise multiplication. It follows the rule of linear algebra.

# Example: Matrix multiplication (dot product)
matrix_multiplication <- matrix_a %*% matrix_b
matrix_multiplication

# 4.4 Determinant and Inverse of a Matrix
# You can calculate the determinant and inverse of square matrices using `det()` and `solve()` functions.

# Example: Calculate determinant and inverse
matrix_square <- matrix(c(4, 7, 2, 6), nrow = 2, ncol = 2)
determinant <- det(matrix_square)
inverse_matrix <- solve(matrix_square)



determinant
inverse_matrix

# 5. Combining Matrices

# You can combine matrices by rows or columns.

# Example: Combining matrices by rows
matrix_combined_rows <- rbind(matrix_a, matrix_b)
matrix_combined_rows

# Example: Combining matrices by columns
matrix_combined_columns <- cbind(matrix_a, matrix_b)
matrix_combined_columns

# 6. Applying Functions to Matrices

# You can apply functions such as `sum()`, `mean()`, `min()`, `max()`, etc., to matrices.

# Example: Apply sum function to a matrix
matrix_sum_all <- sum(matrix_a)
matrix_sum_all

# Example: Find the mean of each column
column_means <- apply(matrix_a, 2, mean)
column_means

# Example: Find the maximum element in each row
row_max <- apply(matrix_a, 1, max)
row_max

# 7. Handling Missing Values (NA) in Matrices

# If a matrix contains NA values, you can handle them using the `is.na()` function.

# Example: Create a matrix with NA values
matrix_with_na <- matrix(c(1, NA, 3, 4, 5, NA), nrow = 2, ncol = 3)
matrix_with_na

# Check for missing values (NA)
na_check_matrix <- is.na(matrix_with_na)
na_check_matrix

# Remove rows or columns with NA values
matrix_no_na_rows <- na.omit(matrix_with_na)
matrix_no_na_rows

# Replace NA with a specific value
matrix_with_na[is.na(matrix_with_na)] <- 0
matrix_with_na

# 8. Matrix Statistics and Linear Algebra

# Find the eigenvalues and eigenvectors of a matrix
eigen_values <- eigen(matrix_square)$values
eigen_vectors <- eigen(matrix_square)$vectors

eigen_values
eigen_vectors

# 9. Advanced Matrix Operations

# 9.1 Eigen Decomposition
eigen_decomposition <- eigen(matrix_random)
eigen_decomposition$values  # Eigenvalues
eigen_decomposition$vectors # Eigenvectors

# 9.2 Singular Value Decomposition (SVD)
svd_decomposition <- svd(matrix_random)
svd_decomposition

# 10. Practice Exercise

# The exercises below will be displayed when executed as R evaluates the variable at the end
exercise_instruction <- "
1. Create a 4x4 matrix filled with numbers from 1 to 16.
2. Find the sum of all elements in the matrix.
3. Calculate the row-wise and column-wise means of the matrix.
4. Transpose the matrix and calculate its inverse.
5. Create two matrices of different dimensions and try combining them by rows and columns.
"
exercise_instruction
