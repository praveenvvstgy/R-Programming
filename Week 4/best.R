best <- function(state, outcome) {
	# Read Outcome Data
	outcomes <- read.csv("outcome-of-care-measures.csv")
	
	# Check the state and the outcome are valid
	if (!state %in% outcomes$State) {
		stop("invalid state")
	} else {
		state <- outcomes$State == state
	}

	if(outcome == "heart attack") {
		outcome = 11
	} else if(outcome == "heart failure") {
		outcome = 17
	} else if(outcome == "pneumonia") {
		outcome = 23
	} else {
		stop("invalid outcome")
	}
	
	# Return the hospital name in the state with lowest 30-day death rate
	statedata <- outcomes[state,]
	mortrate <- as.numeric(as.vector(statedata[, outcome]))
	minrate <- min(mortrate, na.rm = TRUE)
	minhosp <- as.vector(statedata[mortrate == minrate, 2])
	sort(minhosp)[1]
}