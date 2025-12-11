# Keep only numeric variables from your dataset
numeric_vars <- sapply(data, is.numeric)
data_numeric <- data[, numeric_vars]

# Check the first few rows
head(data_numeric)


cor_matrix <- cor(data_numeric, use = "pairwise.complete.obs")
cor_matrix


heatmap(cor_matrix, symm = TRUE, main = "Correlation Heatmap")

