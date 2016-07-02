library(dplyr)

removeSpace <- function(data){
  return (gsub(" ", "", data , fixed = TRUE))
}
removeSpaceAndLower <- function(data){
  return (tolower(removeSpace(data)))
}
removeSpecial <- function(data){
  return (gsub("[^a-zA-Z]","",data))
}

getMatchId <- function(Venue,teamA,teamB,PlayerName){
  return (removeSpaceAndLower(
    ifelse(
      Venue == "Home",
      paste(teamA,teamB,removeSpecial(PlayerName)),
      paste(teamB,teamA,removeSpecial(PlayerName))
    )
  ))
}


#Read Cleaned Soccer Data
soccer<-readRDS("output//PL11_12_MbyM_Selected_Attributes.rds")

# Change Teams Name
# Blackburn Rovers, Bolton Wanderers, Stoke City, Swansea City, Tottenham Hotspur, Wigan Atheletics
  soccer$Team[soccer$Team=="Blackburn Rovers"] <- "Blackburn"
  soccer$Team[soccer$Team=="Bolton Wanderers"] <- "Bolton"
  soccer$Team[soccer$Team=="Stoke City"] <- "Stoke"
  soccer$Team[soccer$Team=="Swansea City"] <- "Swansea"
  soccer$Team[soccer$Team=="Tottenham Hotspur"] <- "Tottenham"
  soccer$Team[soccer$Team=="Wigan Atheletics"] <- "Wigan"
  
  soccer$Opposition[soccer$Opposition=="Blackburn Rovers"] <- "Blackburn"
  soccer$Opposition[soccer$Opposition=="Bolton Wanderers"] <- "Bolton"
  soccer$Opposition[soccer$Opposition=="Stoke City"] <- "Stoke"
  soccer$Opposition[soccer$Opposition=="Swansea City"] <- "Swansea"
  soccer$Opposition[soccer$Opposition=="Tottenham Hotspur"] <- "Tottenham"
  soccer$Opposition[soccer$Opposition=="Wigan Atheletics"] <- "Wigan"

#Transform and Save
soccer<-
  soccer%>%
  mutate(MatchId=getMatchId(Venue,Team,Opposition,Player.Name))%>%
  saveRDS("output//PL11_12_MbyM_Transformed.rds")

  #dont know why above line removing variable from memory, but saving in rds perfectly
  #soccer$Team<- apply(soccer[,"Team"],1,getTeamName) 
  #soccer <- within(soccer, getTeamName(soccer$Team))