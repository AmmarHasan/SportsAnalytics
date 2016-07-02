library(dplyr) 
#Read dataset
soccer<-read.csv("data//Premier League 2011-12 Match by Match.csv",header =T,sep =',',stringsAsFactors=FALSE)


soccer %>%
  mutate(Player.Name = paste(Player.Forename , Player.Surname , sep=" ") )%>%
  select_("Date","Position.Id","Player.ID","Player.Name","Team","Opposition","Venue",
          "Time.Played","Goals","Shots.On.Target.inc.goals","Shots.Off.Target.inc.woodwork",
          "Blocked.Shots","Total.Successful.Passes.All","Total.Unsuccessful.Passes.All","Assists",
          "Key.Passes","Successful.Dribbles","Unsuccessful.Dribbles","Successful.Crosses.Right",
          "Successful.Crosses.Left","Duels.won","Duels.lost","Tackles.Won","Tackles.Lost",
          "Last.Man.Tackle","Total.Clearances","Blocks","Interceptions","Recoveries",
          "Total.Fouls.Conceded","Total.Fouls.Won","Offsides","Red.Cards","Yellow.Cards",
          "Goals.Conceded","Saves.Made","Catches","Punches","Drops","GK.Distribution",
          "Clean.Sheets","Error.leading.to.Goal","Error.leading.to.Attempt","Dispossessed"
          ,"Unsuccessful.Ball.Touch","Successful.Ball.Touch") %>%
  saveRDS("output//PL11_12_MbyM_Selected_Attributes.rds")