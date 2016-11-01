output$passingPieChart <- renderPlotly({
  req(input$playerA)
  data2 <-
    summary %>% filter(Player.ID == input$playerA) %>% ungroup() %>% select(Total.Successful.Passes.All,Total.Unsuccessful.Passes.All) %>% t()
  data3 <- data.frame("Passes" = rownames(data2), data2)
  
  plot_ly(
    data3, labels = ~ Passes, values = ~ data2, type = 'pie'
  ) %>%
    layout(
      title = 'Successful vs Unsuccessful',
      xaxis = list(
        showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE
      ),
      yaxis = list(
        showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE
      )
    )
})