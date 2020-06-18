# Listas, operacoes com listas e listas nomeadas

# Obs: caso tenha problemas com a acentuacao, consulte este link:
# http://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretoria de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorios com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()

# Use list() para criar listas
# Lista de strings
lista_caracter1 <- list("A", "B", "C")
lista_caracter1
lista_caracter2 <- list(c("A", "A"), "B", "C")
lista_caracter2
lista_caracter3 <- list(matrix(c("A", "A", "A", "A"), nrow = 2), "B", "C")
lista_caracter3

# Lista de numeros inteiros
lista_inteiros <- list(2,3,4)
lista_inteiros

# Lista de floats
lista_floats <- list(1.90, 45.3, 300.5)
lista_floats

# Lista de numeros complexos
lista_complexos = list(5.2 + 3i, 2.4 + 8i)
lista_complexos

# Lista de valors logicos
lista_logicos <- list(TRUE, FALSE, FALSE)
lista_logicos

# Listas compostas
lista_composta1 <- list("A", 3, TRUE)
lista_composta1

lista1 <- list(1:10, c("Zico", "Ronaldo", "Garrincha"), rnorm(10))
lista1

?rnorm

# Slicing (Fatiamento) da lista
lista1[1]
lista1[2]
lista1[[2]][1]
lista1[[2]][1] = "Monica"
lista1

# Para nomear os elementos - Listas nomeadas
names(lista1) <- c("Inteiros", "caracteres", "numericos")
lista1

vec_num <- 1:4
vec_char <- c("A", "B", "C", "D")

lista2 <- list(Numeros = vec_num, Letras = vec_char)
lista2

# Nomear os elementos diretamente
lista2 <- list(elemento1 = 3:5, elemento2 = c(7.2,3.5))
lista2

# Trabalhando com elementos específicos da lista
names(lista1) <- c("Inteiros", "Caracteres", "Numericos")
lista1

lista1$Caracteres
length(lista1$Inteiros)
lista1$Inteiros

# Verificar o comprimento da lista
length(lista1)

# Podemos extrair um elemento específico dentro de cada nível da lista
lista1$Caracteres[2]

# Mode dos elementos
mode(lista1$Numericos)
mode(lista1$Caracteres)

# Combinando 2 listas
lista3 <- c(lista1, lista2)
lista3

# Transformando um vetor em lista
v = c(1:3)
v
l = as.list(v)
l

# Unindo 2 elementos em uma lista
mat = matrix(1:4, nrow = 2)
mat
vec = c(1:9)
vec
lst = list(mat,vec)
lst



















