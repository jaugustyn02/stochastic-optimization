# Pure Random Search 
PRS <- function(dims, num_points, fn) {
  num_dims = nrow(dims)
  min_point <- rep(0, num_dims)   # init minimum point
  min_val <- Inf                  # init minimum value as infinity
  point <- rep(0, num_dims)       # init random point
  
  for(i in 1:num_points){
    for(row in 1:num_dims){
      point[row] <- runif(1, dims[row,1], dims[row,2])
    }
    val <- fn(point)
    if (val < min_val){
      min_point <- point
      min_val <- val
    }
  }
  # cat("min_point: ", min_point, "\n")
  return(min_val)
}


# multi-start
MS <- function(dims, num_points, fn){
  num_dims = nrow(dims)
  min_point <- rep(0, num_dims)   # init minimum point
  min_val <- Inf                  # init minimum value as infinity
  point <- rep(0, num_dims)       # init random point
  
  for(i in 1:num_points){
    for(row in 1:num_dims){
      point[row] <- runif(1, dims[row,1], dims[row,2])
    }
    # point <- runif(num_dims, dims[1,1], dims[1,2])
    point <- optim(par = point, fn = fn, method = "L-BFGS-B", lower = dims[,1], upper = dims[,2])$par
    val <- fn(point)
    if (val < min_val){
      min_point <- point
      min_val <- val
    }
  }
  # cat("min_point: ", min_point, "\n")
  return(min_val)
}


# Algorithms tests
# U1 <- c(0, 1)
# U2 <- c(-2, 2)
# U3 <- c(100, 1000)
# dimensions1 = rbind(U1, U2, U3)
# 
# U4 <- c(30.000005, 100)
# U5 <- c(5, 30)
# U6 <- c(-50, 50)
# dimensions2 = rbind(U4, U5, U6)
# 
# val1 <- PRS(dimensions1, 1000, f)
# cat("min_val1: ", val1, "\n")
# 
# fn_calls_count <- 0
# trace(g, tracer = function() fn_calls_count <<- fn_calls_count + 1, print=FALSE)
# val2 <- MS(dimensions2, 10, g)
# cat("min_val2: ", val2, "\n")
# print(fn_calls_count)
