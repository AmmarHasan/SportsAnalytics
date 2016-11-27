createAppearancePieChart<- function(playerId){
  req(playerId)
  data2 <- summary %>% filter(Player.ID == playerId) %>% ungroup() %>% 
    select(FullGames,Substitute.On, Substitute.Off) %>% 
    t()
  data3 <- data.frame("Appearances" = rownames(data2), data2)
  
  plot_ly(
    data3, labels = ~ Appearances, values = ~ data2, type = 'pie'
  ) %>%
    layout(
      margin=list(b=20, t=40),
      title = 'Total Appearances',
      autosize = F, width = 300, height = 320,showlegend = FALSE,
      xaxis = list(
        showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE
      ),
      yaxis = list(
        showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE
      )
    )
}

output$appearanceChartplayerA <- renderPlotly({
  createAppearancePieChart(input$playerA)
})

output$appearanceChartplayerB <- renderPlotly({
  createAppearancePieChart(input$playerB)
})