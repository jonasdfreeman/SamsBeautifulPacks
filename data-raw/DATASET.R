## code to prepare `DATASET` dataset goes here

file_path <- "/Users/jonas/Desktop/bodyperformance.csv"
body_performance <- read.csv(file_path)

# Remove duplicate rows
body_performance <- body_performance[!duplicated(body_performance), ]

# Check for rows where any value is 0, NA, or an empty string
ourdata <- body_performance[apply(body_performance, 1, function(x) all(x != 0 & x != "" & !is.na(x))), ]

usethis::use_data(ourdata, overwrite = TRUE)

