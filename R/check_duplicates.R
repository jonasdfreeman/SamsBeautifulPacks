#' Check for Duplicate Rows in a Data Frame
#'
#' This function checks for duplicate rows in the provided data frame. It identifies and prints all rows that are exact duplicates of others.
#' If no duplicates are found, it returns a message indicating that there are no duplicates. The comparison is performed across all columns of the data frame.
#'
#' @param df A data frame to check for duplicate rows. The function assumes that `df` is a valid data frame with at least one row and one column.
#'
#' @return If duplicate rows are found, the function prints a data frame containing all the duplicated rows, including the first occurrence of each duplicate.
#'         If no duplicates are found, the function prints the message `"No duplicates found."`.
#'
#' @details The function identifies duplicate rows using the `duplicated()` function, which checks for rows identical to previous rows (from top to bottom).
#'          It also checks for duplicates in reverse order using `duplicated(df, fromLast = TRUE)`. Both sets of duplicates are combined to ensure that all duplicates are returned.
#'          The function does not modify the input data frame in any way, and simply prints out the duplicates or a message indicating the absence of duplicates.
#'
#' @examples
#' check_duplicates(ourdata)
#'
#' @export



check_duplicates <- function(df) {
  # Check for duplicate rows
  duplicates <- df[duplicated(df) | duplicated(df, fromLast = TRUE), ]

  if (nrow(duplicates) > 0) {
    cat("Duplicate rows found:\n")
    print(duplicates)
  } else {
    cat("No duplicate rows found.\n")
  }
}

