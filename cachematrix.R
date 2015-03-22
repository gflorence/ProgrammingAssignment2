## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is a function that converts a matrix in an object that can cache its inverse if it exists
## we first create a space for the inverse and set in to NULL; then we store the matrix and its inverse in the parent environment of the function
## we return a list of all the values created.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve 
    getinv <- function() i
    
    list(get = get, set = set, setinv = setinv, getinv = getinv)
}


## cacheSolve first retrieve the inverse of x from the cache; if x is not NULL, it raeturns it; if NULL, calculate it

cacheSolve <- function(x, ...) {
    i <- x$getinv()
    
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    
    i <- solve(x)
    i
}
