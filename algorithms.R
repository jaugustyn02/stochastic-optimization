# Pure Random Search 
PRS <- function(dims, num_points, fn) {
  num_dims = nrow(dims)
  min_val <- Inf
  
  for(i in 1:num_points){
    point <- runif(num_dims, dims[1,1], dims[1,2])
    val <- fn(point)
    min_val <- min(min_val, val)
  }
  return(min_val)
}


# Multi-Start
MS <- function(dims, num_points, fn){
  num_dims = nrow(dims)
  min_val <- Inf 
  for(i in 1:num_points){
    point <- runif(num_dims, dims[1,1], dims[1,2])
    point <- optim(par = point, fn = fn, method = "L-BFGS-B", lower = dims[,1], upper = dims[,2])$par
    val <- fn(point)
    min_val <- min(min_val, val)
  }
  return(min_val)
}
