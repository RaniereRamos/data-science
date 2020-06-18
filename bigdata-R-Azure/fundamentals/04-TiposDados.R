# Tipos Basicos de Dados em R

# Obs: Caso tenha problemas com a acentuacao, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorios com espaco no nome
setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()

# Numeric - Todos os numeros criados em R sao do modo numeric
# Sao armazenados como numeros decimais (double)
num1 <- 7
num1
class(num1)
mode(num1)
typeof(num1)

num2 = 16.82
num2
mode(num2)
typeof(num2)

# Integer
# Convertemos tipo numeric para integer
is.integer(num2)
y = as.integer(num2)
x = as.integer(num1)
class(y)
class(x)
mode(y)
mode(x)
typeof(y)
typeof(x)

# Outros testes
as.integer('3.17')
as.integer("Joe")
as.integer('Joe')
as.integer(TRUE)
as.integer(FALSE)
as.integer('TRUE')

## Tipo de dados caracter
char1 = 'A'
char1
mode(char1)
class(char1)
typeof(char1)

char2 = 'cientista'
char2
mode(char2)
class(char2)
typeof(char2)

char3 = c("Data", "Science", "Academy")
char3
mode(char3)
typeof(char3)

## Tipos de dados complexos
compl = 2.5 + 4i
compl
mode(compl)
typeof(compl)

sqrt(-1)
sqrt(-1 + 0i)
sqrt(as.complex(-1))


## Tipos de dados logicos
x = 1; y = 2
z = x > y
z
class(z)

u = TRUE; v = FALSE
class(u)
u & v
u | v
!u


## Operacoes com 0
5/0
0/5


## Erros
'Joe'/5

































