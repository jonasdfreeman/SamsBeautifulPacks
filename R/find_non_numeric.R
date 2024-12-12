#' Identify and Remove Rows with Non-Numeric Values in a Specified Column
#'
#' This function scans a given column in a data frame to identify and remove rows where
#' the values are non-numeric. It attempts to coerce the column values to numeric. If a
#' value cannot be coerced (resulting in `NA`), those rows are excluded from the output.
#'
#' @param df A data frame that contains the column to be checked.
#' @param col1 A character string specifying the name of the column to inspect.
#'
#' @return A data frame with rows containing non-numeric values removed. If all values
#'         in the specified column are numeric, the function returns the original data frame.
#'
#' @examples
#' find_non_numeric(ourdata, "age")
#'
#' @export
#'

find_non_numeric <- function(df, col1) {
  # Convert the column to numeric, handling non-numeric values as NA
  df[[col1]] <- suppressWarnings(as.numeric(df[[col1]]))

  # Remove rows with NA values in the specified column
  df <- df[stats::complete.cases(df[, col1]), ]

  # Ensure the output is a data frame
  return(df)
}

