best <- function(outcome){
        ## Valid states
        states <- c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")
        ## Check that outcome is valid
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
        outdata <- data[, col]
        clean <- outdata[complete.cases(as.numeric(outdata))]
        ## Check that state is valid
        ## is there a better way than a giant if statement with all 50 states?
        ## are all 50 states even in the csv file?
        ## Return hospital name in that state with lowest 30-day death rate
        ## try using min function over
}
