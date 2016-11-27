library(shiny)
library(shinydashboard)
library(dplyr) 
library(DT)
library(magrittr)
library(plotly)
library(stringr)
library(httr)
library(rvest)
library(plotly)
library(fmsb)

soccer <- readRDS("output//soccer_dataset.rds")
summary <- readRDS("output//summary.rds")
topGoalScorers <- readRDS("output//topGoalScorers.rds")
topAssists <- readRDS("output//topAssists.rds")
topPassAccuracy <- readRDS("output//topPassAccuracy.rds")
topTacklers <- readRDS("output//topTacklers.rds")

teamsChoice <- soccer$Team %>% unique() %>% sort()
uniquePlayers <- soccer %>% select(Player.ID, Player.Name) %>% unique()

playerChoice <- uniquePlayers$Player.ID
names(playerChoice) <- uniquePlayers$Player.Name
