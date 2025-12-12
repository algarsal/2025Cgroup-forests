#Correlation between the traits

library(GGally)
ggpairs(foret, columns = 6:10,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()

# Keep only numeric variables from your dataset
load("data/foret.Rdata")
numeric_vars <- sapply(foret, is.numeric)
data_numeric <- foret[, numeric_vars]

# Check the first few rows
head(data_numeric)


cor_matrix <- cor(data_numeric, use = "pairwise.complete.obs")
cor_matrix


heatmap(cor_matrix, symm = TRUE, main = "Correlation Heatmap")

#Correlation between the traits

library(GGally)
ggpairs(foret, columns = 4:8,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()

library(GGally)
ggpairs(foret, columns = 9:13,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()

library(GGally)
ggpairs(foret, columns = 14:18,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()

library(GGally)
ggpairs(foret, columns = 19:23,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()

library(GGally)
ggpairs(foret, columns = 24:28,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()

library(GGally)
ggpairs(foret, columns = 29:33,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()

library(GGally)
ggpairs(foret, columns = 34:39,
        aes(color = For.type),
        upper = list(
          continuous = wrap("cor", size = 4)),
        lower = list(
          continuous = wrap("smooth", 
                            alpha = 0.3, size = 0.5))) +
  theme_minimal()


