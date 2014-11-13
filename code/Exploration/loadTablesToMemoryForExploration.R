## the repository folder has to be set as a working directory
## data directory
d_d <- "data/Leagues 2013"
## list of league directories
leagueNames <- list.files(d_d)
dirs <-sapply(leagueNames,function(x) paste0(d_d,"/",x))


# THIS PART CREATES A JOINED TABLE OF ALL PLAYERS OF THE LEAGUE
# SHOULD ADD THIS CODE TO THE loadSquadInfos.R 
createJoinedTable <- function(dir,bind=T){
  ## list of file names in the league directory
  clubs <- list.files(dir)
  ## list of file URLs
  files <- sapply(clubs,function (x) paste0(dir,"/",x),
                  USE.NAMES = F)
  ##remove "txt"s at the end
  clubs <- gsub(".[A-Za-z]+$","",clubs)
  ## table of all premier league players
  table <-lapply(files,read.csv)

  
  if(bind){
      ## add a club collumn
      table <-mapply(function(x,y){
          cbind(Club = y,x)
      },
      table,
      clubs,
      SIMPLIFY = F
      )
      table <- data.table::rbindlist(table)
      ## return only the rows with complete information
      table <- table[complete.cases(table)]       
  }
  else{
      names(table) <- clubs
  }
  
  table
 }

tables <- lapply(dirs, function(x) createJoinedTable(x))
## delete " 2013" note at the end of league names
names(tables) <- gsub(" 2013$","",names(tables))

