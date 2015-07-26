## Create a "special" matrix object to create a matrix that can compute or cache its inverse.
#
# Joe Nguyen | 26 Jul, 2015

## Create a "special" matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    m <<- NULL
    set <- function(mat2) {
        x <<- mat2
        m <<- NULL
    }
    get <- function() x
    setInv <- function(inv) m <<- inv 
    getInv <- function() m
    list(set = set, get = get, setInv = setInv, getInv = getInv) 
}


## Compute or retrieve (cached) inverse of "special" matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInv()
    if(!is.null(m)) {
        print("getting cached data")
        return(m)
    }
    m <- solve(x$get(), ...)
    mat$setInv(m)
    m
}
