library(tidyr)

#import data
dir("Data")
readxl::excel_sheets("Data/Data.xlsx")
d <- readxl::read_excel("Data/Data.xlsx","Table S4",skip = 2)

l <- readxl::read_excel("Data/Data.xlsx","Table S4", range = "A1:A1",
                        col_names = FALSE)
l <- l[[1]][1]

#fill the data : Species and Forest type
# names(d)
foret <- fill(d, Species, "Forest type")
rm(d)
#Change the variable names

# names(d)
# paste(names(d1), collapse = "', '")
orig.name <- c('Forest type', 'Species', 'Individual number', 'LT (mm)', 'LA (cm²)', 'SLA (cm2 g-1)', 'LDMC (g g-1)', 'LTD (g cm-3)', 'TDMC (g g-1)', 'TTD (g cm-3)', 'BT (mm)', 'BDMC (g g-1)', 'BTD (g cm-3)', 'SDMC (g g-1)', 'STD (g cm-3)', 'LC (mg g-1)', 'LN (mg g-1)', 'LP (mg g-1)', 'LCN', 'LCP', 'LNP', 'TC (mg g-1)', 'TN (mg g-1)', 'TP (mg g-1)', 'TCN', 'TCP', 'TNP', 'BC (mg g-1)', 'BN (mg g-1)', 'BP (mg g-1)', 'BCN', 'BCP', 'BNP', 'SC (mg g-1)', 'SN (mg g-1)', 'SP (mg g-1)', 'SCN', 'SCP', 'SNP')

new.name <- c('For.type', 'Species', 'Ind.number', 'leaf.thick', 'leaf.area', 'spec.leaf.area', 'leaf.dry.mat.cont', 'leaf.tissue.dens', 'twig.dry.mat.cont', 'twig.tis.dens', 'bark.thick', 'bark.dry.mat.cont', 'bark.tis.dens', 'stem.dry.mat.cont', 'stem.tis.dens', 'leaf.C.cont', 'leaf.N.cont', 'leaf.P.cont', 'leaf.C.N.ratio', 'leaf.C.P.ratio', 'leaf.N.P.ratio', 'twig.C.cont', 'twig.N.cont', 'twig.P.cont', 'twig.C.N.ratio', 'twig.C.P.ratio', 'twig.N.P.ratio', 'bark.C.cont', 'bark.N.cont', 'bark.P.cont', 'bark.C.N.ratio', 'bark.C.P.ratio', 'bark.N.P.ratio', 'stem.C.content','stem.N.cont', 'stem.P.cont', 'stem.C.N.ratio', 'stem.C.P.ratio', 'stem.N.P.ratio')

#Add Genus Data
library(stringr)
foret$genus <- word(foret$Species, 1)


#clean the data
# foret$bark.thick[221:225] <- 0
# foret$bark.thick[401:402] <- 0
# foret$bark.thick[411] <- 0
# foret$bark.thick[466:470] <- 0
# foret$bark.thick[486:490] <- 0
# 
# foret$bark.dry.mat.cont[221:225] <- 0
# foret$bark.dry.mat.cont[401:402] <- 0
# foret$bark.dry.mat.cont[411] <- 0
# foret$bark.dry.mat.cont[466:470] <- 0
# foret$bark.dry.mat.cont[486:490] <- 0
# 
# foret$bark.tis.dens[221:225] <- 0
# foret$bark.tis.dens[401:402] <- 0
# foret$bark.tis.dens[411] <- 0
# foret$bark.tis.dens[466:470] <- 0
# foret$bark.tis.dens[486:490] <- 0
# 
# foret$bark.C.cont[221:225] <- 0
# foret$bark.C.cont[401:402] <- 0
# foret$bark.C.cont[411] <- 0
# foret$bark.C.cont[466:470] <- 0
# foret$bark.C.cont[486:490] <- 0
# 
# foret$bark.N.cont[221:225] <- 0
# foret$bark.N.cont[401:402] <- 0
# foret$bark.N.cont[411] <- 0
# foret$bark.N.cont[466:470] <- 0
# foret$bark.N.cont[486:490] <- 0
# 
# foret$bark.P.cont[221:225] <- 0
# foret$bark.P.cont[401:402] <- 0
# foret$bark.P.cont[411] <- 0
# foret$bark.P.cont[466:470] <- 0
# foret$bark.P.cont[486:490] <- 0
# 
# foret$bark.C.N.ratio[221:225] <- 0
# foret$bark.C.N.ratio[401:402] <- 0
# foret$bark.C.N.ratio[411] <- 0
# foret$bark.C.N.ratio[466:470] <- 0
# foret$bark.C.N.ratio[486:490] <- 0
# 
# foret$bark.C.P.ratio[221:225] <- 0
# foret$bark.C.P.ratio[401:402] <- 0
# foret$bark.C.P.ratio[411] <- 0
# foret$bark.C.P.ratio[466:470] <- 0
# foret$bark.C.P.ratio[486:490] <- 0
# 
# foret$bark.N.P.ratio[221:225] <- 0
# foret$bark.N.P.ratio[401:402] <- 0
# foret$bark.N.P.ratio[411] <- 0
# foret$bark.N.P.ratio[466:470] <- 0
# foret$bark.N.P.ratio[486:490] <- 0
# 
# 
# foret$stem.dry.mat.cont[293:295] <- 0
# foret$stem.tis.dens[293:295] <- 0
# 
# foret$stem.C.content[293:295] <- 0
# foret$stem.N.cont[293:295] <- 0
# foret$stem.P.cont[293:295] <- 0
# foret$stem.C.N.ratio[293:295] <- 0
# foret$stem.C.P.ratio[293:295] <- 0
# foret$stem.N.P.ratio[293:295] <- 0

#Change to Numeric data
n <- which(names(foret)== "genus")
foret[-c(1,2,n)] <- sapply(foret[-c(1,2,n)],as.numeric)


#Clean real data 
#is.na(foret$bark.thick)
foret.c <- na.exclude(foret)


#Save the data

names(foret.c) <- new.name
foret <- foret.c
save(foret, orig.name, l,
     file = "Data/foret.Rdata")
write.csv(foret, file = "Data/foret.csv" )

#Load the data
load("Data/foret.Rdata")
