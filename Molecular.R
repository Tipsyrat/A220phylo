library(ape)
library(phangorn)
fdir <- system.file("extdata/trees", package = "phangorn")
DNAchar <- read.dna(file.path(fdir, "primates.dna"), format = "interleaved")
Tarsius <- DNAchar[4,]
Hom <- DNAchar[10:14,]
DNAchar <- as.matrix(rbind(Tarsius,Hom))

DNAchar <- phyDat(DNAchar,type="DNA")

## Distance method
# perform model selection to determine which distance model to model afer
mol_modsel <- modelTest(DNAchar, model = c("JC", "F81"), G = FALSE, I = FALSE)
# F81 is the better model
## To elucidate all maximum parsimony tree(s)
bab_DNA <- bab(DNAchar)
bab_DNA
plot(bab_DNA, edge.width=2)
