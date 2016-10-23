values <- reactiveValues()
values$playerID <- 28566 
values$TEAMNAME <- NULL
values$Opponents <- NULL
values$MATCHID <- NULL

values$teamYears <- NULL

shinyServer(function(input, output, session) {
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
  
  
  # Observe Evenets
  observeEvent(input$playerA,{
    if(input$playerA==""){
      values$playerID <- input$playerA
    }
    print("event fired input$playerA:") 
    print(input$playerA)
  })
  
  observeEvent(input$teamA,{
    values$TEAMNAME <- input$teamA
    print("event fired input$teamA:")
    print(input$teamA)
  })
  
  # Html Output Files
  source("R/authors.R", local=TRUE)
  source("R/teamYear.R", local=TRUE)
  source("R/playerWiki.R", local=TRUE)
})