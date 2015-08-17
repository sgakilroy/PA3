rankhospital <- function(state, outcome, num = "best"){
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
        ## Data frame with columns for Hospital, State, Condition
        frame <- data.frame(data[,2],data[,7],as.numeric(data[,col]), stringsAsFactors = FALSE)
        stateframe <- frame[frame$data...7. == state,]
        naframe <- data.frame(0,0,0)
        a <- 0
        for (i in 1:nrow(stateframe)){
                if (is.na(stateframe[i,3])){
                        a <- a+1
                        
                } else{
                        naframe[i-a,] <- lapply(stateframe[i,],rbind)
                }
        }
        ## Find the minimum and any repeats
        ordered <- naframe[order(naframe[,1]),]
        reorder <- ordered[order(ordered[,3]),]
        ## Check if rank is valid
        if(num == "best"){
                num <- 1
        } else if (num == "worst"){
                num <- nrow(reorder)
        } else if (num > nrow(reorder)) {
                return(NA)
        }
        reorder[num,1]
}
