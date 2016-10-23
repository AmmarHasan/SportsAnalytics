library(dplyr)
library(magrittr)

source("addRating.R",local = TRUE)

# summary
soccer <- readRDS("output//soccer_dataset.rds")
summary <- soccer %>%
  group_by(Player.ID, Player.Name, Team) %>%
  summarize(
    Appearances = sum(Appearances), Goals = sum(Goals),Assists = sum(Assists),
    Time.Played = sum(Time.Played)
  )
saveRDS(summary,"output//summary.rds")