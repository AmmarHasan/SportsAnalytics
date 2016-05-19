library(dplyr)

#Read dataset
soccer<-readRDS("output//Clean_PL_2011_12_Match_By_Match.rds")

# Filtering by Position.Id

# Position.Id 1 means Goal Keeper
soccer %>%
  filter(Position.Id==1) %>%
  saveRDS("output//GoalKeeper.rds" )

# Position.Id 2 means Defender
soccer %>%
  filter(Position.Id==2) %>%
  saveRDS("output//Defender.rds" )


# Position.Id 4 means MidFielder
soccer %>%
  filter(Position.Id==4) %>%
  saveRDS("output//MidFielder.rds" )

# Position.Id 6 means Attacker
soccer %>%
  filter(Position.Id==6) %>%
  saveRDS("output//Attacker.rds" )