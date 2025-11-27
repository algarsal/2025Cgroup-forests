if (!dir.exists('Data')) dir.create('Data')
file <- 'https://dfzljdn9uc3pi.cloudfront.net/2025/20301/1/Data.xlsx'

download.file(file, 'Data/forest.xlsx')

readxl::excel_sheets("Data/Data.xlsx")
forest_data <- readxl::read_excel("Data/Data.xlsx", sheet = "Table S4", skip = 2)

data_description <- readxl::read_excel("Data/Data.xlsx", sheet = "Table S4", range = "A1:A1", col_names = FALSE)
#Does not work, it has to be done by hand 

