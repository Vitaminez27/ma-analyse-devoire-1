data <- read.csv("src/eaux.csv", header = TRUE)
View(data)

# 1 - Est-il pertinent, dans le cas présent, de recourir à une Analyse en Composantes Principales (ACP) pour réduire le nombre de variables ? Justifier.
print("1 - Oui, pour réduire la dimensionnalité. Cela peut faciliter l'analyse en éliminant le bruit et en mettant en évidence les structures sous-jacentes.")

# 2 - Est-il nécessaire de centrer-réduire les données avant de procéder à une ACP ? Justifier.
print("2 - Oui, il est généralement recommandé de centrer et de réduire les données avant de procéder à une Analyse en Composantes Principales (ACP). Cette étape, souvent appelée standardisation, est importante pour plusieurs raisons, et voici quelques ")

# dt <- data[, 6:14]
# dt <- sapply(dt, function(x) as.numeric(gsub(",", ".", x)))

# pca_result <- prcomp(dt, scale. = TRUE)
# print(summary(pca_result))

