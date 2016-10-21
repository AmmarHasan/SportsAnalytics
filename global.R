library(shiny)
library(shinydashboard)
library(dplyr) 

soccer <- readRDS("output//soccer_dataset.rds")

teamsChoice <- soccer$Team %>% unique() %>% sort()
uniquePlayers <- soccer %>% select(Player.ID, PlayerName) %>% unique()

playerChoice <- uniquePlayers$Player.ID
names(playerChoice) <- uniquePlayers$PlayerName