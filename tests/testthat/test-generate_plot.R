library(testthat)

# Test generate_plot function
test_that("generate_plot handles valid and invalid inputs correctly", {

  # Create a simple data frame for testing
  df <- data.frame(
    age = c(21, 22, 23, 24, 25),
    salary = c(30000, 35000, 40000, 45000, 50000)
  )

  # Test case 1: Valid input - x_var and y_var both exist in the data
  expect_silent(generate_plot(df, "age", "salary"))  # Should not produce an error

  # Test case 2: Invalid input - x_var does not exist in the data
  expect_error(generate_plot(df, "age", "income"), "One or both of the specified variables are not found in the data.")

  # Test case 3: Invalid input - y_var does not exist in the data
  expect_error(generate_plot(df, "height", "salary"), "One or both of the specified variables are not found in the data.")

  # Test case 4: Invalid input - neither variable exists in the data
  expect_error(generate_plot(df, "weight", "income"), "One or both of the specified variables are not found in the data.")

  # Test case 5: Empty data frame - should throw an error with the message "The data frame is empty."
  df_empty <- data.frame(age = numeric(0), salary = numeric(0))
  expect_error(generate_plot(df_empty, "age", "salary"), "The data frame is empty.")
})
