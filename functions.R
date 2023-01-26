source("algorithms.R")

get_means <- function(num_runs, num_points, num_dims, obj_fn, name_fn){
  assign("fn_with_counter",
    function(x){
      fn_calls_count <<- fn_calls_count + 1
      obj_fn(x)
    },
  envir = globalenv())
  
  ms_num_runs = num_runs
  dimensions = get_dimensions(obj_fn, num_dims)
  
  fn_calls_count <- 0
  ms <- replicate(ms_num_runs, MS(dimensions, num_points, fn_with_counter))
    # rysowanie histogramu i boxplota
  # png(file = paste("histograms/", name_fn, "_", num_dims, "_ms", ".png", sep = ""))
  # hist(ms, main=paste(name_fn, "_", num_dims, "_ms", sep = ""), xlab = "Values", col = "yellow",border = "blue")
  # dev.off()
  # png(file = paste("boxplot/", name_fn, "_", num_dims, "_ms", ".png", sep = ""))
  # boxplot(ms, main=paste(name_fn, "_", num_dims, "_ms", sep = ""), col = "yellow",border = "blue")
  # dev.off()
  budget <- fn_calls_count %/% ms_num_runs - num_points

  prs_num_runs = (ms_num_runs * budget) %/% num_points
  
  prs <- replicate(prs_num_runs, PRS(dimensions, num_points, obj_fn))
  # rysowanie histogramu i boxplota
  # png(file = paste("histograms/", name_fn, "_", num_dims, "_prs", ".png", sep = ""))
  # hist(prs, main=paste(name_fn, "_", num_dims, "_prs", sep = ""), plot=TRUE, xlab = "Values", col = "yellow",border = "blue")
  # dev.off()
  # png(file = paste("boxplot/", name_fn, "_", num_dims, "_prs", ".png", sep = ""))
  # boxplot(prs, main=paste(name_fn, "_", num_dims, "_prs", sep = ""), col = "yellow",border = "blue")
  # dev.off()
  student <- t.test(prs, ms)
  return(list(ms_mean = student$estimate[[2]], prs_mean = student$estimate[[1]], confidence = student$conf.int[c(1,2)]))
}

get_dimensions <- function(f, num_dims){
  lower_bounds = attr(f,"par.set")$pars$x$lower
  upper_bounds = attr(f,"par.set")$pars$x$upper
  array(c(lower_bounds, upper_bounds), c(num_dims,2))
}