setwd(getwd())
dashboardPage(
  dashboardHeader(title = "Soccer Analytics"),
  dashboardSidebar(
    uiOutput("a"),
    
    sidebarMenu(
      id = "sbMenu",
      menuItem("Front Page",tabName = "frontPage"),
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
        
      ),
      tags$hr(),
      
      tags$body(
        a(
          href = "https://twitter.com/Ammar1994", target = "_blank",img(src = "images/twitter.png",class = "addpad")
        ),
        a(
          href = "mailto:taha.zaheer27@gmail.com",img(src = "images/gmail.png",class = "addpad")
        ),
        a(
          href = "https://github.com/ammarhasan/sportsanalytics",target = "_blank",img(src = "images/github.png",class = "addpad")
        )
      )
    )
  ),
  dashboardBody(
    includeCSS("www/style.css"),
    tabItems(
    ## Front Page
    tabItem("frontPage",
            fluidRow(column(
              width = 4,
              box(
                class = "information",
                width = 12,
                status = "warning",solidHeader = TRUE,title = "Authors",
                collapsible = T,collapsed = F,
                htmlOutput("authors")
              )
            ))),
    tabItem(tabName = "tm_playerSummary",
            fluidRow(
              box(
                width = 12,status = "success",solidHeader = TRUE,title = "Player Summary ",
                DT::dataTableOutput('teamYear')
              )
              
            ))
  ))
)
