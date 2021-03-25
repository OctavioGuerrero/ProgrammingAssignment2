##Hello Classmates I will to try to explain each line of my code because once I understood how the example worked
##this activity became very simple. I hope this helps you to better understand the activity and the code. 

makeCacheMatrix <- function(x = matrix()) { #Here we define the two objects "x" and "inv".
      inv <- NULL
      set <- function(y) { #This is the first important part of the code because the
            x <<- y       #set() helps us to just introduce new data by OldMatrix$set("NewMatrix") without calling the whole function again.
            inv <<- NULL
      }
      get <- function() x #just gets the introduced matrix.
      setinverse <- function(inverse) inv <<- inverse #just assigns the "inverse" value to the "inv" variable at the beginning of the code.
      getinverse <- function() inv #just gets the "inv".
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse) #creates a list with all the elements defined above.
}

cacheSolve <- function(x, ...) {  #here you define x as the input of your function
      inv <- x$getinverse() #here the function tries to retrieve the info stored in the getinverse() element of the list above.
      #I think is important to notice that in case x is not an element like the one constructed by the makeCacheMatrix function this won't work.
      if(!is.null(inv)) { #just checks if there is any no-NULL data already stored in the list defined above.
            message("getting cached data")
            return(inv) #if the condition is TRUE, then it will give you the value stored in the list. 
      }
      data <- x$get()#if the condition above is FALSE, then it will calculate the inverse of the matrix, here it will retrieve the matrix input stored in the list above.
      inv <- solve(data, ...)#calculate the inverse.
      x$setinverse(inv)#store the inverse of the matrix in the list.
      inv #gives you the output.
}
