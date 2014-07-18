## Example of Usage of the functions created:

### Create Raw data
rawData <- matrix(c(2,2,3,2), 2,2)
rawData

     [,1] [,2]
[1,]    2    3
[2,]    2    2

### Create my_matrix instance of makeCacheMatrix
my_matrix <- makeCacheMatrix(rawData)

### Calculate inverse
my_inverse <- cacheSolve(my_matrix)
No values cached, calculating the inverse for the first time
my_inverse
     [,1] [,2]
[1,]   -1  1.5
[2,]    1 -1.0

### Recalculate inverse
my_inverse <- cacheSolve(my_matrix)
getting cached data

### Change the raw data
rawData2 <- matrix(c(1,1,4,3), 2,2)
my_matrix$set(rawData2)

### It has to be recalculated and resaved
my_inverse <- cacheSolve(my_matrix)
No values cached, calculating the inverse for the first time
my_inverse
     [,1] [,2]
[1,]   -3    4
[2,]    1   -1

### If I ask it again, it is now cached
> my_inverse <- cacheSolve(my_matrix)
getting cached data
> my_inverse
     [,1] [,2]
[1,]   -3    4
[2,]    1   -1