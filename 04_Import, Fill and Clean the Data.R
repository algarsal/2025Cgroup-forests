#import data
dir("Data")
readxl::excel_sheets("Data/Data.xlsx")
d <- readxl::read_excel("Data/Data.xlsx","Table S4",skip = 2)

l <- readxl::read_excel("Data/Data.xlsx","Table S4", range = "A1:A1",
                        col_names = FALSE)
l <- l[[1]][1]

#fill the data : Species
library(tidyr)
names(d)
d1 <- fill(d, Species)
