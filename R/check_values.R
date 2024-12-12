#' Check if Column Values are Restricted to Two Specific Values
#'
#' This function checks whether all values in a specified column of a data frame are restricted to
#' two given values. If any values are not one of the allowed values, it returns the row indices where
#' the invalid values appear. Otherwise, it returns a message confirming that all values are valid.
#'
#' @param data A data frame containing the column to check.
#' @param column_name A character string specifying the name of the column to check.
#' @param value1 The first allowed value in the column.
#' @param value2 The second allowed value in the column.
#'
#' @return A character string. If all values in the column are either `value1` or `value2`, the function
#'         returns a message confirming this. If there are invalid values, it returns a message listing
#'         the row numbers where these values appear.
#'
#' @examples
#' check_values(ourdata, "gender", "M", "F")
#'
#' @export



check_values <- function(data, column_name, value1, value2) {
  # Check if the column exists in the data frame
  if (!(column_name %in% names(data))) {
    stop("Column not found in the data frame.")
  }

  # Extract the specified column
  column_data <- data[[column_name]]

  # Find rows with invalid values (those that are not value1 or value2)
  invalid_rows <- which(!(column_data %in% c(value1, value2)))

  # Return results
  if (length(invalid_rows) == 0) {
    return(paste("All values in the column", column_name, "are either", value1, "or", value2))
  } else {
    return(paste("Invalid values found in the following rows:", toString(invalid_rows)))
  }
}


