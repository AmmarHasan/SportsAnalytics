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
        menuSubItem("Player Summary",tabName = "tm_playerSummary")
      ),
      menuItem(
        "Players", tabName = "players",icon = icon("table"),
        menuSubItem("At A Glance", tabName = "pl_glance"),
        menuSubItem("Attacking",tabName = "pl_attack"),
        menuSubItem("Defensive", tabName = "pl_defense"),
        menuSubItem("Passing", tabName = "pl_pass")
        
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
              width = 3,
              box(
                class = "information",
                width = 12,
                status = "warning",solidHeader = TRUE,title = "Authors",
                collapsible = T,collapsed = F,
                htmlOutput("authors")
              ),
              box(
                width = 12,
                status = "success",solidHeader = TRUE,title = "Twitter Feed",
                collapsible = T,collapsed = T,
                tags$body(
                  includeScript("www/twitter.js"),
                  a(
                    "Soccer", class = "twitter-timeline",
                    width = "320",
                    href = "https://twitter.com/pssGuy/timelines/524678699061641216",
                    "data-widget-id" = "524686407298596864",
                    "data-chrome" = "nofooter transparent noheader"
                  )
                )
              )
            ))),
    tabItem(tabName = "tm_playerSummary",
            fluidRow(
              box(
                width = 12,status = "success",solidHeader = TRUE,title = "Player Summary ",
                DT::dataTableOutput('teamYear')
              )
            )),
    tabItem(tabName = "pl_glance",
            fluidRow(column(
              width = 5,offset = 3,
              box(
                width = 12,title = "Wikipedia (includes non-EPL data)",solidHeader = TRUE,status = 'success',
                collapsible = TRUE, collapsed = FALSE,
                uiOutput("playerWiki")
              )
            )))
  ))
)
