soccer<-read.csv("data//Premier League 2011-12 Match by Match.csv",header =T,sep =',')

myPCA = function (df) {
   eig = eigen(cov(df))
   means = unlist(lapply(df,mean))
   scores = scale(df, center = means) %*% eig$vectors
   list(values = eig$values,vectors = eig$vectors, scores = scores)
}

my_pca = myPCA(soccer[12:210])
my_pca

pca = princomp(soccer[12:210], scores = T)
cbind(unlist(lapply(my_pca[1], sqrt)), pca$sdev)
scores = cbind(matrix(unlist(my_pca[3]),ncol = 4), pca$scores)
round(cor(scores)[1:4,5:8],3)

Pca2 = principal(soccer[12:210],nfactors = 5,
                 rotate = "varimax", missing = T, scores = T)
print.psych(Pca2, sort =T)
