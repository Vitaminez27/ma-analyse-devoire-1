data <- read.csv("src/eaux.csv", header = TRUE)
View(data)

# 1 - Est-il pertinent, dans le cas présent, de recourir à une Analyse en Composantes Principales (ACP) pour réduire le nombre de variables ? Justifier.
print("1 - Oui, pour réduire la dimensionnalité. Cela peut faciliter l'analyse en éliminant le bruit et en mettant en évidence les structures sous-jacentes.")

# 2 - Est-il nécessaire de centrer-réduire les données avant de procéder à une ACP ? Justifier.
print("2 - Oui, il est généralement recommandé de centrer et de réduire les données avant de procéder à une ACP. Cette étape, souvent appelée standardisation, est importante pour plusieurs raisons, comme la sensibilité à l'échelle et effet des unités de mesure.")

# 3 - Quelles sont les variables à exclure de l’ACP ? Pourquoi ?
print("3 - Nous devrions exclure NOM, ACRO, PAYS, TYPE, et PG parce qu'ils ne sont pas des valeurs numériques.")

# 4 - Pour la suite du problème, la dernière variable (la masse moyenne des ions) sera considérée dans l’ACP comme “ variable supplémentaire”. Pouvez-vous argumenter ce choix ?
print("4 - La masse ionique moyenne fournit une mesure agrégée de la composition ionique de l'eau. En incluant cette variable, nous pouvons synthétiser l'information contenue dans les différentes concentrations d'ions (CA, MG, NA, K, SUL, NO3, HCO3, CL) en une seule variable, ce qui peut simplifier l'interprétation des résultats de l'ACP.")

# dt <- data[, 6:14]
# dt <- sapply(dt, function(x) as.numeric(gsub(",", ".", x)))

# pca_result <- prcomp(dt, scale. = TRUE)
# print(summary(pca_result))

