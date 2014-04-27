# Example usage:
# Create a matrix m
# m <- matrix(rnorm(25), nrow = 5)
# Create our special matrix
# sm <- makeCacheMatrix(m) 
# Get the matrix
# sm$get() 
# Get the inverse
# cacheSolve(sm)

## makeCacheMatrix creates a special matrix
# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the value of the inverse
# 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    value <- NULL
    set <- function(y) {
        x <<- y
        value <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) value <<- inverse
    getinv <- function() value
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## cacheSolve returns a matrix that is the inverse of x

cacheSolve <- function(x, ...) {
    value <- x$getinv()
    if (!is.null(value)) {
        message("getting cached data")
        return(value)
    }
    data <- x$get()
    value <- solve(data, ...)
    x$setinv(value)
    value
}
