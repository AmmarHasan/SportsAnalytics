playerComparisionHTML <- function(playerId){
  playerData <- summary %>% filter(Player.ID == playerId) %>% ungroup()
  div(
    h3(class="text-center", playerData$Player.Name),
    div(class = 'container', getFromWiki(".image",playerId)),
    valueBox(
      round(playerData$Rating,digits = 2), "Rating", icon = icon("star"), color = "blue"
    ),
    valueBox(
      paste0(round(playerData$PassAccuracy), "%"), "Pass Acc", icon = icon("group"),
      color = "purple"
    ),
    valueBox(
      playerData$Goals, "Goals", icon = icon("futbol-o"), color = "green"
    ),
    taskItem(value = round((playerData$Total.Successful.Passes.All/(playerData$Total.Successful.Passes.All+playerData$Total.Unsuccessful.Passes.All))*100), color = "green", "Successfull Passes")
  )
}

output$playerComparison1 <- renderUI({
  req(input$playerA)
  playerComparisionHTML(input$playerA)
})

output$playerComparison2 <- renderUI({
  req(input$playerB)
  playerComparisionHTML(input$playerB)
})

output$comparePlayerGoals <- renderPlot({
  req(input$playerA,input$playerB)
  
  player1 <- summary %>% ungroup() %>% filter(Player.ID == input$playerA) %>%
    select(Player.Name,Headed.Goals,Left.Foot.Goals,Right.Foot.Goals,Goals.Open.Play,Goals.from.penalties)
  player2 <- summary %>% ungroup() %>% filter(Player.ID == input$playerB) %>%
    select(Player.Name,Headed.Goals,Left.Foot.Goals,Right.Foot.Goals,Goals.Open.Play,Goals.from.penalties)
  
  goalRadar = as.data.frame(rbind(
    select(player1,-Player.Name),select(player2,-Player.Name)
  ))

  rownames(goalRadar) = c(player1$Player.Name,player2$Player.Name)
  goalRadar = rbind(rep(goalRadar %>% max(),length(goalRadar)) , rep(goalRadar %>% min(),length(goalRadar)) , goalRadar)
  
  colors_border = c(rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9))
  colors_in = c(rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4))
  
  radarchart(
    goalRadar, axistype = 1 ,
    pcol = colors_border , pfcol = colors_in , plwd = 4 , plty = 1,
    #custom the grid
    cglcol = "grey", cglty = 1, axislabcol = "grey", caxislabels = seq(0,20,5), cglwd = 0.8,
    #custom labels
    vlcex = 1.2
  )
  
  legend(
    x = "topright", y = 1, legend = rownames(goalRadar[-c(1,2),]), bty = "n", pch =
      20 , col = colors_in , text.col = "grey", cex = 0.9, pt.cex = 2
  )

})