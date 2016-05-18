library(dplyr)

#Read dataset
soccer<-read.csv("D://AMMAR//FYP//Soccer DataSets//Premier League 2011-12 Match by Match.csv")

# Filtering by Position.Id
# "saveRDS" saves a single object in binary or ASCII RDS format
# ASCII will be more efficient with version control systems like Git


# Position.Id 1 means Goal Keeper
soccer %>%
  filter(Position.Id==1) %>%
  saveRDS("output//GoalKeeper.rds", ascii=TRUE)

# Position.Id 2 means Defender
soccer %>%
  filter(Position.Id==2) %>%
  saveRDS("output//Defender.rds", ascii=TRUE)


# Position.Id 4 means MidFielder
soccer %>%
  filter(Position.Id==4) %>%
  saveRDS("output//MidFielder.rds", ascii=TRUE)

# Position.Id 6 means Attacker
soccer %>%
  filter(Position.Id==6) %>%
  saveRDS("output//Attacker.rds", ascii=TRUE)