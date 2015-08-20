rankall <- function(outcome, num = "best"){
        ## Check if outcome is valid (done)
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
        ## States vector
        states <- c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID",
                    "IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS",
                    "MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK",
                    "OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV",
                    "WI","WY","VI","GU","PR","DC")
        state <- states[order(states)]
        ## Data frame with columns for Hospital, State, Outcome
        frame <- data.frame(data[,2],data[,7],as.numeric(data[,col]), stringsAsFactors = FALSE)
        ## Removes all NA values
        naframe <- data.frame(0,0,0)
        a <- 0
        for (i in 1:nrow(frame)){
                if (is.na(frame[i,3])){
                        a <- a+1
                        
                } else{
                        naframe[i-a,] <- lapply(frame[i,],rbind)
                }
        }
        ## Order the naframe by hospital name, then mortality rate (low to high)
        ordered <- naframe[order(naframe[,1]),]
        reorder <- ordered[order(ordered[,3]),]
        ## Split data frame into vector with mortality rates and hospital names
        splitval <- split(reorder$X0.2, reorder$X0.1)
        splitname <- split(reorder$X0, reorder$X0.1)
        ## Fill in rank with appropriate hospital names, MRs, and States
        rank <- data.frame(0,0,0)
        for (i in 1:length(state)){
                y <- splitname[[i]]
                x <- splitval[[i]]
                if(num == "best"){
                        num1 <- 1
                        rank[i,1] <- y[num1]
                        rank[i,2] <- state[i]
                        rank[i,3] <- x[num1]
                } else if (num == "worst"){
                        num1 <- length(x)
                        rank[i,1] <- y[num1]
                        rank[i,2] <- state[i]
                        rank[i,3] <- x[num1]
                } else if (num > length(x)) {
                        num1 <- num
                        rank[i,1] <- NA
                        rank[i,2] <- state[i]
                        rank[i,3] <- x[num1]
                } else {
                        num1 <- num
                        rank[i,1] <- y[num1]
                        rank[i,2] <- state[i]
                        rank[i,3] <- x[num1]
                }
                x <- 0
                y <- 0
        }
        rank_order <- rank[order(rank[,2]),]
        colnames(rank_order) <- c("hospital", "state")
        rank_order[,1:2]
}
