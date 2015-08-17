best <- function(state,outcome){
        ## Valid states
        states <- c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID",
                    "IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS",
                    "MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK",
                    "OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV",
                    "WI","WY")
        ## Check that state and outcome are valid
        if (state %in% states){
                
        }else {
                stop("invalid state")
        }
        if (outcome == "heart attack"){
                col <- 11
        }else if (outcome == "heart failure"){
                col <- 17
        }else if (outcome == "pneumonia"){
                col <- 23
        }else {
                stop("invalid outcome")
        }
        ## Read data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Bind together columns for State, Hospital, and Outcome
        sort <- cbind(data[,2],data[,7],data[,col])
        ## Find the minimum and any repeats
        mins <- match(min(sort[,3]),sort[,3])
        sort[mins,1]
        
        ## Take in only complete cases
        ## clean <- sort[complete.cases(as.numeric(sort))]
}

