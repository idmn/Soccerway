## exploration2.R and loadTables....R are required.
## Don't forget to set the project directory as the working
## directory.

## Is to be applied to the non-binded list of squad info.
## The result is the table of average lineups for teams in 
## the selected league.
explr_LUps <- function(x){
    n <- length(x)
    smth <- sapply(x, function(x) explr_Pos.Plrs(x,n))
    t(smth)
}

## not binded tables
tables2 <- lapply(dirs, function(x) createJoinedTable(x,F))

## get average team lineups
team_LUps <- lapply(tables2,explr_LUp)
## write tables

mapply(
    function(x,y) 
        write.csv(x,paste0("findings/Average Lineups","/",y,".csv")),
        team_LUps,names(team_LUps)
) 

