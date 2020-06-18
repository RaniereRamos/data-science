# Estruturas de Controle

# Obs: Caso tenha problemas com a acentuacao, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorio com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap03")
getwd()

# apply() - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versáo amigável da lapply
# vapply() - similiar a sapply, com valor de retorno modificado
# rapply() - similar a lapply()
# eapply() - gera uma lista()
# mapply() - similar ao sapply, multivariada
# by

# Se você estiver trabalhando com os obejtos:

# list, numeric, character (list / vector) => sapply ou lapply
# matrix, data.frame (agregação por coluna) => by / tapply
# Operações por linha ou operações específicas => apply

# Usando um loop
lista1 <- list(a = (1:20), b = (35:67))

# Calculando o total de cada elemento da lista com loop for
valor_a = 0
valor_b = 0

for (i in lista1$a) {
  valor_a = valor_a + i
}

for (j in lista1$b) {
  valor_b = valor_b + i
}

print(valor_a)
print(valor_b)


# Calculando cada elemento da lista com sapply
?sapply
sapply(lista1, sum)

# Aplicando funções com sapply
sapply(lista1, mean)

# apply()
?apply

x <- matrix(c(20, 13, 65, 32, 45, 12, 76, 49, 82), nr = 3, byrow = T)
x

apply(x, mean)
apply(x, 1, mean)     # Calcula a média por linha (ou por registro no dataframe)
apply(x, 2, mean)     # Calcula a média por coluna (ou por campo no dataframe)
apply(x, 1, plot)     # Plot nas informações das linhas (registros)

resultapply <- apply(x, 1, mean)
resultapply

# Aplicando apply() a um dataframe
escola <- data.frame(Aluno = c('Bob', 'Tereza', 'Marta', 'Felipe', 'Zacarias', 'Elton'),
                     Fisica = c(91, 82, 75, 97, 62, 74),
                     Matematica = c(99, 100, 86, 92, 91, 87),
                     Quimica = c(56, 72, 49, 68, 59, 77))
escola
escola$Matematica

# Calculando a média por aluno
escola$media = NA
escola

escola$media = apply(escola[ , c(2,3,4)], 1,mean)
escola
escola$media = round(escola$media)

# tapply()
?gl
tabela_basquete <- data.frame(equipe = gl(5, 5, labels = paste("Equipe", LETTERS[1:5])),
                              jogador = sample(letters, 25),
                              num_cestas = floor(runif(25, min = 0, max = 50)))

View(tabela_basquete)
summary(tabela_basquete)

# Como calcular o total de cestas por Equipe?
# tapply () vs sqldf
install.packages("sqldf")
library(sqldf)
librar
sqldf("select equipe, sum(num_cestas) from tabela_basquete group by equipe")

tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, sum)
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, mean)

#by
?by

dat <- data.frame(species = c(rep(c(1,2,3), each = 5)),
                  petal.length = c(rnorm(5, 4.5, 1),
                                   rnorm(5, 4.5, 1),
                                   rnorm(5, 5.5, 1)),
                  petal.width = c(rnorm(5, 2.5, 1),
                                  rnorm(5, 2.5, 1),
                                  rnorm(5, 4, 1)))

dat$species <- factor(dat$species)
View(dat)


by(dat, dat$species, function(x){
  # calcular o comprimento médio da pétala para cada espécie
  mean.pl <- mean(x$petal.length)
})

# lapply
?lapply

lista1 <- list(a = (1:10), b = (45:77))
lista1
lapply(lista1, sum)
sapply(lista1, sum)


# vapply
?vapply

# A função "fivenum" retorna as cinco estatísticas de Tukey (mínimo, 1º quartil, mediana, 3º quartil, máximo)
vapply(lista1, fivenum, c(Min. = 0, "1stQu." = 0, Median = 0, "3stQu." = 0, Max. = 0))


# replicate
?replicate
replicate(7, runif(10))

# mapply
?mapply
mapply(rep, 1:4, 4:1)

#rapply
?rapply

lista2 <- list(a = c(1:5), b = c(6:10))
lista2

rapply(lista2, sum)
rapply(lista2, sum, how = "list")