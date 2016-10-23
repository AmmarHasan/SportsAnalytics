library(shiny)
library(shinydashboard)
library(dplyr) 
library(DT)
library(magrittr)
soccer <- readRDS("output//soccer_dataset.rds")
summary <- readRDS("output//summary.rds")

teamsChoice <- soccer$Team %>% unique() %>% sort()
uniquePlayers <- soccer %>% select(Player.ID, Player.Name) %>% unique()

playerChoice <- uniquePlayers$Player.ID
names(playerChoice) <- uniquePlayers$Player.Name