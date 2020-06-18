## Tipos Avancados de Dados em R

# Obs: caso tenha problemas com a acentuacao, consulte este link:
# http://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretoria de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorios com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()


## Vetores
# Vetor: possui 1 dimensao e 1 tipo de dado

vetor1 <- c(1:20)
vetor1
length(vetor1)
mode(vetor1)
class(vetor1)
typeof(vetor1)

## Matrizes
# Matriz: possui 2 dimensoes e 1 tipo de dado

matriz1 <- matrix(1:20, nrow = 2)
matriz1
length(matriz1)
mode(matriz1)
class(matriz1)
typeof(matriz1)

## Array
# Array: possui 2 ou mais dimensoes e 1 tipo de dado

array1 <- array(1:5, dim = c(3,3,3))
array1
length(array1)
mode(array1)
class(array1)
typeof(array1)

## Data Frames: dados de diferentes tipos
# Maneira mais facil de explicar data frames: uma matriz com diferentes tipos de dados

View(iris)
length(iris)
mode(iris)
class(iris)
typeof(iris)

## Listas: colecao de diferentes tipos de objetos
# Diferentes tipos de dados sao possivies e comuns

lista1 <- list(a = matriz1, b = vetor1)
lista1
length(lista1)
mode(lista1)
class(lista1)
typeof(lista1)


# Funcoes tambem sao vistas como objetos em R
func1 <- function(x){
  var1 <- x * x
  return(var1)
}

func1(5)
class(func1)


# Removendo objetos
objects()     ## Pode usar a funcao ls() tambem
rm(matriz1, vetor1)
ls()






