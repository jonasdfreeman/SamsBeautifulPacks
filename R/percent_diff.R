#' Find Rows with Large Percentage Difference Between Two Columns
#'
#' This function calculates the absolute percentage difference between two specified columns in a
#' data frame and identifies the rows where the difference exceeds 20%. If any rows have a large
#' difference, those rows are returned.
#'
#' @param df A data frame containing the columns to compare.
#' @param col1 A character string specifying the name of the first column.
#' @param col2 A character string specifying the name of the second column.
#'
#' @return A data frame containing the rows where the absolute percentage difference between the
#'         two specified columns exceeds 20%. If no such rows exist, the function returns `NULL`.
#'
#' @examples
#' percent_diff(ourdata, "systolic", "diastolic")
#'
#' @export


percent_diff <- function(df, col1, col2) {
  # Ensure that the columns exist in the data frame
  if (!col1 %in% colnames(df) | !col2 %in% colnames(df)) {
    stop("The specified columns are not in the data frame")
  }

  # Calculate the absolute percentage difference
  abs_diff <- abs(df[[col1]] - df[[col2]]) / ((df[[col1]] + df[[col2]]) / 2) * 100

  # Identify rows where the absolute percentage difference exceeds 20%
  large_diff_rows <- df[abs_diff > 20, ]

  return(large_diff_rows)
}



