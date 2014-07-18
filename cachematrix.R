## Functions to cache the inverse of a matrix

## This function calculates and stores a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    # Create an internal representation of the inverse matrix
    inverse <- NULL
    
    # The set function initializes the matrix and resets the inverse
    # Note: the two variables x and inverse are stored as environmental
    # variables
    # Note2: every time we save a new matrix, its inverse should be automatically
    # null, as we haven't calculate it yet
    set <- function(y) {
      x <<- y
      inverse <<- NULL
    }
    
    # The get function, which returns the matrix stored
    get <- function() x
    
    # The setInverse function allows to set the inverse matrix
    setInverse <- function(inv) inverse <<- inv
    
    # The getInverse function returns the inverse matrix
    getInverse <- function() inverse
    
    # Return a list of the four function recently created
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function calculates the inverse of a matrix and caches the result
## The inverse is calculated with the solve() function only if the original
## matrix is changed.

## The cacheSolve function is designed to receive a makeCacheMatrix as input
## containing a matrix and its inverse (which can be also null)

cacheSolve <- function(x, ...) {
  ## Create the inverse matrix variable, and get it from the input
  ## object (which is expected to be of class makeCacheMatrix).
  inverse <- x$getInverse()
  
  ## If the matrix retrieved is not null, it means that we already calculated
  ## it before, and thus we don't need to calculate it again. We simply return
  ## the value we got from x$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  ## This code, even if it is not under an "else" statement, is executed only
  ## in case the inverse matrix is null (because of the return statement in
  ## the if), thus has never been calculated. The following code calculates it.
  data <- x$get()
  inverse <- solve(data, ...)
  message("No values cached, calculating the inverse for the first time")
  
  ## Now we save the inverse matrix in the makeCacheMatrix object, so that
  ## next time we are going to calculate the inverse the value won't be null
  x$setInverse(inverse)

  ## And we return the matrix that is the inverse of 'x'
  inverse
}
