# Estruturas de Controle

# Obs: Caso tenha problemas com a acentuacao, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorio com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap03")
getwd()

# Help
?sample
args(sample)      # Apresenta os argumentos da funcao
args(mean)
args(sd)

# Funcoes Built-in
abs(-43)          # Valor absoluto
sum(c(1:5))       # Soma
mean(c(1:5))      # Media
round(c(1.1:5.8)) # Arredondar um resultado
rev(c(1:5))       # Reverter os números
seq(1:5)          # Criar uma sequência
sort(rev(c(1:5))) # Ordenar uma sequência
append(c(1:5), 6) # Adicionar mais um elemento

vec1 <- c(1.5, 2.5, 8.4, 3.7,6.3)
vec2 <- rev(vec1)
vec2

# Funcoes dentro de funcoes
plot(rnorm(10))
mean(c(abs(vec1), abs(vec2)))

# Criando funcoes
myfunc <- function(x) {x + x}
myfunc(10)
class(myfunc)

myfunc2 <- function(a, b) {
  valor = a ^ b
  print(valor)
}
myfunc2(3,2)

jogando_dados <- function() {
  num <- sample(1:6, size = 1)  #Local
  num
}

jogando_dados()

# Escopo
print(num)
num <- c(1:6)
num    # Global

# Funcoes sem numero definifo de argumentos

vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")
vec3 <- c(6.5, 9.2, 11.9, 5.1)

myfunc3 <- function(...) {
  df = data.frame(cbind(...))
  print(df)
}

myfunc3(vec1)
myfunc3(vec2, vec3)
myfunc3(vec1, vec2, vec3)

# Funcoes Built-in - Nao tente recriar a roda
# comparacao de eficiencia entre funcao vetorizada e funcao "vetorizada no R"

x <- 1:10000000

# Funcao que calcula a raiz quadrada de cada elemento de um vetor de numeros
meu_sqrt <- function(numeros) {
  resp <- numeric(length(numeros))
  for (i in seq_along(numeros)) {
    resp[i] <- sqrt(numeros[i])
  }
  return(resp)
}


system.time(x2a <- meu_sqrt(x))
system.time(x2b <- sqrt(x))

# Sua maquina pode apresentar resultado diferentepor contada precisao de calculo do processador
identical(x2a, x2b)