## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly.
 
## These pair of functions caches the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL

  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  
  setInv <- function(solve) { inv <<- solve }
  
  getInv <- function() { inv }
  
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)

  }


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then this function should retrieve the inverse from 
## the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
          inv <- x$getInv()
          if(!is.null(inv)) {
              message("getting cached inv")
          return(m)
          }
          m <- x$get()
          inv <- solve(m, ...)
          x$setInv(inv)
          inv
}
