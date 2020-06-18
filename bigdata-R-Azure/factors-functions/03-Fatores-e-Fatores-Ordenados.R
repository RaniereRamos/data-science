# Big Data na Pratica 1 - Analisando a Temperatura Media nas Cidades Brasileiras

# Obs: Caso tenha problemas com a acentuacao, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorio com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap03")
getwd()

vec1 <- c("Macho", "Femea", "Femea", "Macho", "Macho")
vec1
fac_vec1 <- factor(vec1)
class(vec1)
class(fac_vec1)

fac_vec2 <- as.factor(vec1)
class(fac_vec2)


# Variaveis categoricas nominais
# Nao existe uma orde implicita
animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre")
animais
class(animais)
fac_animais <- as.factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)

# Variaveis categoticas ordinais
# Possuem uma ordem natural
grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado"))
fac_grad
levels(fac_grad)

# Sumarizar os dados fornece uam visao geral sobre o conteudo das variveis
summary(fac_grad)
summary(grad)

vec2 <- c("M","F","F","M","M","M","F","F","M","M","M","F","F","M","M")
vec2
fac_vec2 <- as.factor(vec2)
fac_vec2
levels(fac_vec2) <- c("Femea", "Macho")      # Altera a descricao dos fatores
fac_vec2
summary(fac_vec2)
summary(vec2)

# Mais exemplos
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata

rdata = factor(data, labels = c("I", "II", "III"))
rdata

# Fatores Nao-Ordenados
set1 <- c("AA", "B", "BA", "CC", "CA", "AA", "BA", "CC", "CC")
set1

# Transformando os dados
# R apenas criou os niveis, o que nao significa que exista uma hierarquia
f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)

# Fatores Ordenados
o.set1 <- factor(set1, levels = c("CA", "BA", "AA", "CC", "B"), ordered = TRUE)

o.set1
is.ordered(o.set1)

as.numeric(o.set1)
table(o.set1)

# Fatores e Dataframes
df <- read.csv2("etnias.csv", sep = ",")
View(df)

# Variaveis do tipo fator
str(df)

# Niveis dos fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings (em ordem alfabetica)
# e agrupa as estatisticas por niveis. Agora, se fizermos sumarizacao de estatisticas, e possivel visualizar
# a contabilizacao para cada categoria
levels(df$Etnia)
summary(df$Etnia)

# Plot
# Agora se fizermos um plot, temos um boxplot para estas variaveis categoricas
plot(df$Idade ~ df$Etnia, xlab = 'Etnia', ylab = "Idade", main = "Idade por Etnia", col = "blue", lwd = 1)

# Regressao
summary(lm(Idade~Etnia, data = df))

# Convertendo uma coluna em variavel categorica, Isso criara um fator nao-ordenado
df
str(df)
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c("Solteiro", "Casado", "Divorciado"))
df
str(df)
View(df)