# Estruturas de Controle

# Obs: Caso tenha problemas com a acentuacao, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorio com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap03")
getwd()

# If-Else
x = 25
if (x < 30)
{"Este número é menor que 30"}

# Chaves nao sao obrigatorias, mas altamente recomendados
if (x < 30)
   "Este número é menor que 30"

# Else
if (x < 7) {
  "Este número é menor que 7"
} else {
  "Este número não é menor que 7"
}

# Comandos podem ser aninhados
x = 7
if (x < 7) {
  "Este número é menor que 7"
} else if (x == 7) {
  "Este é o número 7"
} else {
  "Este número não é menor que 7"
}

# Ifelse
x = 5
ifelse(x < 6, "Correto!", NA)

x = 9
ifelse(x < 6, "Correto!", NA)

# Expressoes ifelse aninhadas
x = c(7,5,4)
ifelse(x < 5, "Menor que 5", ifelse(x == 5, "Igual a 5", "Maior que 5"))

# Estruturas if dentro de funcoes
func1 <- function(x,y) {
  ifelse(y < 7, x + y, "Não encontrado")
}

func1(4,2)
func1(40,7)

# Rep
rep(rnorm(10), 5)

# Repeat
x = 1
repeat {
  x = x + 3
  if (x > 99)
    break
  print(x)
}


# Loop for
for (i in 1:20) {print(i)}
for (q in rnorm(10)) {print(q)}

# Ignora alguns elementos dentro do loop
for (i in 1:22) {
  if(i == 13 | i == 15)
    next
  print(i)}

# Interromper o loop
for (i in 1:22) {
  if(i == 13)
    break
  print(i)}

# Loop While
x = 1
while (x < 5) {
  x = x + 1
  print(x)
}

# O loop while nao sera executado
y = 6
while (y < 5) {
  y = y + 10
  print(y)
}