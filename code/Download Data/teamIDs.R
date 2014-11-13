## extract team IDs

## this is Premier League, season 2013-2014
defaultURLforteamIDs <- "http://int.soccerway.com/national/england/premier-league/20132014/regular-season/r21322/tables/"

teamIDs <- function(url = defaultURLforteamIDs){
    html <- XML::htmlTreeParse(url, useInternalNodes=T)
    data <- XML::xpathSApply(html, "//td[@class = 'text team large-link']/a", XML::xmlAttrs)
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
    ## 5 entries are from the vidget. we don't want to get them 
    data <- head(data,n=-5)
    
    ## fix some diacritics characters
    SL <- list(    ## this is a list of substitutions 
        c("ö","o"),
        c("ü","u"),
        c("á","a"),
        c("é","e"),
        c("i�","E"), ## doesn't work, see Saint-Etienne. dunno why
        c("�","i")
    )    
    for(i in 1:length(SL)){
        data$title <- gsub(SL[[i]][[1]],SL[[i]][[2]],data$title)
    }
    data
}
