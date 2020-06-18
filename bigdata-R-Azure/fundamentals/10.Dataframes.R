# Operacoes com Strings

# Obs: caso tenha problemas com a acentuacao, consulte este link:
# http://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretoria de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorios com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()


# Criando um dataframe vazio
df <- data.frame()
class(df)
df

# Criando vetores vazios
nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()

df <- data.frame(c(nomes, idades, itens, codigos))
df

# Criando vetores
pais = c("Portugal", "Inglaterra", "Irlanda", "Egito", "Brasil")
nome = c("Bruno", "Thiago", "Amanda", "Bianca", "Marta")
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
codigo = c(5001, 2183, 4702, 7965, 8890)

# Criando um dataframe de diversos vetores
pesquisa = data.frame(pais, nome, altura, codigo)
pesquisa

# Adicionando um novo vetor a um dataframe existente
olhos = c("verde", "azul", "azul", "castanho", "castanho")
pesq = cbind(pesquisa, olhos)
pesq

# Informacoes sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)

# Obtendo um vetor de um dataframe
pesq$pais
pesq$nome

# Extraindo um unico valor
pesq[1,1]
pesq[3,2]

# Numero de linhas e colunas
nrow(pesq)
ncol(pesq)

# Primeiros elementos do dataframe
head(pesq)
head(mtcars,10)

# Ultimos elementos do dataframe
tail(pesq)
tail(mtcars)

# Data frames built-in do R
?mtcars
mtcars
View(mtcars)

# Filtro para um subset de dados que atendam a um criterio
pesq[altura < 1.60, ]
pesq[altura < 1.60, c('codigo', 'olhos')]
pesq

colnames(pesq) <- c("Var 1", "Var 2", "Var 3", "Var 4", "Var 5")
rownames(pesq) <- c("Obs 1", "Obs 2", "Obs 3", "Obs 4", "Obs 5")
pesq

# Carregando um arquivo csv
?read.csv
pacientes <- data.frame(read.csv(file = 'pacientes.csv', header = TRUE, sep = ","))

# Visualizando o dataset
View(pacientes)
head(pacientes)
summary(pacientes)

# Visualizando as variaveis
pacientes$Diabete
pacientes$Status

# Histograma
hist(pacientes$Idade, col = "blue", border = 'green', main = "Idade")

# Combinando dataframes
dataset_final <- merge(pesq, pacientes)
dataset_final























































