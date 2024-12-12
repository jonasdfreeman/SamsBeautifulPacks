# Test for percent_diff function
test_that("percent_diff works correctly", {

  # Test 2: Ensure no rows are returned when the percentage difference is <= 20%
  df2 <- data.frame(
    col1 = c(100, 150, 200),
    col2 = c(110, 140, 190)
  )
  result2 <- percent_diff(df2, "col1", "col2")

  expect_equal(nrow(result2), 0)  # No rows should be returned

  # Test 3: Test missing columns (should stop with an error)
  df3 <- data.frame(
    col1 = c(100, 150, 200)
  )

  expect_error(percent_diff(df3, "col1", "col2"), "The specified columns are not in the data frame")

  # Test 4: Test when the columns have exactly the same values (0% difference)
  df4 <- data.frame(
    col1 = c(100, 100, 100),
    col2 = c(100, 100, 100)
  )

  result4 <- percent_diff(df4, "col1", "col2")
  expect_equal(nrow(result4), 0)  # No rows should be returned, since the difference is 0%

  # Test 5: Test when the difference is exactly 20%
  df5 <- data.frame(
    col1 = c(100, 150),
    col2 = c(120, 180)
  )

  result5 <- percent_diff(df5, "col1", "col2")
  expect_equal(nrow(result5), 0)  # No rows should be returned, as the difference is exactly 20%

})

