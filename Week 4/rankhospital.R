rankhospital <- function(state, outcome, num = "best") {
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
	
	# Return hospital name in that state with the given rank 30-day death rate
	statedata <- outcomes[state,]
	mortrate <- as.numeric(as.vector(statedata[, outcome]))
	if (num == "best") {
		reqrate <- min(mortrate, na.rm = TRUE)
	} else if (num == "worst") {
		reqrate <- max(mortrate, na.rm = TRUE)
	} else {
		reqrate <- sort(mortrate[!is.na(mortrate)])[num]
	}
	minhosp <- as.vector(statedata[mortrate == reqrate, 2])
	sort(minhosp, decreasing = TRUE)[1]
}