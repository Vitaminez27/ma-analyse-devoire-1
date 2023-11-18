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

dt <- data[, 11:14]
dt <- sapply(dt, function(x) as.numeric(gsub(",", ".", x)))

pca_result <- prcomp(dt)
print(summary(pca_result))