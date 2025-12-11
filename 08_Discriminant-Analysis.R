## ============================================================
##   DISCRIMINANT ANALYSIS (LDA) ON foret DATASET
## ============================================================

## 1. Load data ------------------------------------------------
load("foret.Rdata")

## Set dataset
data <- foret

## 2. Convert grouping variable -------------------------------
data$For.type <- as.factor(data$For.type)

## Remove ID variable if present
data$Ind.number <- NULL

## 3. Load MASS package ---------------------------------------
if (!require(MASS)) install.packages("MASS")
library(MASS)

## 4. Fit LDA --------------------------------------------------
lda_model <- lda(For.type ~ ., data = data)

print(lda_model)

## 5. Plot LDA -------------------------------------------------
lda_values <- predict(lda_model)

plot(lda_values$x[,1],
     col = data$For.type, pch = 19,
     xlab = "LD1", ylab = "",
     main = "LDA – Individuals on LD1")

legend("topright", legend = levels(data$For.type),
       col = 1:length(levels(data$For.type)), pch = 19)

## 6. Classification accuracy ---------------------------------
pred <- lda_values$class
print(table(Predicted = pred, Actual = data$For.type))
accuracy <- mean(pred == data$For.type)
cat("Classification accuracy:", accuracy, "\n")

## 7. Cross-validation -----------------------------------------
lda_cv <- lda(For.type ~ ., data = data, CV = TRUE)
print(table(Predicted = lda_cv$class, Actual = data$For.type))
cat("Cross-validated accuracy:", mean(lda_cv$class == data$For.type), "\n")

## ============================================================
##                     END OF PIPELINE
## ============================================================
