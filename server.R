values <- reactiveValues()
values$playerID <- 28566 
values$TEAMNAME <- NULL
values$OPPNAME <- NULL
values$Opponents <- NULL
values$MATCHID <- NULL

values$teamYears <- NULL

shinyServer(function(input, output, session) {
  
  output$authors2 <- renderUI({
    div(h4("Taha Zaheer SE-11"),
        h4("Ammar Hasan SE-52"))
  })
  
  output$selectPlayer <- renderUI({
    print(input$sbMenu)
    if (input$sbMenu=="pl_glance" || input$sbMenu=="pl_pass" || input$sbMenu=="pl_opponent" || input$sbMenu=="pl_goals" ||input$sbMenu=="mt_team") {
      inputPanel(selectInput("playerA", label="Type Name and Select", choices =playerChoice,selected=values$playerID))
    }
  })
  
  output$selectTeam <- renderUI({
    print(input$sbMenu)
    if (input$sbMenu=="tm_glance" || input$sbMenu=="tm_playerSummary" || input$sbMenu=="tm_goals" || input$sbMenu=="mt_team" ) {
      inputPanel(selectInput("teamA", label="Select Team",selected=values$TEAMNAME, teamsChoice))
    }
  })
  
  output$selectOpposition <- renderUI({
    print(input$sbMenu)
    if (input$sbMenu=="mt_team" ) {
      inputPanel(selectInput("teamB", label="Select Opposition",selected=values$OPPNAME, teamsChoice))
    }
  })
  
  output$playerNames <- renderUI({
    inputPanel(selectInput("playerA", label="Type Name and Select", choices =playerChoice,selected=values$playerID))
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
  source("R/frontPage.R", local=TRUE)
  source("R/teamYear.R", local=TRUE)
  source("R/playerWiki.R", local=TRUE)
  source("R/passingPieChart.R", local=TRUE)
  source("R/topPlayers.R", local=TRUE)
})