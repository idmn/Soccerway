## Data explotation

## нужно написать строчку про считывание данных из папки.
## но пока забъю на это

ndfAge <- c(unlist(sapply(data, function(x) x$Age),use.names=F))
ndfAge <- as.numeric(ndfAge)
## dunno
ndfAge <- ndfAge - 0.5

ndfMin <- c(unlist(sapply(data, function(x) x$Min),use.names=F))
ndfMin <- as.numeric(ndfMin)

ndfGoal <- c(unlist(sapply(data, function(x) x$Goal),use.names=F))
ndfGoal <- as.numeric(ndfGoal)

ndf <- as.data.frame(cbind(ndfAge,ndfMin,ndfGoal))
ndf <- ndf[complete.cases(ndf),]
names(ndf) <- c("Age","Min","Goal")

## make group groups

getgroup <- function(x) paste0(2*floor(x/2),"-",2*ceiling(x/2))

groups <- sapply(ndf$Age, getgroup)
ndf <- split(ndf,groups)

res <- sapply(ndf, function(x){
        colSums(x[,2:3])
    } 
)

GPMatch <- 90*res[2,]/res[1,]
res <- rbind(res,GPMatch)
