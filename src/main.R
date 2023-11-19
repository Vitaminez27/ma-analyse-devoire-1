data <- read.csv("src/eaux.csv", header = TRUE)

norm <- function (data) {
  return((length(data) - 1) / length(data))
}

pvar <- function (data) {
  return(var(data) * norm(data))
}

psd <- function (data) {
  return(sd(data) * sqrt(norm(data)))
}

pcov <- function (x, y) {
  return(cov(x, y) * norm(x))
}

dt <- data[, 6:14]
dt <- sapply(dt, function(x) as.numeric(gsub(",", ".", x)))

pca_result <- prcomp(dt, scale. = TRUE)
print(summary(pca_result))

# 1 - Oui, pour réduire la dimensionnalité. Cela peut faciliter l'analyse en éliminant le bruit et en mettant en évidence les structures sous-jacentes.
