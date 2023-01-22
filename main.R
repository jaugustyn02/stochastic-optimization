# install.packages("smoof")
library(smoof)
source("functions.R")


num_dims_ls <- c(2, 10, 20)
num_runs <- 50
num_points <- 100
cat("runs:", num_runs, "\npoints:", num_points, "\n\n")

# Rastrigin function
cat("Rastringin funtion:\n\n")
for (num_dims in num_dims_ls){
  rastrigin_fn <- makeRastriginFunction(num_dims)
  result <- get_means(num_runs, num_points, num_dims, rastrigin_fn)
  cat("dimensions:", num_dims, "\n")
  cat("ms_mean:", result$ms_mean, "\n")
  cat("prs_mean:", result$prs_mean, "\n")
  cat("difference:", abs(result$ms_mean - result$prs_mean), "\n\n")
}


# Schwefel function
cat("Schwefel funtion:\n\n")
for (num_dims in num_dims_ls){
  schwefel_fn <- makeSchwefelFunction(num_dims)
  result <- get_means(num_runs, num_points, num_dims, schwefel_fn)
  cat("dimensions:", num_dims, "\n")
  cat("ms_mean:", result$ms_mean, "\n")
  cat("prs_mean:", result$prs_mean, "\n")
  cat("difference:", abs(result$ms_mean - result$prs_mean), "\n\n")
}
