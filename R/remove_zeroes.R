#' Remove Rows with Zero, Empty, or NA Values from a Specified Column
#'
#' This function identifies rows in the specified column of a data frame where the values are either
#' zero (`0`), `NA` (missing values), or empty strings (`""`). It automatically removes these rows from
#' the data frame and returns the cleaned version. This is useful for data cleaning when you want to
#' eliminate invalid or missing entries in a specific column.
#'
#' @param data A data frame containing the column to check and clean.
#' @param column_name A character string specifying the name of the column to check for zero, empty, or `NA` values.
#'
#' @return A data frame with rows removed where the specified column contains zero, empty, or `NA` values.
#'         If no such rows are found, the original data frame is returned.
#'
#' @examples
#' remove_zeroes(ourdata, "age")
#'
#' @export


remove_zeroes <- function(data, column_name) {
  # Check if the column exists in the data frame
  if (!(column_name %in% names(data))) {
    stop("Column not found in the data frame.")
  }

  # Extract the specified column
  column_data <- data[[column_name]]

  # Identify rows with zero, empty, or NA values
  rows_with_issues <- which(column_data == 0 | column_data == "" | is.na(column_data))

  # If there are rows with issues, remove them
  if (length(rows_with_issues) > 0) {
    # Remove the problematic rows
    data <- data[-rows_with_issues, ]
    message(paste(length(rows_with_issues), "rows with zero, empty, or NA values were removed."))
  } else {
    # No rows to remove
    message("No rows with zero, empty, or NA values found.")
  }

  # Return the cleaned data
  return(data)
}


