library(dplyr)

#Helper functions
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
getMatchIdForRating <- function(MergedTeamNames,PlayerName){
  return (removeSpaceAndLower(
      paste(MergedTeamNames,removeSpecial(PlayerName))
  ))
}


#Read Datasets
soccer<-readRDS("output//PL11_12_MbyM_Selected_Attributes.rds")
ratings<-read.csv("data//PlayerRatings.csv",header =T,sep =',',stringsAsFactors=FALSE)

## Transform PL11_12 dataset ##
# Change Teams Name
  soccer$Team[soccer$Team=="Blackburn Rovers"] <- "Blackburn"
  soccer$Team[soccer$Team=="Bolton Wanderers"] <- "Bolton"
  soccer$Team[soccer$Team=="Stoke City"] <- "Stoke"
  soccer$Team[soccer$Team=="Swansea City"] <- "Swansea"
  soccer$Team[soccer$Team=="Tottenham Hotspur"] <- "Tottenham"
  soccer$Team[soccer$Team=="Wigan Athletic"] <- "Wigan"
  soccer$Team[soccer$Team=="Norwich City"] <- "Norwich"
  
  soccer$Opposition[soccer$Opposition=="Blackburn Rovers"] <- "Blackburn"
  soccer$Opposition[soccer$Opposition=="Bolton Wanderers"] <- "Bolton"
  soccer$Opposition[soccer$Opposition=="Stoke City"] <- "Stoke"
  soccer$Opposition[soccer$Opposition=="Swansea City"] <- "Swansea"
  soccer$Opposition[soccer$Opposition=="Tottenham Hotspur"] <- "Tottenham"
  soccer$Opposition[soccer$Opposition=="Wigan Athletic"] <- "Wigan"
  soccer$Opposition[soccer$Opposition=="Norwich City"] <- "Norwich"

# Add MatchId column & Save
soccer<-
  soccer%>%
  mutate(MatchId=getMatchId(Venue,Team,Opposition,Player.Name))%>%
  saveRDS("output//PL11_12_MbyM_Transformed.rds")


## Transform Rating dataset ##

# Null to NA
ratings[ratings=='null']<-NA

#Omit NA and Save
ratings<-ratings%>% 
  na.omit()

# Replace Nick name with Original Name
ratings$MatchId<-gsub("chicharito","javierhernndez",ratings$MatchId)
ratings$MatchId<-gsub("adrinlpez","piscu",ratings$MatchId)
ratings$MatchId<-gsub("willkeane","williamkeane",ratings$MatchId)
ratings$MatchId<-gsub("dannygabbidon","danielgabbidon",ratings$MatchId)
ratings$MatchId<-gsub("jazzrichards","ashleyrichards",ratings$MatchId)
ratings$MatchId<-gsub("sylvanebanksblake","sylvainebanksblake",ratings$MatchId)
ratings$MatchId<-gsub("dongwonji","jidongwon",ratings$MatchId)
ratings$MatchId<-gsub("aboudiaby","vassirikiaboudiaby",ratings$MatchId)
ratings$MatchId<-gsub("markusolsson","marcusolsson",ratings$MatchId)
ratings$MatchId<-gsub("johnheitinga","johnnyheitinga",ratings$MatchId)
ratings$MatchId<-gsub("jonnyhowson","jonathanhowson",ratings$MatchId)
ratings$MatchId<-gsub("joshmceachran","joshuamceachran",ratings$MatchId)
ratings$MatchId<-gsub("philbardsley","phillipbardsley",ratings$MatchId)
ratings$MatchId<-gsub("sebastienbassong","sbastienbassong",ratings$MatchId)
ratings$MatchId<-gsub("cheicktiot","cheiktiot",ratings$MatchId)
ratings$MatchId<-gsub("mousadembl","moussadembl",ratings$MatchId)
ratings$MatchId<-gsub("galkakuta","gaelkakuta",ratings$MatchId)
ratings$MatchId<-gsub("paddykenny","patrickkenny",ratings$MatchId)
ratings$MatchId<-gsub("youssoufmulumbu","youssufmulumbu",ratings$MatchId)
ratings$MatchId<-gsub("mattupson","matthewupson",ratings$MatchId)
ratings$MatchId<-gsub("joshvela","joshuavela",ratings$MatchId)
ratings$MatchId<-gsub("mikewilliamson","michaelwilliamson",ratings$MatchId)
ratings$MatchId<-gsub("bradjones","bradleyjones",ratings$MatchId)
ratings$MatchId<-gsub("eggertjnsson","eggertgunnthrjnsson",ratings$MatchId)
ratings$MatchId<-gsub("fbioaurlio","fabioaurelio",ratings$MatchId)
ratings$MatchId<-gsub("henriquehilario","henriquehilrio",ratings$MatchId)
ratings$MatchId<-gsub("jonflanagan","johnflanagan",ratings$MatchId)
ratings$MatchId<-gsub("nicoyennaris","nicholasyennaris",ratings$MatchId)
ratings$MatchId<-gsub("philneville","philipneville",ratings$MatchId)
ratings$MatchId<-gsub("vincegrella","vincenzogrella",ratings$MatchId)
ratings$MatchId<-gsub("johnnygorman","johngorman",ratings$MatchId)


#Save
saveRDS(ratings,"output//Rating_Transformed.rds")

#dont know why saveRDS removing variable from memory, but saving in rds perfectly