#Read dataset
library("dplyr")
soccer<-readRDS("output//PL11_12_MbyM_Transformed.rds")
ratings<-readRDS("output//Rating_Transformed.rds")

mergedDatset<- left_join(soccer, ratings, by ="MatchId")
write.csv(mergedDatset,"output//Merged.csv")
saveRDS(mergedDatset,"output//soccer_dataset.rds")
