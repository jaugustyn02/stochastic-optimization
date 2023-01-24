# Pure Random Search 
PRS <- function(dims, num_points, fn) {
  num_dims = nrow(dims)
  min_point <- rep(0, num_dims)
  min_val <- Inf
  # point <- rep(0, num_dims)
  
  for(i in 1:num_points){
    # for(row in 1:num_dims){
    #   point[row] <- runif(1, dims[row,1], dims[row,2])
    # }
    point <- runif(num_dims, dims[1,1], dims[1,2])
    val <- fn(point)
    if (val < min_val){
      min_point <- point
      min_val <- val
    }
  }
  return(min_val)
}


# multi-start
MS <- function(dims, num_points, fn){
  num_dims = nrow(dims)
  min_point <- rep(0, num_dims)
  min_val <- Inf
  # point <- rep(0, num_dims)
  
  for(i in 1:num_points){
    # for(row in 1:num_dims){
    #   point[row] <- runif(1, dims[row,1], dims[row,2])
    # }
    point <- runif(num_dims, dims[1,1], dims[1,2])
    point <- optim(par = point, fn = fn, method = "L-BFGS-B", lower = dims[,1], upper = dims[,2])$par
    val <- fn(point)
    if (val < min_val){
      min_point <- point
      min_val <- val
    }
  }
  return(min_val)
}
