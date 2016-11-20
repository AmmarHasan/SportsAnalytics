getFromWiki <- function(class, player) {
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
    print("enter vcard")
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