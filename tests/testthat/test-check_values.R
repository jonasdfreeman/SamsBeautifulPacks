library(testthat)

# Sample data frames for testing
df_valid <- data.frame(gender = c("M", "F", "M", "F", "M"))
df_invalid <- data.frame(gender = c("M", "X", "M", "F", "M"))

# Test that check_values correctly identifies valid inputs
test_that("check_values identifies valid inputs", {
  result <- check_values(df_valid, "gender", "M", "F")
  expect_equal(result, "All values in the column gender are either M or F")
})

# Test that check_values correctly identifies invalid inputs and returns row numbers
test_that("check_values identifies invalid values and returns row indices", {
  result <- check_values(df_invalid, "gender", "M", "F")
  expect_equal(result, "Invalid values found in the following rows: 2")
})

# Test that check_values returns correct result when column name does not exist
test_that("check_values throws an error when column name is not found", {
  expect_error(check_values(df_valid, "age", "M", "F"), "Column not found in the data frame.")
})
