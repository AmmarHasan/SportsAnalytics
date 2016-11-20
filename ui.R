setwd(getwd())
dashboardPage(
  dashboardHeader(title = "Soccer Analytics"),
  dashboardSidebar(
    uiOutput("selectPlayer"),
    uiOutput("selectPlayerToCompare"),
    uiOutput("selectTeam"),
    uiOutput("selectOpposition"),
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
        menuSubItem("Passing", tabName = "pl_pass"),
        menuSubItem("Compare", tabName = "pl_compare")
      ),
      menuItem(
        "Matches", tabName = "matches",icon = icon("table"),
        menuSubItem("By Team", tabName = "mt_team"),
        menuSubItem("By Player",tabName = "mt_player")
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
              width = 5,
              box(
                class = "information",
                width = 12,
                status = "warning",solidHeader = TRUE,title = "Authors",
                collapsible = T,collapsed = F,
                htmlOutput("authors"),
                tableOutput('tableComparision2')
              ),
              box(
                class = "information",
                width = 12,
                status = "warning",solidHeader = TRUE,title = "Description",
                collapsible = T,collapsed = F,
                htmlOutput("description")
              )
            ),
            column(
              width = 7,
              box(
                width = 12,
                status = "success",solidHeader = TRUE,title = "Twitter Feed",
                collapsible = T,collapsed = F,
                tags$body(
                  includeScript("www/twitter.js"),
                  a(
                    "Soccer", class = "twitter-timeline",
                    width = "560",
                    href = "https://twitter.com/pssGuy/timelines/524678699061641216",
                    "data-widget-id" = "524686407298596864",
                    "data-chrome" = "nofooter transparent noheader"
                  )
                )
              )
            ))
            ),
    tabItem(tabName = "tm_playerSummary",
            fluidRow(
              box(
                width = 12,status = "success",solidHeader = TRUE,title = "Player Summary ",
                DT::dataTableOutput('teamYear')
              )
            )),
    tabItem(tabName = "pl_glance",
            fluidRow(column(
              width = 4,
              box(
                width = 12,
                status = "success",solidHeader = TRUE,title = "Top Goal Scorers",collapsible = T,collapsed = F,
                DT::dataTableOutput('topGoalScorers')
              ),
              box(
                width = 12,
                status = "success",solidHeader = TRUE,title = "Top Assists",collapsible = T,collapsed = F,
                DT::dataTableOutput('topAssists')
              )),
              column(
                width = 4,
                box(
                  width = 12,title = "Wikipedia (includes non - EPL data)",solidHeader = TRUE,status = 'success',
                  collapsible = TRUE, collapsed = FALSE,
                  uiOutput("playerWiki")
                )),
              column(
                width = 4,
                box(
                  width = 12,
                  status = "success",solidHeader = TRUE,title = "Highest Pass Acc%",collapsible = T,collapsed = F,
                  DT::dataTableOutput('topPassAccuracy')
                ),
                box(
                  width = 12,
                  status = "success",solidHeader = TRUE,title = "Top Tacklers",collapsible = T,collapsed = F,
                  DT::dataTableOutput('topTacklers')
                )
              )
            )),
    tabItem(tabName = "pl_attack",
            fluidRow(column(
              width = 5,offset = 3,
              box(
                width = 12,title = "Goals",solidHeader = TRUE,status = 'success',
                collapsible = TRUE, collapsed = FALSE
                # , plotlyOutput("passingPieChart")
              )
            ))),
    tabItem(tabName = "pl_pass",
            fluidRow(column(
              width = 5,
              box(
                width = 12,title = "Pass Success",solidHeader = TRUE,status = 'success',
                collapsible = TRUE, collapsed = FALSE,
                plotlyOutput("passingPieChart")
              )
            ),column(
              width = 7,
              box(
                width = 12,title = "Pass Types",solidHeader = TRUE,status = 'success',
                collapsible = TRUE, collapsed = FALSE,
                plotOutput("passingRadar")
              )
            ))),
    tabItem(tabName = "pl_compare",
            fluidRow(
              column(
                width = 4,
                class = "boxWithLessPadding",
                box(
                  width = 12,solidHeader = TRUE,status = 'success',
                  collapsible = FALSE,
                  uiOutput("playerComparison1"),
                  plotlyOutput("appearanceChartplayerA")
                )
              ),column(
                width = 4,
                class = "boxWithLessPadding",
                box(width = 12,
                    tableOutput('tableComparision')),
                box(
                  width = 12,title = "Goal Types",solidHeader = TRUE,status = 'success',
                  collapsible = TRUE, collapsed = FALSE,
                  plotOutput("comparePlayerGoals")
                )
              ),column(
                width = 4,
                class = "boxWithLessPadding",
                box(
                  width = 12,solidHeader = TRUE,status = 'success',
                  collapsible = FALSE,
                  uiOutput("playerComparison2"),
                  plotlyOutput("appearanceChartplayerB")
                )
              )
            )),
    tabItem(tabName = "mt_team",
            fluidRow(
              box(
                class = "information", width = 12, status = "warning",solidHeader = TRUE,
                title = "Authors", collapsible = T,collapsed = F
              )
            ))
  ))
)
