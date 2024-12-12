# Test check_duplicates function
test_that("check_duplicates correctly identifies and prints duplicates", {

  # Test case 1: Data frame with duplicate rows
  df_with_duplicates <- data.frame(
    A = c(1, 2, 2, 3, 3, 4),
    B = c("a", "b", "b", "c", "c", "d")
  )

  # Capture the output of check_duplicates
  captured_output <- capture.output(check_duplicates(df_with_duplicates))

  # Check that the printed output contains the duplicated rows
  expect_true(any(grepl("Duplicate rows found:", captured_output)))
  expect_true(any(grepl("2", captured_output)))  # Expect duplicate rows with value 2
  expect_true(any(grepl("3", captured_output)))  # Expect duplicate rows with value 3


  # Test case 2: Data frame with no duplicate rows
  df_no_duplicates <- data.frame(
    A = c(1, 2, 3, 4),
    B = c("a", "b", "c", "d")
  )

  # Capture the output of check_duplicates
  captured_output <- capture.output(check_duplicates(df_no_duplicates))

  # Check that the printed output contains the message for no duplicates
  expect_true(any(grepl("No duplicate rows found.", captured_output)))
})

