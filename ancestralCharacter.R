# Ancestral Character reconstruction

library(ape)
library(geiger)
library(diversitree) # linux install libgsl-dev and libfftw3-dev first
library(phytools)

setwd("/home/fritz/Dropbox/LAB-MUN/THESIS-MSC/ancestralCharacter")
getwd()
tree <- read.nexus("forAncestralML.nexus")
ancestral_table <- read.csv("ancestral_table.csv", sep=",", row.names=1)
#infloStates <- ancestral_table$inflorescence
infloStates <- ancestral_table[tree$tip.label, ]
#names(infloStates) <- row.names(ancestral_table)
ER<-ace(infloStates, tree, type="discrete", model="ER")
SYM<-ace(infloStates, tree, type="discrete", model="SYM")
ARD<-ace(infloStates, tree, type="discrete", model="ARD")

plotTree(tree,fsize=0.8,ftype="i",lwd=2, offset=0.5)
tiplabels(pie = to.matrix(infloStates, sort(unique(infloStates))), piecol = c("green","blue","red","orange"),cex = 0.2)
nodelabels(pie=ER$lik.anc, piecol=c("#66CC00","#3399FF","#FF3333","orange"),cex= 0.5)

1-pchisq(2*abs(ER$loglik - ARD$loglik), 1)

, adj=0.52
add.scale.bar()