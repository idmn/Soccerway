## extract team IDs

## this is Premier League, season 2013-2014
defaultURLforteamIDs <- "http://int.soccerway.com/national/england/premier-league/20132014/regular-season/r21322/"

teamIDs <- function(url = defaultURLforteamIDs){
    html <- XML::htmlTreeParse(url, useInternalNodes=T)
    data <- xpathSApply(html, "//td[@class = 'text team large-link']/a", xmlAttrs)
    data <- t(data)
    data <- as.data.frame(data[,c(2,1)])    
    names(data) <- c("title","id")
    data$id <- as.character(data$id)
    ## extract the ids from the "id" collumn, which currently
    ## contain a link to a team's page
    data$id <- sapply(data$id, function(x) {
        buf <-strsplit(x,"/")[[1]]
        buf[[length(buf)]]
        }
    )
    ## нужно разобраться, появляются лишние 5 записей
    data <- head(data,n=-5)
    
    data
}
