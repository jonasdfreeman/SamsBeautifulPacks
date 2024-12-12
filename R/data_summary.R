#' Generate Summary Statistics for Numeric Columns in a Data Frame
#'
#' This function calculates and returns summary statistics (mean, standard deviation,
#' minimum, maximum, median, and quartiles) for all numeric variables in the provided
#' data frame. The function handles missing values by ignoring them in the calculations.
#'
#' @param data A data frame containing the variables to summarize. Only numeric columns
#'             are considered for the summary statistics.
#'
#' @return A data frame with summary statistics for each numeric column. The returned
#'         data frame includes the following columns:
#'         - `Variable`: The name of the numeric variable.
#'         - `Mean`: The mean of the variable.
#'         - `SD`: The standard deviation of the variable.
#'         - `Min`: The minimum value of the variable.
#'         - `Max`: The maximum value of the variable.
#'         - `Median`: The median value of the variable.
#'         - `Q1`: The first quartile (25th percentile) of the variable.
#'         - `Q3`: The third quartile (75th percentile) of the variable.
#'
#' @examples
#' data_summary(ourdata)
#'
#' @export


data_summary <- function(data) {
  # Check if the data is a data frame
  if (!is.data.frame(data)) {
    stop("Input data must be a data frame.")
  }

  # Select only numeric columns for the summary statistics
  numeric_data <- data[sapply(data, is.numeric)]

  if (ncol(numeric_data) == 0) {
    stop("The dataset contains no numeric variables.")
  }

  # Initialize an empty list to store summary statistics
  summary_table <- data.frame(
    Variable = character(),
    Mean = numeric(),
    SD = numeric(),
    Min = numeric(),
    Max = numeric(),
    Median = numeric(),
    Q1 = numeric(),
    Q3 = numeric(),
    stringsAsFactors = FALSE
  )

  # Calculate summary statistics for each numeric variable
  for (var in names(numeric_data)) {
    summary_table <- rbind(summary_table, data.frame(
      Variable = var,
      Mean = round(mean(numeric_data[[var]], na.rm = TRUE), 2),
      SD = round(stats::sd(numeric_data[[var]], na.rm = TRUE), 2),
      Min = round(min(numeric_data[[var]], na.rm = TRUE), 2),
      Max = round(max(numeric_data[[var]], na.rm = TRUE), 2),
      Median = round(stats::median(numeric_data[[var]], na.rm = TRUE), 2),
      Q1 = round(stats::quantile(numeric_data[[var]], 0.25, na.rm = TRUE), 2),
      Q3 = round(stats::quantile(numeric_data[[var]], 0.75, na.rm = TRUE), 2)
    ))
  }

  # Print the summary table
  print(summary_table)
}
