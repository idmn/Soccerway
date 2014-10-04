## will make a lalge list, containing squad infos for all
## teams participated in Premier league 2013-2014

TID <- teamIDs()
seasId <- "8318"

## create a vector of URLs corresponding to a team squad pages

URLs <- sapply(TID$id, function(x){
        paste0("http://int.soccerway.com/a/block_team_squad?block_id=page_team_1_block_team_squad_3&callback_params=%7B%22team_id%22%3A%22",
               x,
               "%22%7D&action=changeSquadSeason&params=%7B%22season_id%22%3A%22",
               seasId,
               "%22%7D")   
    }
)

names(URLs) <- TID$title

data <- lapply(URLs, function(x) soccerwayTeam(x))



