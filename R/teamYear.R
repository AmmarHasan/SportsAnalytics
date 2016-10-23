output$teamYear <- DT::renderDataTable({
  req(input$teamA)
  tbl <-summary %>%
    filter(Team ==input$teamA) %>%
    select(-Team)
  
  tbl %>% 
    DT::datatable(selection='single',rownames = FALSE, class='compact stripe hover row-border',
                  options= list(
                    paging = FALSE, searching = FALSE, info=FALSE,sorting = FALSE
                  )
    )
})