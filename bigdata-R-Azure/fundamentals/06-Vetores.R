# Vetores, operacoes com vetores e vetores nomeados

# Obs: caso tenha problemas com a acentuacao, consulte este link:
# http://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretoria de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorios com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()

# Vetor de strings
vetor_character = c("Data", "Science", "Academy")
vetor_character

# Vetor de floats
vetor_numerico = c(1.90, 45.3, 300.5)
vetor_numerico

# Vetor de valores complexos
vetor_complexo = c(5.2 + 3i, 3.8 + 4i)
vetor_complexo

# Vetor de valores logicos
vetor_logico = c(TRUE, FALSE, TRUE, FALSE, FALSE)
vetor_logico

# Vetor de numeros inteiros
vetor_integer = c(2, 4, 6)
vetor_integer

# Utilzando a funcao seq()
vetor1 = seq(1:10)
vetor1
is.vector(vetor1)

# Utilziando a funcao rep()
vetor2 = rep(1:5)
vetor2
is.vector(vetor2)


# Indexacao de vetores
a <- c(1,2,3,4,5)
a
a[1]
a[6]

b <- c("Data", "Sciece", "Academy")
b
b[1]
b[2]
b[3]
b[4]

## Combinando vetores
# Determinando os vetores v1 e v2
v1 = c(2,3,5)
v2 = c("aa", "bb", "cc", "dd", "ee")

# Combinando os vetores
c(v1,v2)

# Operacoes com vetores
x = c(1,3,5,7)
y = c(2,4,6,8)

x * 5
x + y
x - y
x * y
x/y

# Somando vetores com numero diferente de elementos
alfa = c(10,20,30)
beta = c(1,2,3,4,5,6,7,8,9)
alfa + beta

# Vetor nomeado
v = c("Nelson", "Mandela")  
v
names(v) = c("Nome", "Sobrenome")
v["Nome"]















