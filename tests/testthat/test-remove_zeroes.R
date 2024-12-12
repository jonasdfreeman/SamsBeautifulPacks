library(testthat)

# Create a sample data frame for testing
test_data <- data.frame(
  id = 1:5,
  age = c(25, 0, NA, 30, ""),
  salary = c(50000, 55000, 60000, 65000, 70000)
)

# Test for remove_zeroes function
test_that("remove_zeroes removes rows with zero, empty, or NA values", {
  # Run remove_zeroes function on the 'age' column
  cleaned_data <- remove_zeroes(test_data, "age")

  # Check that the remaining rows in 'age' column are non-zero, non-NA, and non-empty
  expect_false(any(cleaned_data$age == 0))
  expect_false(any(is.na(cleaned_data$age)))
  expect_false(any(cleaned_data$age == ""))

  # Check the ids of the rows that should remain (id 1, 4, and 5)
  expect_true(all(cleaned_data$id %in% c(1, 4, 5)))
})

test_that("remove_zeroes does nothing when no rows have zero, empty, or NA values", {
  # Run remove_zeroes function on the 'salary' column (which has no zero, NA, or empty values)
  cleaned_data <- remove_zeroes(test_data, "salary")

  # The number of rows should stay the same (5 rows)
  expect_equal(nrow(cleaned_data), 5)
})
