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
d1 <- fill(d, Species, "Forest type")

#Change the variable names

# names(d)
# paste(names(d1), collapse = "', '")
orig.name <- c('Forest type', 'Species', 'Individual number', 'LT (mm)', 'LA (cm²)', 'SLA (cm2 g-1)', 'LDMC (g g-1)', 'LTD (g cm-3)', 'TDMC (g g-1)', 'TTD (g cm-3)', 'BT (mm)', 'BDMC (g g-1)', 'BTD (g cm-3)', 'SDMC (g g-1)', 'STD (g cm-3)', 'LC (mg g-1)', 'LN (mg g-1)', 'LP (mg g-1)', 'LCN', 'LCP', 'LNP', 'TC (mg g-1)', 'TN (mg g-1)', 'TP (mg g-1)', 'TCN', 'TCP', 'TNP', 'BC (mg g-1)', 'BN (mg g-1)', 'BP (mg g-1)', 'BCN', 'BCP', 'BNP', 'SC (mg g-1)', 'SN (mg g-1)', 'SP (mg g-1)', 'SCN', 'SCP', 'SNP')

new.name <- c('For.type', 'Species', 'Ind.number', 'leaf.thick', 'leaf.area', 'spec.leaf.area', 'leaf.dry.mat.cont', 'leaf.tissue.dens', 'twig.dry.mat.cont', 'twig.tis.dens', 'bark.thick', 'bark.dry.mat.cont', 'bark.tis.dens', 'stem.dry.mat.cont', 'stem.tis.dens', 'leaf.C.cont', 'leaf.N.cont', 'leaf.P.cont;', 'leaf.C.N.ratio', 'leaf.C.P.ratio', 'leaf.N.P.ratio', 'twig.C.cont', 'twig.N.cont', 'twig.P.cont', 'twig.C.N.ratio', 'twig.C.P.ratio', 'twig.N.P.ratio', 'bark.C.cont', 'bark.N.cont', 'bark.P.cont', 'bark.C.N.ratio', 'bark.C.P.ratio', 'bark.N.P.ratio', 'stem.C.content','stem.N.cont', 'stem.P.cont', 'stem.C.N.ratio', 'stem.C.P.ratio', 'stem.N.P.ratio')

#Save the data

names(d1) <- new.name
foret <- d1
save(foret, orig.name, l,
     file = "Data/foret.Rdata")
write.csv(d, file = "Data/foret.csv" )a


load("Data/foret.Rdata")
