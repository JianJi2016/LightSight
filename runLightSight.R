
source("LightSight.R")

LightSight(Reaction  = read.csv("Reaction.csv", header = T),
           Precursor = read.csv("Precursor_neg.csv", header = T)
           )
