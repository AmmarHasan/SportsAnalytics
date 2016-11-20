library(dplyr)
library(magrittr)

# source("addRating.R",local = TRUE)

# summary
soccer <- readRDS("output//soccer_dataset.rds")

colnames(soccer %>% select(contains("Pass")))


summary <- soccer %>%
  group_by(Player.ID, Player.Name, Team) %>%
  summarize(
    FullGames= sum(ifelse(Time.Played==90,1,0)),
    Rating=mean(Rating),
    PassAccuracy=mean(PassAccuracy),
    Appearances=sum(Appearances),
    Time.Played=sum(Time.Played),
    Substitute.On=sum(Substitute.On),
    Substitute.Off=sum(Substitute.Off),
    Goals=sum(Goals),
    First.Goal=sum(First.Goal),
    Winning.Goal=sum(Winning.Goal),
    Shots.On.Target.inc.goals=sum(Shots.On.Target.inc.goals),
    Shots.Off.Target.inc.woodwork=sum(Shots.Off.Target.inc.woodwork),
    Blocked.Shots=sum(Blocked.Shots),
    Penalties.Taken=sum(Penalties.Taken),
    Penalty.Goals=sum(Penalty.Goals),
    Penalties.Saved=sum(Penalties.Saved),
    Penalties.Off.Target=sum(Penalties.Off.Target),
    Penalties.Not.Scored=sum(Penalties.Not.Scored),
    Direct.Free.kick.Goals=sum(Direct.Free.kick.Goals),
    Direct.Free.kick.On.Target=sum(Direct.Free.kick.On.Target),
    Direct.Free.kick.Off.Target=sum(Direct.Free.kick.Off.Target),
    Blocked.Direct.Free.kick=sum(Blocked.Direct.Free.kick),
    Goals.from.Inside.Box=sum(Goals.from.Inside.Box),
    Shots.On.from.Inside.Box=sum(Shots.On.from.Inside.Box),
    Shots.Off.from.Inside.Box=sum(Shots.Off.from.Inside.Box),
    Blocked.Shots.from.Inside.Box=sum(Blocked.Shots.from.Inside.Box),
    Goals.from.Outside.Box=sum(Goals.from.Outside.Box),
    Shots.On.Target.Outside.Box=sum(Shots.On.Target.Outside.Box),
    Shots.Off.Target.Outside.Box=sum(Shots.Off.Target.Outside.Box),
    Blocked.Shots.Outside.Box=sum(Blocked.Shots.Outside.Box),
    Headed.Goals=sum(Headed.Goals),
    Headed.Shots.On.Target=sum(Headed.Shots.On.Target),
    Headed.Shots.Off.Target=sum(Headed.Shots.Off.Target),
    Headed.Blocked.Shots=sum(Headed.Blocked.Shots),
    Left.Foot.Goals=sum(Left.Foot.Goals),
    Left.Foot.Shots.On.Target=sum(Left.Foot.Shots.On.Target),
    Left.Foot.Shots.Off.Target=sum(Left.Foot.Shots.Off.Target),
    Left.Foot.Blocked.Shots=sum(Left.Foot.Blocked.Shots),
    Right.Foot.Goals=sum(Right.Foot.Goals),
    Right.Foot.Shots.On.Target=sum(Right.Foot.Shots.On.Target),
    Right.Foot.Shots.Off.Target=sum(Right.Foot.Shots.Off.Target),
    Right.Foot.Blocked.Shots=sum(Right.Foot.Blocked.Shots),
    Other.Goals=sum(Other.Goals),
    Other.Shots.On.Target=sum(Other.Shots.On.Target),
    Other.Shots.Off.Target=sum(Other.Shots.Off.Target),
    Other.Blocked.Shots=sum(Other.Blocked.Shots),
    Shots.Cleared.off.Line=sum(Shots.Cleared.off.Line),
    Shots.Cleared.off.Line.Inside.Area=sum(Shots.Cleared.off.Line.Inside.Area),
    Shots.Cleared.off.Line.Outside.Area=sum(Shots.Cleared.off.Line.Outside.Area),
    Goals.Open.Play=sum(Goals.Open.Play),
    Goals.from.Corners=sum(Goals.from.Corners),
    Goals.from.Throws=sum(Goals.from.Throws),
    Goals.from.Direct.Free.Kick=sum(Goals.from.Direct.Free.Kick),
    Goals.from.Set.Play=sum(Goals.from.Set.Play),
    Goals.from.penalties=sum(Goals.from.penalties),
    Attempts.Open.Play.on.target=sum(Attempts.Open.Play.on.target),
    Attempts.from.Corners.on.target=sum(Attempts.from.Corners.on.target),
    Attempts.from.Throws.on.target=sum(Attempts.from.Throws.on.target),
    Attempts.from.Direct.Free.Kick.on.target=sum(Attempts.from.Direct.Free.Kick.on.target),
    Attempts.from.Set.Play.on.target=sum(Attempts.from.Set.Play.on.target),
    Attempts.from.Penalties.on.target=sum(Attempts.from.Penalties.on.target),
    Attempts.Open.Play.off.target=sum(Attempts.Open.Play.off.target),
    Attempts.from.Corners.off.target=sum(Attempts.from.Corners.off.target),
    Attempts.from.Throws.off.target=sum(Attempts.from.Throws.off.target),
    Attempts.from.Direct.Free.Kick.off.target=sum(Attempts.from.Direct.Free.Kick.off.target),
    Attempts.from.Set.Play.off.target=sum(Attempts.from.Set.Play.off.target),
    Attempts.from.Penalties.off.target=sum(Attempts.from.Penalties.off.target),
    Goals.as.a.substitute=sum(Goals.as.a.substitute),
    Total.Successful.Passes.All=sum(Total.Successful.Passes.All),
    Total.Unsuccessful.Passes.All=sum(Total.Unsuccessful.Passes.All),
    Assists=sum(Assists),
    Key.Passes=sum(Key.Passes),
    Total.Successful.Passes.Excl.Crosses.Corners=sum(Total.Successful.Passes.Excl.Crosses.Corners),
    Total.Unsuccessful.Passes.Excl.Crosses.Corners=sum(Total.Unsuccessful.Passes.Excl.Crosses.Corners),
    Successful.Passes.Own.Half=sum(Successful.Passes.Own.Half),
    Unsuccessful.Passes.Own.Half=sum(Unsuccessful.Passes.Own.Half),
    Successful.Passes.Opposition.Half=sum(Successful.Passes.Opposition.Half),
    Unsuccessful.Passes.Opposition.Half=sum(Unsuccessful.Passes.Opposition.Half),
    Successful.Passes.Defensive.third=sum(Successful.Passes.Defensive.third),
    Unsuccessful.Passes.Defensive.third=sum(Unsuccessful.Passes.Defensive.third),
    Successful.Passes.Middle.third=sum(Successful.Passes.Middle.third),
    Unsuccessful.Passes.Middle.third=sum(Unsuccessful.Passes.Middle.third),
    Successful.Passes.Final.third=sum(Successful.Passes.Final.third),
    Unsuccessful.Passes.Final.third=sum(Unsuccessful.Passes.Final.third),
    Successful.Short.Passes=sum(Successful.Short.Passes),
    Unsuccessful.Short.Passes=sum(Unsuccessful.Short.Passes),
    Successful.Long.Passes=sum(Successful.Long.Passes),
    Unsuccessful.Long.Passes=sum(Unsuccessful.Long.Passes),
    Successful.Flick.Ons=sum(Successful.Flick.Ons),
    Unsuccessful.Flick.Ons=sum(Unsuccessful.Flick.Ons),
    Successful.Crosses.Corners=sum(Successful.Crosses.Corners),
    Unsuccessful.Crosses.Corners=sum(Unsuccessful.Crosses.Corners),
    Corners.Taken.incl.short.corners=sum(Corners.Taken.incl.short.corners),
    Corners.Conceded=sum(Corners.Conceded),
    Successful.Corners.into.Box=sum(Successful.Corners.into.Box),
    Unsuccessful.Corners.into.Box=sum(Unsuccessful.Corners.into.Box),
    Short.Corners=sum(Short.Corners),
    Throw.Ins.to.Own.Player=sum(Throw.Ins.to.Own.Player),
    Throw.Ins.to.Opposition.Player=sum(Throw.Ins.to.Opposition.Player),
    Successful.Dribbles=sum(Successful.Dribbles),
    Unsuccessful.Dribbles=sum(Unsuccessful.Dribbles),
    Successful.Crosses.Corners.Left=sum(Successful.Crosses.Corners.Left),
    Unsuccessful.Crosses.Corners.Left=sum(Unsuccessful.Crosses.Corners.Left),
    Successful.Crosses.Left=sum(Successful.Crosses.Left),
    Unsuccessful.Crosses.Left=sum(Unsuccessful.Crosses.Left),
    Successful.Corners.Left=sum(Successful.Corners.Left),
    Unsuccessful.Corners.Left=sum(Unsuccessful.Corners.Left),
    Successful.Crosses.Corners.Right=sum(Successful.Crosses.Corners.Right),
    Unsuccessful.Crosses.Corners.Right=sum(Unsuccessful.Crosses.Corners.Right),
    Successful.Crosses.Right=sum(Successful.Crosses.Right),
    Unsuccessful.Crosses.Right=sum(Unsuccessful.Crosses.Right),
    Successful.Corners.Right=sum(Successful.Corners.Right),
    Unsuccessful.Corners.Right=sum(Unsuccessful.Corners.Right),
    Successful.Long.Balls=sum(Successful.Long.Balls),
    Unsuccessful.Long.Balls=sum(Unsuccessful.Long.Balls),
    Successful.Lay.Offs=sum(Successful.Lay.Offs),
    Unsuccessful.Lay.Offs=sum(Unsuccessful.Lay.Offs),
    Through.Ball=sum(Through.Ball),
    Successful.Crosses.Corners.in.the.air=sum(Successful.Crosses.Corners.in.the.air),
    Unsuccessful.Crosses.Corners.in.the.air=sum(Unsuccessful.Crosses.Corners.in.the.air),
    Successful.crosses.in.the.air=sum(Successful.crosses.in.the.air),
    Unsuccessful.crosses.in.the.air=sum(Unsuccessful.crosses.in.the.air),
    Successful.open.play.crosses=sum(Successful.open.play.crosses),
    Unsuccessful.open.play.crosses=sum(Unsuccessful.open.play.crosses),
    Touches=sum(Touches),
    Goal.Assist.Corner=sum(Goal.Assist.Corner),
    Goal.Assist.Free.Kick=sum(Goal.Assist.Free.Kick),
    Goal.Assist.Throw.In=sum(Goal.Assist.Throw.In),
    Goal.Assist.Goal.Kick=sum(Goal.Assist.Goal.Kick),
    Goal.Assist.Set.Piece=sum(Goal.Assist.Set.Piece),
    Key.Corner=sum(Key.Corner),
    Key.Free.Kick=sum(Key.Free.Kick),
    Key.Throw.In=sum(Key.Throw.In),
    Key.Goal.Kick=sum(Key.Goal.Kick),
    Key.Set.Pieces=sum(Key.Set.Pieces),
    Duels.won=sum(Duels.won),
    Duels.lost=sum(Duels.lost),
    Aerial.Duels.won=sum(Aerial.Duels.won),
    Aerial.Duels.lost=sum(Aerial.Duels.lost),
    Ground.Duels.won=sum(Ground.Duels.won),
    Ground.Duels.lost=sum(Ground.Duels.lost),
    Tackles.Won=sum(Tackles.Won),
    Tackles.Lost=sum(Tackles.Lost),
    Last.Man.Tackle=sum(Last.Man.Tackle),
    Total.Clearances=sum(Total.Clearances),
    Headed.Clearances=sum(Headed.Clearances),
    Other.Clearances=sum(Other.Clearances),
    Clearances.Off.the.Line=sum(Clearances.Off.the.Line),
    Blocks=sum(Blocks),
    Interceptions=sum(Interceptions),
    Recoveries=sum(Recoveries),
    Total.Fouls.Conceded=sum(Total.Fouls.Conceded),
    Fouls.Conceded.exc.handballs.pens=sum(Fouls.Conceded.exc.handballs.pens),
    Total.Fouls.Won=sum(Total.Fouls.Won),
    Fouls.Won.in.Danger.Area.inc.pens=sum(Fouls.Won.in.Danger.Area.inc.pens),
    Fouls.Won.not.in.danger.area=sum(Fouls.Won.not.in.danger.area),
    Foul.Won.Penalty=sum(Foul.Won.Penalty),
    Handballs.Conceded=sum(Handballs.Conceded),
    Penalties.Conceded=sum(Penalties.Conceded),
    Offsides=sum(Offsides),
    Yellow.Cards=sum(Yellow.Cards),
    Red.Cards=sum(Red.Cards),
    Goals.Conceded=sum(Goals.Conceded),
    Goals.Conceded.Inside.Box=sum(Goals.Conceded.Inside.Box),
    Goals.Conceded.Outside.Box=sum(Goals.Conceded.Outside.Box),
    Saves.Made=sum(Saves.Made),
    Saves.Made.from.Inside.Box=sum(Saves.Made.from.Inside.Box),
    Saves.Made.from.Outside.Box=sum(Saves.Made.from.Outside.Box),
    Saves.from.Penalty=sum(Saves.from.Penalty),
    Catches=sum(Catches),
    Punches=sum(Punches),
    Drops=sum(Drops),
    Crosses.not.Claimed=sum(Crosses.not.Claimed),
    GK.Distribution=sum(GK.Distribution),
    GK.Successful.Distribution=sum(GK.Successful.Distribution),
    GK.Unsuccessful.Distribution=sum(GK.Unsuccessful.Distribution),
    Clean.Sheets=sum(Clean.Sheets),
    Team.Clean.sheet=sum(Team.Clean.sheet),
    Error.leading.to.Goal=sum(Error.leading.to.Goal),
    Error.leading.to.Attempt=sum(Error.leading.to.Attempt),
    Challenge.Lost=sum(Challenge.Lost),
    Shots.On.Conceded=sum(Shots.On.Conceded),
    Shots.On.Conceded.Inside.Box=sum(Shots.On.Conceded.Inside.Box),
    Shots.On.Conceded.Outside.Box=sum(Shots.On.Conceded.Outside.Box),
    Team.Formation=sum(Team.Formation),
    Position.in.Formation=sum(Position.in.Formation),
    Turnovers=sum(Turnovers),
    Dispossessed=sum(Dispossessed),
    Big.Chances=sum(Big.Chances),
    Big.Chances.Faced=sum(Big.Chances.Faced),
    Pass.Forward=sum(Pass.Forward),
    Pass.Backward=sum(Pass.Backward),
    Pass.Left=sum(Pass.Left),
    Pass.Right=sum(Pass.Right),
    Unsuccessful.Ball.Touch=sum(Unsuccessful.Ball.Touch),
    Successful.Ball.Touch=sum(Successful.Ball.Touch),
    Take.Ons.Overrun=sum(Take.Ons.Overrun),
    Touches.open.play.final.third=sum(Touches.open.play.final.third),
    Touches.open.play.opp.box=sum(Touches.open.play.opp.box),
    Touches.open.play.opp.six.yards=sum(Touches.open.play.opp.six.yards)
  )
