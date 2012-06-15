
setwd("~/Documents/werkstatt/la-package/la/work/")

events = read.csv("events.csv", colClasses = c('POSIXct', NA, NA, NA))
save(events, file="../data/events.rda", ascii=T)

scores = read.csv("scores.csv")
save(scores, file="../data/scores.rda", ascii=T)
