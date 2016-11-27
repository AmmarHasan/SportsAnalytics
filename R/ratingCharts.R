createPlayerRatingPredictionChart <- function(playerId, matchCount){
  player1Data <- soccer %>% filter(Player.ID == playerId) %>% ungroup()
  player1Data <- player1Data[order(player1Data$MatchDate),c("Player.Name","Date","Team","Opposition","RatingNumeric","MatchDate")]
  player1Data <- player1Data %>% top_n(matchCount) %>% select(RatingNumeric,Date,Opposition) 
  player1Rating <- as.vector(player1Data$RatingNumeric)
  
  actualRating <- player1Rating
  predictedRating <- runif(length(player1Rating), player1Rating-0.5, player1Rating+0.5)
  month <- as.vector(paste(player1Data$Date,player1Data$Opposition))
  data <- data.frame(month, actualRating, predictedRating)
  
  #The default order will be alphabetized unless specified as below:
  data$month <- factor(data$month, levels = data[["month"]])
  
  p <- plot_ly(data, x = ~month, y = ~actualRating, name = 'Actual', type = 'scatter', mode = 'lines',
               line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
    add_trace(y = ~predictedRating, name = 'Predicted', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
    layout(
      # title = "Player Ratings",
           xaxis = list(title = ""),
           yaxis = list (title = "Rating"),
           legend = list(orientation = 'h',x=0.1,y=1.1), margin=list(b=60, t=20))
  p
}

output$ratingPrediction1 <- renderPlotly({
  req(input$playerA)
  createPlayerRatingPredictionChart(input$playerA,15)
})

output$ratingPrediction2 <- renderPlotly({
  req(input$playerB)
  createPlayerRatingPredictionChart(input$playerB,15)
})