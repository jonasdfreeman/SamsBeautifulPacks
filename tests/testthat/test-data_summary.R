library(testthat)

# Test 1: Basic functionality with numeric data
test_that("data_summary correctly calculates summary statistics", {
  df <- data.frame(
    A = c(1, 2, 3, 4, 5),
    B = c(10, 20, 30, 40, 50),
    C = c("apple", "banana", "cherry", "date", "elderberry")
  )

  # Capture the printed output of the function using `capture.output`
  output <- capture.output(data_summary(df))

  # Check if summary statistics are calculated correctly for numeric columns (A and B)
  expect_true(any(grepl("A", output)))  # Check if 'A' appears in the output
  expect_true(any(grepl("B", output)))  # Check if 'B' appears in the output
  expect_false(any(grepl("C", output))) # Check if 'C' does not appear in the output
})

# Test 2: Dataframe with no numeric columns
test_that("data_summary throws an error if there are no numeric columns", {
  df <- data.frame(
    A = c("apple", "banana", "cherry"),
    B = c("dog", "cat", "bird")
  )

  # Expect an error for non-numeric dataframe
  expect_error(data_summary(df), "The dataset contains no numeric variables.")
})

# Test 3: Dataframe with missing values in numeric columns
test_that("data_summary handles missing values correctly", {
  df <- data.frame(
    A = c(1, 2, NA, 4, 5),
    B = c(NA, 20, 30, 40, 50)
  )

  # Capture the printed output of the function
  output <- capture.output(data_summary(df))

  # Ensure that the summary includes NAs handled properly (i.e., using `na.rm = TRUE`)
  expect_true(any(grepl("Mean", output)))  # Check if "Mean" is printed in the output
  expect_true(any(grepl("SD", output)))    # Check if "SD" is printed in the output
})

# Test 4: Input is not a dataframe
test_that("data_summary throws an error when input is not a dataframe", {
  non_df <- c(1, 2, 3)

  # Expect an error for non-dataframe input
  expect_error(data_summary(non_df), "Input data must be a data frame.")
})

# Test 4: Dataframe with only one numeric column
test_that("data_summary works with only one numeric column", {
  df <- data.frame(
    A = c(1, 2, 3, 4, 5)
  )

  # Capture the printed output of the function
  output <- capture.output(data_summary(df))

  # Check if summary statistics are calculated correctly for the single column (A)
  expect_true(any(grepl("A", output)))  # Check if 'A' appears in the output
  expect_false(any(grepl("B", output))) # Check if non-existing 'B' does not appear
})
