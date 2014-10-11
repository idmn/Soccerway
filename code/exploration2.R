## the repository folder has to be set as a working directory



## data directory
d_d <- "data/Leagues 2013"
## list of league directories
leagueNames <- list.files(d_d)
dirs <-sapply(leagueNames,function(x) paste0(d_d,"/",x))

# THIS PART CREATES A JOINED TABLE OF ALL PLAYERS OF THE LEAGUE
# SHOULD ADD THIS CODE TO THE loadSquadInfos.R 
createJoinedTable <- function(dir){
    ## list of file names in the league directory
    clubs <- list.files(dir)
    ## list of file URLs
    files <- sapply(clubs,function (x) paste0(dir,"/",x),
                            USE.NAMES = F)
    ##remove "txt"s at the end
    clubs <- gsub(".[A-Za-z]+$","",clubs)
    ## table of all premier league players
    table <-lapply(files,read.table)
    ## add a club collumn
    table <-mapply(function(x,y){
        cbind(Club = y,x)
    },
    table,
    clubs,
    SIMPLIFY = F
    )
    table <- data.table::rbindlist(table)
    table
}
 
tables <- lapply(dirs, function(x) createJoinedTable(x))
## delete " 2013" note at the end of league names
names(tables) <- gsub(" 2013$","",names(tables))
## obtain some info about league
explr_Pos.Age <- function(x){
    meanAge <- mean(x$Age,na.rm = T)
    split_Pos <- split(x,x$Pos)
    split_Pos.Age <- sapply(split_Pos, function(x) x$Age)
    mean_Pos.Age <- sapply(split_Pos.Age,function (x) mean(x,na.rm = T))
    c(mean_Pos.Age,all = meanAge)
    ## have to add sd and n values to perform t.tests    
}

smth <- sapply(tables, explr_Pos.Age)

