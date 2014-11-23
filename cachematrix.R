## The following pair of functions cache the inverse of a matrix.


## Creates a "special" matrix object than cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        s<-NULL
        set<- function(y) {
                x<<- y
                m<<- NULL
        }
        get <- function() x
        setsolve<- function(solve) s<<- solve
        getsolve<- function() s
        lis(set = set,get=get,
            setsolve=setsolve,
            getsolve=getsolve)
}

## computes the inverse of the special "matrix" returned

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        matriz <- x$get()
        s <- solve(matriz, ...)
        x$setsolve(s)
        s
}