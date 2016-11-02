output$topGoalScorers <- DT::renderDataTable({
  tbl <-topGoalScorers %>% head(10) %>%select(Player.Name,Goals)
  tbl %>% 
    DT::datatable(selection='single',rownames = FALSE, class='compact stripe hover row-border',
                  options= list(paging = FALSE, searching = FALSE, info=FALSE,sorting = FALSE)
    )
})

output$topAssists <- DT::renderDataTable({
  tbl <-topAssists %>% head(10) %>%select(Player.Name,Assists)
  tbl %>% 
    DT::datatable(selection='single',rownames = FALSE, class='compact stripe hover row-border',
                  options= list(paging = FALSE, searching = FALSE, info=FALSE,sorting = FALSE)
    )
})

output$topPassAccuracy <- DT::renderDataTable({
  tbl <-topPassAccuracy %>% head(10) %>% 
    mutate(Pass_Accuracy= paste( trunc(PassAccuracy) ,'%') ) %>% 
    select(Player.Name,Pass_Accuracy)
  tbl %>% 
    DT::datatable(selection='single',rownames = FALSE, class='compact stripe hover row-border',
                  options= list(paging = FALSE, searching = FALSE, info=FALSE,sorting = FALSE)
    )
})

output$topTacklers <- DT::renderDataTable({
  tbl <-topTacklers %>% head(10) %>%select(Player.Name,Tackles.Won)
  tbl %>% 
    DT::datatable(selection='single',rownames = FALSE, class='compact stripe hover row-border',
                  options= list(paging = FALSE, searching = FALSE, info=FALSE,sorting = FALSE)
    )
})