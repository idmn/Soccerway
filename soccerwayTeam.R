## this is the page containing the squad information
## for Liverpool in 2013/2014 season
defaultURL <- "http://int.soccerway.com/a/block_team_squad?block_id=page_team_1_block_team_squad_3&callback_params=%7B%22team_id%22%3A%22663%22%7D&action=changeSquadSeason&params=%7B%22season_id%22%3A%228318%22%7D"

soccerwayTeam <- function(url = defaultURL){
    data <- XML::readHTMLTable(url, stringsAsFactors = F)[[1]]
    nr <- nrow(data)
    ## number of collumns is always 17, i hope
    
    ## clear a garbage from data[nr,17]
    buf <- data[[nr,17]]
    buf <- substring(buf,1:2,1:2)
    buf <- buf[grep("[0-9]",buf)]
    buf <- paste(buf,collapse ="")
    data[[nr,17]] <- buf
    
    ## col2 - portraits, col4 - nationalities
    data <- data[,-c(2,4)]
    
    names(data) <- c("SqN","Name","Age","Pos","Min","App","LUp","SIn","SOut","Bench","Goal","Assist","YC","2YC","RC")
   
    ## read letters with diacritics correctly
    ## this is not an efficient way to do it
    ## and maybe not all characters mentioned
    SL <- list(    ## this is a list of substitutions 
        c("\\\\u00e9","e"),
        c("\\\\u0160","S"),
        c("\\\\u00e1","a"),
        c("\\\\u00e3","a"),
        c("\\\\u0141","L")
        )
    
    for(i in 1:length(SL)){
        data$Name <- gsub(SL[[i]][[1]],SL[[i]][[2]],data$Name)
    }
       
    
    data
}