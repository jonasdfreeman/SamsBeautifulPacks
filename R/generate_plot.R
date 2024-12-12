#' Generate a Scatter Plot for Two Variables
#'
#' This function creates a scatter plot to visualize the relationship between two specified variables
#' from a given data frame. The variables can be numeric and are plotted on the x-axis and y-axis.
#'
#' @param data A data frame containing the variables to plot.
#' @param x_var A character string specifying the name of the variable to be plotted on the x-axis.
#' @param y_var A character string specifying the name of the variable to be plotted on the y-axis.
#'
#' @return This function does not return a value. It creates and displays a scatter plot in the current plotting device.
#'         The plot includes the specified variables on the axes, with labeled axes and a title.
#'
#' @examples
#' generate_plot(ourdata, "age", "systolic")
#'
#' @export
#'
#'


generate_plot <- function(data, x_var, y_var) {
  # Ensure the variables exist in the data
  if (!(x_var %in% names(data)) | !(y_var %in% names(data))) {
    stop("One or both of the specified variables are not found in the data.")
  }

  if (nrow(data) == 0) {
    stop("The data frame is empty.")
  }

  # Extract the variables from the data frame
  x <- data[[x_var]]
  y <- data[[y_var]]

  # Create the scatter plot
  plot(x, y, pch = 16, col = "blue",
       xlab = x_var, ylab = y_var,
       main = paste("Scatter Plot of", x_var, "vs", y_var),
       cex = 1.5)
}
