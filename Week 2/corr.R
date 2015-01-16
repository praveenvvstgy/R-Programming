options(digits = 4)
corr <- function(directory, threshold = 0) {
	files <- list.files(directory, full.names = TRUE)
	readings <- vector(mode = "numeric")
	for(i in seq_along(files)) {
		reading <- read.csv(files[i])
		ok <- complete.cases(reading$sulfate, reading$nitrate)
		reading <- reading[ok,]
		if(sum(ok) > threshold) {
			readings <- append(readings, cor(reading$sulfate, reading$nitrate))
		}
	}
	as.vector(readings)
}