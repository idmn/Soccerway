## first, source "loadTablesToMemoryForExploration.R"

## NEW TABLES AND HISTOGRAMS

#==============(1)===========================
### make table
explr_Pos.Age <- function(x){
    ## this function is to be applied to the joined league table
    ## the result is a vector of age means for each
    ## position
    meanAge <- mean(x$Age,na.rm = T)
    split_Pos <- split(x,x$Pos)
    split_Pos.Age <- sapply(split_Pos, function(x) x$Age)
    mean_Pos.Age <- sapply(split_Pos.Age,function (x) mean(x,na.rm = T))
    c(mean_Pos.Age,all = meanAge)
    ## have to add sd and n values to perform t.tests  ???  
}
pos_age <- t(sapply(tables, explr_Pos.Age))
### write table
write.csv(pos_age,"findings/pos_age.csv")
### no histograms yet

#==============(2)===========================
### make table
explr_Pos.GoalPMin <- function(x){
    ## this function is to be applied to the joined league table
    ## the result is a vector of (total goals)/(total mins/90) for
    ## each position
    gpm <- 90*sum(x$Goal,na.rm = T)/sum(x$Min)
    split_Pos <- split(x,x$Pos)
    split_Pos.GoalSum <- 
        sapply(split_Pos, function(x) sum(x$Goal))
    split_Pos.MinSum <- 
        sapply(split_Pos, function(x) sum(x$Min))
    split_Pos.gpm <- 90*split_Pos.GoalSum/split_Pos.MinSum
    c(split_Pos.gpm,all = gpm)       
}
pos_gpm <- t(sapply(tables, explr_Pos.GoalPMin))
### write table
write.csv(pos_gpm,"findings/pos_gpm.csv")
### create histogram
png("findings/pos_gpm.png")
barplot(pos_gpm[,-3], ## no need to watch the goalkeepers stats
        col=c("yellow","green","gray","red","cyan"),
        legend=rownames(pos_gpm),beside=T,        
)
dev.off()

#==============(3)===========================
### make table
explr_AvMatch <- function(x){
    ## this function is to be applied to the joined league table
    ## the result is a vector of average number of goals, yellow,
    ## double-yellow and red cards per match
    
    ## number of teams
    n <- length(levels(x$Club))
    colSums(x[,list(Goal,YC,X2YC,RC)])/n/(n-1)
}
AvMatch <- t(sapply(tables, explr_AvMatch))
### write table
write.csv(AvMatch,"findings/AvMatch.csv")
### create histograms
png("findings/AvMatch-1.png")
barplot(AvMatch[,c("Goal","YC")],
        col=c("yellow","green","gray","red","cyan"),
        legend=rownames(AvMatch),beside=T,
        args.legend=list(x="topleft"))
dev.off()

png("findings/AvMatch-2.png")
barplot(AvMatch[,c("X2YC","RC")],
        col=c("yellow","green","gray","red","cyan"),
        legend=rownames(AvMatch),beside=T,
        args.legend=list("toprigth"))

dev.off()

#==============(4)===========================
### make table
explr_Pos.Plrs <- function(x, n = NULL){
    ## this function is to be applied to the joined league table
    ## the result is a vector of average average number of players
    ## played on each position
        
    ## number of teams
    if(is.null(n))
    n <- length(levels(x$Club))
    ## number of matches
    m <- n*(n-1)
    ## no need of gk's stats
    split_Pos <- split(x,x$Pos)[-3]
    split_Pos.Min <- sapply(split_Pos, function(x) sum(x$Min))/(2*m)
    
    pos_plrs <- split_Pos.Min/90
    ## normalize the result
    pos_plrs <- 10*pos_plrs/sum(pos_plrs)
    pos_plrs    
}
pos_plrs <- t(sapply(tables,explr_Pos.Plrs))
### write table
write.csv(pos_plrs,"findings/pos_plrs.csv")






