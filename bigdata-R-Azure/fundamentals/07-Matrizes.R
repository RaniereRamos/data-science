# Matrizes, operacoes com matrizes e matrizes nomeadas

# Obs: caso tenha problemas com a acentuacao, consulte este link:
# http://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretoria de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorios com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()


# Criando matrizes

# Numeros de linhas
matrix(c(1,2,3,4,5,6), nr = 2)
matrix(c(1,2,3,4,5,6), nr = 3)
matrix(c(1,2,3,4,5,6), nr = 6)

# Numero de colunas
matrix(c(1,2,3,4,5,6), nc = 2)
matrix(c(1,2,3,4), nc = 2)

# Help
?matrix

# Matrizes precisam ter um numero de elementos que seja multiplo do numero de linhas
matrix(c(1,2,3,4,5), nc = 2)

#Criando matrizes a partir de vetores e preenchendo a partir das linhas
meus_dados = c(1:10)
matrix(data = meus_dados, nrow = 5, ncol = 2, byrow = TRUE)
matrix(data = meus_dados, nrow = 5, ncol = 2)

# Fatiando a matriz
mat <- matrix(c(2,3,4,5), nrow = 2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[ ,2]


# Criando uma matriz diagonal
matriz = 1:3
matriz
diag(matriz)

# Extraindo o vetor de uma matriz diagonal
vetor = diag(matriz)
diag(vetor)

# Transposta da matriz
W <- matrix(c(2,4,8,12), nrow = 2, ncol = 2)
W
t(W)
U <- t(W)
U

# Obtendo uma matriz inversa
solve(W)

# Multiplicacao de matrizes
mat1 <- matrix(c(2,3,4,5), nrow = 2)
mat1
mat2 <- matrix(c(6,7,8,9), nrow = 2)
mat2
mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2

# Multiplicando matriz com vetor
x = c(1:4)
x
y <- matrix(c(2,3,4,5), nrow = 2)
x * y

# Nomeado a matriz
mat3 <- matrix(c("Terra", "Marte", "Saturno","Netuno"), nrow = 2)
mat3
dimnames(mat3) = list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2"))
mat3

# Identificando linhas e colunas no momento da criacao da matriz
matrix(c(1,2,3,4), nrow = 2, ncol = 2, dimnames = list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2")))

# Combinando matrizes
mat4 <- matrix(c(2,3,4,5), nrow = 2)
mat4
mat5 <- matrix(c(6,7,8,9), nrow = 2)
mat5
cbind(mat4, mat5)      # Liga as matrizes por coluna
rbind(mat4, mat5)      # Liga as matrizes por linha

# Descontruindo uma matriz
c(mat4)
























































