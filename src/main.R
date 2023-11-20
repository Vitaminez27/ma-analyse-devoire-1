data <- read.csv("src/eaux.csv", header = TRUE)
View(data)

# 1 - Est-il pertinent, dans le cas présent, de recourir à une Analyse en Composantes Principales (ACP) pour réduire le nombre de variables ? Justifier.
cat("1 - Oui, pour réduire la dimensionnalité. Cela peut faciliter l'analyse en éliminant le bruit et en mettant en évidence les structures sous-jacentes.\n")

# 2 - Est-il nécessaire de centrer-réduire les données avant de procéder à une ACP ? Justifier.
cat("2 - Oui, il est généralement recommandé de centrer et de réduire les données avant de procéder à une ACP. Cette étape, souvent appelée standardisation, est importante pour plusieurs raisons, comme la sensibilité à l'échelle et effet des unités de mesure.\n")

# 3 - Quelles sont les variables à exclure de l’ACP ? Pourquoi ?
cat("3 - Nous devrions exclure NOM, ACRO, PAYS, TYPE, et PG parce qu'ils ne sont pas des valeurs numériques.\n")

# 4 - Pour la suite du problème, la dernière variable (la masse moyenne des ions) sera considérée dans l’ACP comme “ variable supplémentaire”. Pouvez-vous argumenter ce choix ?
cat("4 - La masse ionique moyenne fournit une mesure agrégée de la composition ionique de l'eau. En incluant cette variable, nous pouvons synthétiser l'information contenue dans les différentes concentrations d'ions (CA, MG, NA, K, SUL, NO3, HCO3, CL) en une seule variable, ce qui peut simplifier l'interprétation des résultats de l'ACP.\n")

# 5 - Faire une ACP. Quel pourcentage de variabilité est expliqué par les deux premières composantes ?
dt <- data[, 6:14]
data_numerique <- sapply(dt, function(x) as.numeric(gsub(",", ".", x)))
data_cr <- scale(data_numerique, center=TRUE, scale=TRUE)

data_acp <- prcomp(data_cr, scale.=TRUE)

variance_expliquee <- data_acp$sdev^2
pourcentage_var_expliquee <- variance_expliquee / sum(variance_expliquee) * 100

cat("5 - Pourcentage de variabilité expliquée par la 1ère composante :", round(pourcentage_var_expliquee[1], 2), "%\n")
cat("  - Pourcentage de variabilité expliquée par la 2ème composante :", round(pourcentage_var_expliquee[2], 2), "%\n")
cat("  - Pourcentage totale des deux première composantes est ", round(pourcentage_var_expliquee[1] + pourcentage_var_expliquee[2], 2), "%\n")

# 6 - Combien de composantes suggériez-vous pour cette étude ? Justifiez.
cat("6 - Nous pouvons proposer \"trois\" éléments pour cette étude.\n")
cat("  - Selons le valeurs propres : ", summary(data_acp)$importance[3,], "\n")
plot(data_acp, main = "Graphique des valeurs propres")
cat("  - Avec les pourcentages de variance expliquée donnés pour chaque composante principale, nous pouvons utiliser ces informations pour décider du nombre de composantes principales à retenir dans votre analyse.\n")
cat("  - Une approche courante consiste à examiner le \"scree plot\" ou le graphique de la variance expliquée cumulative afin d'identifier un \"coude\" où l'ajout de nouvelles composantes produit des rendements décroissants en termes d'explication de la variance supplémentaire.\n")
cat("  -  Dans notre cas, nous avons déjà fourni les pourcentages de variance expliquée pour chaque composante, et nous pouvons constater une nette diminution des pourcentages :\n")
cat("      * La première composante explique une part substantielle de la variance (53,18 %).\n")
cat("      * La deuxième composante contribue de manière significative (22,98 %).\n")
cat("      * La troisième composante apporte encore une contribution raisonnable (10,92 %).\n")
cat("  -  Après la troisième composante, les pourcentages commencent à diminuer rapidement, ce qui suggère des rendements décroissants en termes d'explication de la variance.\n")
cat("  -  Sur la base de ces informations, nous pourrions envisager de conserver les trois premières composantes, car elles expliquent collectivement une proportion substantielle de la variance totale (53,18 % + 22,98 % + 10,92 % = 87,08 %).\n")

charges_variables <- data_acp$rotation
print(charges_variables)
charges_pc2 <- charges_variables[, 2]
print(charges_pc2)