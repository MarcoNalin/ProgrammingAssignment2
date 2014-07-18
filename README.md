## Example of Usage of the functions created:

> rawData <- matrix(c(2,2,3,2), 2,2)
> rawData
     [,1] [,2]
[1,]    2    3
[2,]    2    2
> my_matrix <- makeCacheMatrix(rawData)
> my_inverse <- cacheSolve(my_matrix)
No values cached, calculating the inverse for the first time
> my_inverse
     [,1] [,2]
[1,]   -1  1.5
[2,]    1 -1.0
> my_inverse <- cacheSolve(my_matrix)
getting cached data
> rawData2 <- matrix(c(1,1,4,3), 2,2)
> my_matrix$set(rawData2)
> my_inverse <- cacheSolve(my_matrix)
No values cached, calculating the inverse for the first time
> my_inverse
     [,1] [,2]
[1,]   -3    4
[2,]    1   -1
> my_inverse <- cacheSolve(my_matrix)
getting cached data
> my_inverse
     [,1] [,2]
[1,]   -3    4
[2,]    1   -1