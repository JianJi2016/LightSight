LightSight <- function(Reaction,Precursor){
  
library(dplyr)
numFrag <- ncol(Precursor) - 1
  
result <- NULL
for (j in 1:nrow(Reaction)) {
 Reaction %>% 
  slice(j) %>%
  select(MassShift) %>%
  pull -> value

Precursor %>%
  select(Precursor) %>%
  pull

ions <- Precursor %>%
  as.character() %>%
  as.numeric()

vec <- data.frame()
for (i in 1:numFrag) {
  vec[i,1:2] <-  c(ions[1] + value, ions[i+1] + value)
  vec[i,3:4] <-  c(ions[1] + value, ions[i+1])
}

colnames(vec) = c("Precursor1","Fragment1","Precursor2","Fragment2")

result <-  rbind(result,
cbind(Reaction %>%
        slice(j), vec)
       )
}

write.csv(result,"LightSight Result_neg.csv", row.names = F)
}
