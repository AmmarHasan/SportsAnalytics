library(dplyr)
library(magrittr)

source("addRating.R",local = TRUE)

# summary
soccer <- readRDS("output//soccer_dataset.rds")

colnames(soccer %>% select(contains("Pass")))

summary <- soccer %>%
  group_by(Player.ID, Player.Name, Team) %>%
  summarize(
    Appearances = sum(Appearances), Goals = sum(Goals),Assists = sum(Assists),
    Time.Played = sum(Time.Played), PassAccuracy = mean(PassAccuracy),Duels.won = sum(Duels.won),
    Total.Successful.Passes.All = sum(Total.Successful.Passes.All),
    Total.Unsuccessful.Passes.All = sum(Total.Unsuccessful.Passes.All)
  )
saveRDS(summary,"output//summary.rds")