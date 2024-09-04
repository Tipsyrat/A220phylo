library(ape)
library(phangorn)

mor <- as.matrix(pMor[,-1])
row.names(mor)<-as.vector(pMor[,1]$Species)
cMor <- phyDat(as.matrix(cbind(mor[,1:27],mor[,45:51],mor[,58:89],mor[,159:179])), type = "USER", levels =c(0,1,2,3,4,5,7,NA))

cMor_bab <- bab(cMor,trace=0)
cMor_bab

cMor_bab_cons <- root(consensus(cMor_bab), outgroup = "Tarsius",
                    resolve.root = TRUE, edgelabel = TRUE)
plot(cMor_bab_cons)
