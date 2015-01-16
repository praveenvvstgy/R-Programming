complete <- function(directory, id = 1:322) {
	files <- list.files(directory, full.names = TRUE)
	n <-  length(id)
	readings = data.frame(id = numeric(n), nobs = numeric(n))
	for(i in seq_along(id)) {
		reading <- read.csv(files[id[i]])
		readings$id[i] <- id[i]
		readings$nobs[i] <- sum(complete.cases(reading$sulfate, reading$nitrate))
	}
	readings
}