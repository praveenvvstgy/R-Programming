pollutantmean <- function(directory, pollutant, id = 1:332) {
	files <- list.files(directory, full.names = TRUE)
	readings = data.frame()
	for(i in seq_along(id)) {
		readings <- rbind(readings, read.csv(files[id[i]]))
	}
	mean(readings[[pollutant]], na.rm = TRUE)
}