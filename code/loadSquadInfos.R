## load all the squad infos for the clubs of the specified league
## to the choosen folder

## for me: SEE exploration2.R

loadSquadInfos <- function(
    url = "http://int.soccerway.com/national/england/premier-league/20132014/regular-season/r21322/tables/",                               
    seasID = 8318, folder = NULL,createJoinedTable = F)
{
    TID <- teamIDs(url)
    URLs <- sapply(TID$id,
    function (x)
        paste0("http://int.soccerway.com/a/block_team_squad?block_id=page_team_1_block_team_squad_3&callback_params=%7B%22team_id%22%3A%22",
               x,
               "%22%7D&action=changeSquadSeason&params=%7B%22season_id%22%3A%22",
               seasID,
               "%22%7D"
               )
    
    )
    
    names(URLs) <- TID$title
    data <- lapply(URLs, function(x) soccerwayTeam(x))
    
    ## write data in the files
    if(!is.null(folder)){
        mapply(
            function(x,y) write.table(x,paste0(folder,"//",y,".txt")),
            data,names(data)
        )  
    }
    data
}

