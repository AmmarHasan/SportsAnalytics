#Read dataset
soccer<-readRDS("output//PL11_12_MbyM_Transformed.rds")
ratings<-readRDS("output//Rating_Transformed.rds")

mergedDatset<- left_join(soccer, ratings, by ="MatchId")
write.csv(mergedDatset,"output//LeftMerged.csv")