## the repository folder has to be set as a working directory

# THIS PART CREATES A COMPILED TABLE OF ALL PLAYERS OF THE LEAGUE
# SHOULD ADD THIS CODE TO THE loadSquadInfos.R 

## data directory
d_d <- "data/Leagues 2013"

## premier only now
premier_dir <- paste0(d_d,"/Premier League 2013")
## list of file names in the league directory
premier_clubs <- list.files(premier_dir)
## list of file URLs
premier_files <- sapply(premier_clubs,function (x) paste0(premier_dir,"/",x),
                    USE.NAMES = F)
##remove "txt"s at the end
premier_clubs <- gsub(".[A-Za-z]+$","",premier_clubs)
## table of all premier league players
premier_t <-lapply(premier_files,read.table)
## add a club collumn
premier_t <-mapply(function(x,y){
        cbind(Club = y,x)
    },
    premier_t,
    premier_clubs,
    SIMPLIFY = F
)
premier_t <- data.table::rbindlist(premier_t)


premier_Pos <-split(premier_t,premier_t$Pos)
## to perform a t.tests
premier_Pos_Age <- sapply(premier_Pos, function (x) x$Age)