dashboardPage(
  dashboardHeader(title = "Soccer Analytics"),
  dashboardSidebar(
    uiOutput("a"),
    
    sidebarMenu(
      id = "sbMenu",
      menuItem(
        "Teams", tabName = "teams",icon = icon("table"),
        menuSubItem("At A Glance", tabName = "tm_glance"),
        menuSubItem("Player Summary",tabName = "tm_playerSummary"),
        menuSubItem("Goals",tabName = "tm_goals"),
        menuSubItem("Team Leaders",tabName = "tm_leaders"),
        menuSubItem("Head to Head",tabName = "tm_hth"),
        menuSubItem("Scoreline Heatmap",tabName = "tm_heat"),
        menuSubItem("Sequences-Results",tabName = "tm_seqs")
      ),
      menuItem(
        "Players", tabName = "players",icon = icon("table"),
        menuSubItem("At A Glance", tabName = "pl_glance"),
        menuSubItem("By Opposition",tabName = "pl_opponent"),
        menuSubItem("Career Summary", tabName = "pl_career"),
        menuSubItem("Goal Details", tabName = "pl_goals"),
        menuSubItem("Points per Game", tabName = "pl_ppg"),
        menuSubItem("Sequences-Goals",tabName = "pl_seqs_goals")
        
      )
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)
