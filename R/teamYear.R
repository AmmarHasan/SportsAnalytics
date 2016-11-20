output$teamYear <- DT::renderDataTable({
  req(input$teamA)
  tbl <-summary %>%
    filter(Team ==input$teamA) %>% 
    mutate(Pass.Accuracy=paste(round(PassAccuracy),'%')) %>%
    ungroup() %>%
    select(Player.Name, Appearances, Time.Played, Goals, Assists, Pass.Accuracy,
           Duels.won, Blocks, Interceptions,Tackles.Won)
  
  tbl %>% 
    DT::datatable(selection='single',rownames = FALSE, class='compact stripe hover row-border',
                  options= list(
                    paging = FALSE, searching = FALSE, info=FALSE,sorting = FALSE
                  )
    )
})