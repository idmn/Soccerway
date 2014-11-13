## read letters with diacritics correctly
## this is not an efficient way to do it
## and maybe (surely) not all characters mentioned

handleDiacritics <- function(x){
    for(i in 1:length(subsList)){
        x <- gsub(subsList[[i]][[1]],subsList[[i]][[2]],x)
    }
    x
}


subsList <- list( 
    c("\\\\u00e9","e"), c("\\\\u0160","S"),
    c("\\\\u00e1","a"), c("\\\\u00e3","a"),
    c("\\\\u0141","L"), c("\\\\u010c","C"),
    c("\\\\u0107","c"), c("\\\\u00fc","u"),
    c("\\\\u0119","e"), c("\\\\u0144","n"),
    c("\\\\u00ed","i"), c("\\\\u00d6","O"),
    c("\\\\u00fd","y"), c("\\\\u00e4","a"),
    c("\\\\u00f6","o"), c("\\\\u015f","s"),
    c("\\\\u00f0","d"), c("\\\\u00f8","o"),
    c("\\\\u00ef","i"), c("\\\\u010d","c"),
    c("\\\\u00f1","n")
)