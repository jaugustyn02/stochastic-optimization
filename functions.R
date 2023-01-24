source("algorithms.R")

get_means <- function(num_runs, num_points, num_dims, obj_fn){
  assign("fn_with_counter",
    function(x){
      fn_calls_count <<- fn_calls_count + 1
      obj_fn(x)
    },
  envir = globalenv())
  
  ms_num_runs = num_runs
  dimensions = get_dimensions(obj_fn, num_dims)
  
  fn_calls_count <- 0
  ms_mean <- mean(replicate(ms_num_runs, MS(dimensions, num_points, fn_with_counter)))
  budget <- fn_calls_count %/% ms_num_runs - num_points
  # print(budget)

  prs_num_runs = (ms_num_runs * budget) %/% num_points
  # print(prs_num_runs)
  
  prs_mean <- mean(replicate(prs_num_runs, PRS(dimensions, num_points, obj_fn)))
  return(list(ms_mean = ms_mean, prs_mean = prs_mean))
}

get_dimensions <- function(f, num_dims){
  lower_bounds = attr(f,"par.set")$pars$x$lower
  upper_bounds = attr(f,"par.set")$pars$x$upper
  array(c(lower_bounds, upper_bounds), c(num_dims,2))
}