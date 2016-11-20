output$passingPieChart <- renderPlotly({
  req(input$playerA)
  data2 <-
    summary %>% filter(Player.ID == input$playerA) %>% ungroup() %>% 
    select(Total.Successful.Passes.All,Total.Unsuccessful.Passes.All) %>%
    t()
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


output$passingRadar <- renderPlot({
passRadar<- summary%>%ungroup()%>% filter(Player.ID==input$playerA)%>%
  select(Pass.Left,Pass.Right,Pass.Forward,Pass.Backward,Successful.Long.Passes,Successful.Short.Passes)
passRadar=rbind(rep(passRadar %>% max(),5) , rep(passRadar %>% min(),5) , passRadar)
radarchart( passRadar  , axistype=1 , 
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=2 , 
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,passRadar$Pass.Left[1],passRadar$Pass.Left[1]/4 ), cglwd=0.8,
            #custom labels
            vlcex=0.9 
)
})