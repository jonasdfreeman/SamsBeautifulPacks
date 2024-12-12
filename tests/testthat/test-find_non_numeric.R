# Test 1: Valid column with mixed numeric and non-numeric values, drop rows
test_that("find_non_numeric removes rows with non-numeric values when drop_rows = TRUE", {
  df <- data.frame(
    A = c("1", "2", "apple", "4", "banana"),
    B = c(10, 20, 30, 40, 50)
  )

  # Suppress warnings for coercion to numeric
  cleaned_df <- suppressWarnings(find_non_numeric(df, "A"))

  # Check that rows with non-numeric values are removed
  expect_equal(nrow(cleaned_df), 3)
})

test_that("find_non_numeric returns the same dataframe when all values are numeric", {
  df <- data.frame(
    A = c(1, 2, 3, 4, 5),
    B = c(10, 20, 30, 40, 50)
  )

  cleaned_df <- find_non_numeric(df, "A")

  expect_equal(cleaned_df, df)
})

test_that("find_non_numeric throws an error for invalid column name", {
  df <- data.frame(
    A = c("1", "2", "apple", "4", "banana"),
    B = c(10, 20, 30, 40, 50)
  )

  expect_error(find_non_numeric(df, "C"))
})
