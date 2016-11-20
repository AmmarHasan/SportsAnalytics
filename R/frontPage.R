output$authors <- renderUI({
  div(h4("Taha Zaheer SE-11"),
      h4("Ammar Hasan SE-52"))
})

output$description <- renderUI({
  div("The age of relying on 'gut instinct' to create and manage a team is becoming extinct. The game has evolved from being a pastime to a full-fledged business. Therefore with the business factor involved there is a need for data-driven insight as evidence of decisions made. Thus, the problem in question is the need to have quantitative evidence to justify team, managerial and administrative decisions. Therefore the objective is to develop a system capable of processing and manipulating data to provide meaningful insight on the data at hand.

      The Dataset forms the basis of all possible solutions that can be derived through the system, therefore an elaborate and quality dataset is required to assure better model development leading to justified findings. On 17th August 2012 OPTA publicly released a rich dataset of player performance statistics of English Premier League season 2011-2012. It contains frequency counts for hundreds of different events, ranging from aerial duels to yellow cards, broken down by player and by game.
      
      From this dataset we extract attributes that satisfy a weighted index equation resulting in a rating for each player. With the accumulation of player performance ratings we will be in a position to apply statistical inference and machine learning algorithms for predictive analysis on the data drawing insightful results on various aspects of the sport.
      ")
})

