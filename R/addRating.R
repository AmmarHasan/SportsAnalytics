# Blackburn rover, Bolton Wanderers, Stoke City, Swansea city, Tottenham Hotspur, Wigan Atheletics

library(dplyr)

removeSpace <- function(data){
  return (gsub(" ", "", data , fixed = TRUE))
}
removeSpaceAndLower <- function(data){
  return (tolower(removeSpace(data)))
}

#Read dataset
soccer<-readRDS("output//PL_2011_12_Match_By_Match_Selected_Attributes.rds")
ratings<-read.csv("data//PlayerRatings.csv",header =T,sep =',')

# Null to NA
ratings[ratings=='null']<-NA
#Omit NA
ratings<-ratings%>% na.omit()

soccer<-
  soccer%>%
  mutate(MatchId=removeSpaceAndLower(ifelse(soccer$Venue=="Home",
                                            paste(soccer$Team,soccer$Opposition),
                                            paste(soccer$Opposition,soccer$Team))),
         Player.Name.Without.Special.Characters=gsub("[^a-zA-Z]","",Player.Name),
         id=paste(MatchId,Player.Name.Without.Special.Characters))

#tbl_df(soccer)
#soccer<-soccer%>%mutate()
tbl_df(soccer)

ratings<- 
  ratings%>%
  mutate( Player.Name.Without.Special.Characters=gsub("[^a-zA-Z]","",Player.Name))
ratings<- ratings%>%mutate(id=paste(MatchId,ratings$Player.Name.Without.Special.Characters))
#head(ratings%>%filter(grepl("Buz",ratings$PlayerName)))

res<- inner_join(soccer, ratings, by ="id")
res<-res%>%select(id,MatchId.y,Player.Name.y,Rating,Goals,Total.Successful.Passes.All)

res%>%filter(grepl("Foley",res$Player.Name))
tbl_df(res)


# getMatchId <- function(teamA,teamB,venue){
#   if(venue=="Home")
#     return (paste(team,teamB))
#   else if(venue=="Away")
#     return (paste(teamB,teamA))
# }
# getMatchId(soccer$Team,soccer$Opposition,soccer$Venue)
