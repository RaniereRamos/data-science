# Variáveis em R

# obs: caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre as aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome
setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()

# Criando variáveis
var1 = 100
var1
mode(var1)
help("mode")
sqrt(var1)

# Podemos atribuir o valor de uma variável a outra variável
var2 = var1
var2
mode(var2)
typeof(var2)
help("typeof")

# Uma variável pode ser uma lista de elementos
var3 = c("primeiro", "segundo", "terceiro")
var3
mode(var3)

# Uma variável pode ser uma função
var4 = function(x) {x+3}
var4
mode(var4)

# Podemos também mudar o modo do dado
var5 = as.character(var1)
var5

# Atribuindo valores a objetos
x <- c(1,2,3)
x
x1 = c(1,2,3)
x1
c(1,2,3) -> y
y

assign("x", c(6.3,4,-2))
x

# Verificando o valor em uma posição específica
x[1]

# Verificar os objetos
ls()
objects()

# Remover objetos
rm(x)
x