saveRDS(summary,"output//summary.rds")

topGoalScorers <- summary[order(-summary$Goals),c("Player.ID","Player.Name","Team","Goals","Appearances")] %>% ungroup()
saveRDS(topGoalScorers,"output//topGoalScorers.rds") 

topAssists <- summary[order(-summary$Assists),c("Player.ID","Player.Name","Team","Assists","Appearances")] %>% ungroup()
saveRDS(topAssists,"output//topAssists.rds")

topPassAccuracy <-
  summary[order(-summary$PassAccuracy),c("Player.ID","Player.Name","Team","PassAccuracy","Total.Successful.Passes.All","Appearances")] %>% 
  ungroup() %>% 
  filter(Appearances > 5,Total.Successful.Passes.All > 100)
saveRDS(topPassAccuracy,"output//topPassAccuracy.rds")

topTacklers <-
  summary[order(-summary$Tackles.Won),c("Player.ID","Player.Name","Team","Tackles.Won","Tackles.Lost","Appearances")] %>% ungroup()
saveRDS(topTacklers,"output//topTacklers.rds")
# 
# 
# library(plotly)
# 
# y <- c('The course was effectively<br>organized',
#        'The course developed my<br>abilities and skills for<br>the subject',
#        'The course developed my<br>ability to think critically about<br>the subject',
#        'I would recommend this<br>course to a friend')
# x1 <- c(21, 24, 27, 29)
# x2 <-c(3, 21, 16, 14)
# x3 <- c(21, 19, 23, 15)
# x4 <- c(26, 25, 31, 18)
# x5 <- c(12, 11, 13, 14)
# 
# data <- data.frame(y, x1, x2, x3, x4, x5)
# 
# top_labels <- c('Strongly<br>agree', 'Agree', 'Neutral', 'Disagree', 'Strongly<br>disagree')
# 
# p <- plot_ly(data, x = ~x1, y = ~y, type = 'bar', orientation = 'h',
#              marker = list(color = 'rgba(38, 24, 74, 0.8)',
#                            line = list(color = 'rgb(248, 248, 249)', width = 1))) %>%
#   add_trace(x = ~x2, marker = list(color = 'rgba(71, 58, 131, 0.8)')) %>%
#   add_trace(x = ~x3, marker = list(color = 'rgba(122, 120, 168, 0.8)')) %>%
#   add_trace(x = ~x4, marker = list(color = 'rgba(164, 163, 204, 0.85)')) %>%
#   add_trace(x = ~x5, marker = list(color = 'rgba(190, 192, 213, 1)')) %>%
#   layout(xaxis = list(title = "",
#                       showgrid = FALSE,
#                       showline = FALSE,
#                       showticklabels = FALSE,
#                       zeroline = FALSE,
#                       domain = c(0.15, 1)),
#          yaxis = list(title = "",
#                       showgrid = FALSE,
#                       showline = FALSE,
#                       showticklabels = FALSE,
#                       zeroline = FALSE),
#          barmode = 'stack',
#          paper_bgcolor = 'rgb(248, 248, 255)', plot_bgcolor = 'rgb(248, 248, 255)',
#          margin = list(l = 120, r = 10, t = 140, b = 80),
#          showlegend = FALSE) %>%
#   # labeling the y-axis
#   add_annotations(xref = 'paper', yref = 'y', x = 0.14, y = y,
#                   xanchor = 'right',
#                   text = y,
#                   font = list(family = 'Arial', size = 12,
#                               color = 'rgb(67, 67, 67)'),
#                   showarrow = FALSE, align = 'right') %>%
#   # labeling the percentages of each bar (x_axis)
#   add_annotations(xref = 'x', yref = 'y',
#                   x = x1 / 2, y = y,
#                   text = paste(data[,"x1"], '%'),
#                   font = list(family = 'Arial', size = 12,
#                               color = 'rgb(248, 248, 255)'),
#                   showarrow = FALSE) %>%
#   add_annotations(xref = 'x', yref = 'y',
#                   x = x1 + x2 / 2, y = y,
#                   text = paste(data[,"x2"], '%'),
#                   font = list(family = 'Arial', size = 12,
#                               color = 'rgb(248, 248, 255)'),
#                   showarrow = FALSE) %>%
#   add_annotations(xref = 'x', yref = 'y',
#                   x = x1 + x2 + x3 / 2, y = y,
#                   text = paste(data[,"x3"], '%'),
#                   font = list(family = 'Arial', size = 12,
#                               color = 'rgb(248, 248, 255)'),
#                   showarrow = FALSE) %>%
#   add_annotations(xref = 'x', yref = 'y',
#                   x = x1 + x2 + x3 + x4 / 2, y = y,
#                   text = paste(data[,"x4"], '%'),
#                   font = list(family = 'Arial', size = 12,
#                               color = 'rgb(248, 248, 255)'),
#                   showarrow = FALSE) %>%
#   add_annotations(xref = 'x', yref = 'y',
#                   x = x1 + x2 + x3 + x4 + x5 / 2, y = y,
#                   text = paste(data[,"x5"], '%'),
#                   font = list(family = 'Arial', size = 12,
#                               color = 'rgb(248, 248, 255)'),
#                   showarrow = FALSE) %>%
#   # labeling the first Likert scale (on the top)
#   add_annotations(xref = 'x', yref = 'paper',
#                   x = c(21 / 2, 21 + 30 / 2, 21 + 30 + 21 / 2, 21 + 30 + 21 + 16 / 2,
#                         21 + 30 + 21 + 16 + 12 / 2),
#                   y = 1.15,
#                   text = top_labels,
#                   font = list(family = 'Arial', size = 12,
#                               color = 'rgb(67, 67, 67)'),
#                   showarrow = FALSE)
# p   
# 
# 
# 
# 
# dat <- read.table(text = "    ONE TWO THREE
# 1   23  234 324
#                   2   34  534 12
#                   3   56  324 124
#                   4   34  234 124
#                   5   123 534 654",sep = "",header = TRUE)
# 
# #Add an id variable for the filled regions
# datm <- melt(cbind(dat, ind = rownames(dat)), id.vars = c('ind'))
# 
# library(scales)
# ggplot(datm,aes(x = variable, y = value,fill = ind)) + 
#   geom_bar(position = "fill",stat = "identity") + 
#   scale_y_continuous(labels = percent_format())
# 
# 
# 
# 
# 
# 
# your_matrix<-( 
#   rbind(
#     c(23,234), 
#     c(123,534)
#   )
# )
# 
# barplot(prop.table(your_matrix, 2) )
# 
# 
# 
# 
# 
# library(ggplot2)
# 
# # Create test data.
# dat = data.frame(count=c(10, 60, 30), category=c("A", "B", "C"))
# 
# # Add addition columns, needed for drawing with geom_rect.
# dat$fraction = dat$count / sum(dat$count)
# dat = dat[order(dat$fraction), ]
# dat$ymax = cumsum(dat$fraction)
# dat$ymin = c(0, head(dat$ymax, n=-1))
# 
# # Make the plot
# p1 = ggplot(dat, aes(fill=category, ymax=ymax, ymin=ymin, xmax=4, xmin=3)) +
#   geom_rect() +
#   coord_polar(theta="y") +
#   xlim(c(0, 4)) +
#   theme(panel.grid=element_blank()) +
#   theme(axis.text=element_blank()) +
#   theme(axis.ticks=element_blank()) +
#   annotate("text", x = 0, y = 0, label = "My Ring plot !") +
#   labs(title="")
# p1
# 
# 
# 
# require(ggplot2)
# g <- ggplot(mpg, aes(class))
# g + geom_bar(aes(fill = drv), position = "fill")
# 
