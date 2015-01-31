rankall <- function(outcome, num = "best") {
	# Read outcome data
	outcomes <- read.csv("outcome-of-care-measures.csv")
	states <- as.vector(sort(unique(outcomes$State)))
	
	# Check that outcome is valid
	if(outcome == "heart attack") {
		outcome = 11
	} else if(outcome == "heart failure") {
		outcome = 17
	} else if(outcome == "pneumonia") {
		outcome = 23
	} else {
		stop("invalid outcome")
	}
	
	
	n <- length(states)
	hospital <- character(n)
	state <- character(n)
	
	# For each state, find the hospital of the given rank
	for(i in 1:n) {
		out <- outcomes[outcomes$State == states[i],]
		mortrate <- as.numeric(as.vector(out[, outcome]))
		if (num == "best") {
			reqrate <- min(mortrate, na.rm = TRUE)
		} else if (num == "worst") {
			reqrate <- max(mortrate, na.rm = TRUE)
		} else {
			reqrate <- sort(mortrate[!is.na(mortrate)])[num]
		}
		minhosp <- as.vector(out[mortrate == reqrate, 2])
		hospital[i] <- sort(minhosp, decreasing = TRUE)[1]
		state[i] <- states[i]
	}
	data.frame(hospital, state)
}