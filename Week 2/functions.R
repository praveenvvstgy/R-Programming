add2 <- function(x, y) {
	x + y
}
above10 <- function(x) {
	use <- x > 10
	x[use]
}
above <- function(x, n) {
	use <- x > n
	x[use]
}

colmean <- function(y) {
	nc <- ncol(y)
	means <- numeric(nc)
	for(i in 1:nc) {
		means[i] <- mean(y[,i])
	}
	means
}

# Argument Matching
sd(mydata, na.rm = TRUE)
# exact, partial, postiona matching
# Lazy Evaluation
# ... varialbe number of arguments(can be used when extending another functions and generic functions)
