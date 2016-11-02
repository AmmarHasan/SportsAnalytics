library(dplyr)
library(magrittr)

# source("addRating.R",local = TRUE)

# summary
soccer <- readRDS("output//soccer_dataset.rds")

colnames(soccer %>% select(contains("Pass")))

summary <- soccer %>%
  group_by(Player.ID, Player.Name, Team) %>%
  summarize(
    Appearances = sum(Appearances), Goals = sum(Goals),Assists = sum(Assists),
    Time.Played = sum(Time.Played), PassAccuracy = mean(PassAccuracy),Duels.won = sum(Duels.won),
    Total.Successful.Passes.All = sum(Total.Successful.Passes.All),
    Total.Unsuccessful.Passes.All = sum(Total.Unsuccessful.Passes.All),
    Tackles.Won = sum(Tackles.Won), Tackles.Lost = sum(Tackles.Lost)
  )
saveRDS(summary,"output//summary.rds")

topGoalScorers <- summary[order(-summary$Goals),c("Player.ID","Player.Name","Team","Goals","Appearances")] %>% ungroup()
saveRDS(topGoalScorers,"output//topGoalScorers.rds") 

topAssists <- summary[order(-summary$Assists),c("Player.ID","Player.Name","Team","Assists","Appearances")] %>% ungroup()
saveRDS(topAssists,"output//topAssists.rds")

topPassAccuracy <-
  summary[order(-summary$PassAccuracy),c("Player.ID","Player.Name","Team","PassAccuracy","Total.Successful.Passes.All","Appearances")] %>% 
  ungroup() %>% 
  filter(Appearances > 5,Total.Successful.Passes.All > 100)
saveRDS(topPassAccuracy,"output//topPassAccuracy.rds")

topTacklers <-
  summary[order(-summary$Tackles.Won),c("Player.ID","Player.Name","Team","Tackles.Won","Tackles.Lost","Appearances")] %>% ungroup()
saveRDS(topTacklers,"output//topTacklers.rds")