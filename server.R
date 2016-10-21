values <- reactiveValues()
values$playerID <- 28566 
values$TEAMNAME <- NULL
values$Opponents <- NULL
values$MATCHID <- NULL

values$teamYears <- NULL

shinyServer(function(input, output) {
  
  output$a <- renderUI({
    print(input$sbMenu)
    if (input$sbMenu=="pl_glance" || input$sbMenu=="pl_career" || input$sbMenu=="pl_opponent" || input$sbMenu=="pl_goals" || input$sbMenu=="pl_ppg" || input$sbMenu=="pl_seqs_goals") {
      inputPanel(selectInput("playerA", label="Type Name and Select", choices =playerChoice,selected=values$playerID))
    } else if (input$sbMenu=="tm_glance" || input$sbMenu=="tm_playerSummary" || input$sbMenu=="tm_goals" || input$sbMenu=="tm_leaders" || input$sbMenu=="tm_hth" || input$sbMenu=="tm_heat" || input$sbMenu=="tm_seqs" ) {
      inputPanel(selectInput("teamA", label=NULL,selected=values$TEAMNAME, teamsChoice))
    }
  })
  
  output$playerNames <- renderUI({
    inputPanel(selectInput("playerA", label=NULL,selected=values$TEAMNAME, playersChoice))
  })
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
})