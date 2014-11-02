## directory to which all the squad info will be downloaded
dir <- "data/Leagues 2013"

## this file contains all needed information for downloading
## squad info for some certain leagues 
LURLs <- read.csv("data/League URLs.csv")

for(i in 1:nrow(LURLs)){
    ## create a subdirectory for the current league
    leagueDir <- file.path(dir,LURLs$title[[i]])
    if(!file.exists(leagueDir)) dir.create(leagueDir)
    loadSquadInfos(url = LURLs$url[[i]],seasID = LURLs$seasID[[i]],
                   folder = leagueDir, returnData = F
                    )
}
