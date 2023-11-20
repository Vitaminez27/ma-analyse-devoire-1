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

# 7 - Quelles sont les variables que la deuxième composante oppose ?
cat("7 - Les variables qui s'opposent à la deuxième comparaison sont \"CA\" et \"SUL\".\n")
charges_variables <- data_acp$rotation
charges_pc2 <- charges_variables[, 2]
cat("  - En fonction de la charge de chaque variable sur cette composante : \n")
print(charges_pc2)
cat("  - En examinant ces charges, nous pouvons identifier les variables qui contribuent positivement et négativement à cette composante. Les variables dont la charge est élevée (positive ou négative) sont celles qui s'opposent le plus fortement à la deuxième composante principale.")

# 8 - Quelle est la variable qui a la plus forte contribution dans la troisième composante.
charges_pc3 <- charges_variables[, 3]
variable_max_contrib <- names(charges_pc3)[which.max(abs(charges_pc3))]
cat("8 - La variable qui a la plus forte contribution dans la troisième composante est \"", variable_max_contrib, "\"\n")
cat("  - En fonction de la charge de chaque variable sur cette composante : \n")
print(charges_pc3)

# 9 - Écrire un paragraphe (au plus 150 mots) pour résumer cette analyse.
cat("9 - L'Analyse en Composantes Principales (ACP) a été appliquée à un ensemble de données sur 57 marques d'eaux en bouteille, caractérisées par diverses variables telles que la concentration en ions (CA, MG, NA, K, SUL, NO3, HCO3, CL), le type d'eau (minérale ou de source), la gazéification (plate ou gazeuse), et la masse moyenne des ions.\n")
cat("  - Avant d'appliquer l'ACP, les données ont été centrées et réduites, une étape généralement recommandée pour éviter les biais liés à l'échelle des variables. Cette standardisation facilite également l'interprétation des résultats en rendant les charges factorielles comparables entre les variables. La masse moyenne des ions a été incluse comme variable supplémentaire dans l'ACP, car elle offre une mesure agrégée de la composition ionique de l'eau, synthétisant ainsi l'information des différentes concentrations d'ions.\n")
cat("  - Les résultats de l'ACP ont révélé que les deux premières composantes principales expliquent conjointement 76.15% de la variance totale, ce qui indique que ces deux composantes capturent une proportion significative de l'information contenue dans les données. En examinant les pourcentages de variance expliquée pour chaque composante, on a observé que la première composante principale dominait en expliquant 53.18% de la variance, suivie de près par la deuxième composante (22.98%), et la troisième composante (10.92%).\n")
cat("  - En s'appuyant sur les valeurs propres et les pourcentages de variance expliquée, trois composantes principales ont été proposées pour cette étude, car elles expliquent une part substantielle de la variance totale. Cette recommandation a été étayée par l'examen du \"scree plot,\" qui a montré une diminution significative des pourcentages de variance après la troisième composante.\n")
cat("  - En analysant les charges des variables pour la deuxième composante principale, les variables \"CA\" et \"SUL\" ont été identifiées comme s'opposant le plus fortement à cette composante.\n")
cat("  - Enfin, la variable qui a la plus forte contribution à la troisième composante principale est \"NO3\" (ions nitrates). Cette variable a une charge très élevée sur la troisième composante, indiquant qu'elle contribue de manière significative à la variance expliquée par cette composante. Cette information peut être utile pour comprendre comment la concentration d'ions nitrates influence la structure des données.\n")