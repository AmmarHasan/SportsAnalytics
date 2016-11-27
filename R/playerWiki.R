getFromWiki <- function(class, player) {
#   if(player %in% wikiData$vcard){
#     print("already present")
#     wikiData %>% filter(playerId==player) %>% select(vcardInfo)
#     return()
#   }
  theName <-
    uniquePlayers[uniquePlayers$Player.ID == player,]$Player.Name
  theName <- str_replace_all(theName," ","_")
  # print(theName)
  wikiURL <- paste0("http://en.wikipedia.org/wiki/",theName)
  print(wikiURL)
  test <-
    http_status(GET(wikiURL))  #http_status(GET("http://en.wikipedia.org/wiki/Ryan_Bennett"))
  # print(test$category)                 # no client error but also length(vcard)
  if (test$category != "client error") {
    vcard <- read_html(wikiURL) %>%
      html_nodes(class)
    print(class)
#      print(vcard)
#     print("lengthvcard")
#     print(length(vcard))
    if (length(vcard) != 0) {
      vcardInfo <- vcard[[1]]
    }
    
    if (length(vcard) == 0) {
      print("entered wiki 2")
      wikiURL <-
        paste0("http://en.wikipedia.org/wiki/",theName,"_(footballer)")
      print(wikiURL)
      test <-
        http_status(GET(wikiURL))  #http_status(GET("http://en.wikipedia.org/wiki/Ryan_Bennett"))
      # print(test$category)                 # no client error but also length(vcard)
      if (test$category != "client error") {
        print("enter vcard2")
        vcard <- html(wikiURL) %>%
          html_nodes(class)
        
        # print(vcard)
        vcardInfo <- vcard[[1]]
        if (length(vcard) == 0)
          return()
      }
    }
    HTML(as(vcardInfo,"character"))
  } else {
    HTML("No Information Available")
  }
}

# dsa<-data.frame(player=player,image=as(vcardInfo,"character"))
# image<-dsa%>%filter(player==17500)%>%select(image)
# HTML(as(image,"character"))
output$playerWiki <- renderUI({
  getFromWiki(".vcard",input$playerA)
})

output$dreamTeam <- renderUI({
  whoscoredURL <- "https://www.whoscored.com/Regions/252/Tournaments/2/Seasons/2935"
  test <- http_status(GET(whoscoredURL))  
  if (test$category != "client error") {
    websiteHTML <- read_html(whoscoredURL)
    pitchView <- websiteHTML %>% html_nodes(".best-formation")
    if (length(pitchView) != 0) {
      pitchViewInfo <- pitchView[[1]]
    }
    websiteHTMLinfo <- pitchView
    HTML(as(websiteHTMLinfo,"character"))
  } else {
    HTML("No Information Available")
  }
})