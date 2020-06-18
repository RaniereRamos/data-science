# Operacoes com Strings

# Obs: caso tenha problemas com a acentuacao, consulte este link:
# http://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretoria de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorios com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()

# String
texto <- "Isso é uma string!"
texto

x = as.character(3.14)
x
class(x)

# Concatenando strings  
nome = "Nelson"; sobrenome = "Mandela"
paste(nome, sobrenome)    # Funcao para concatenar tipos de dados caracter
cat(nome, sobrenome)      # Outra funcao de concatenacao

# Formatando a saida
sprintf("A %s é a nota %d", "Data Science Academy", 10)

# Extraindo parte da string
texto <- "Isso é uma string!"
substr(texto, start = 12, stop = 17)
?substr

# Contando o numero de caracteres
nchar(texto)

# Alterando a capitalizacao
tolower("Histogramas e Elementos de Dados")
toupper("Histogramas e Elementos de Dados")


## Usando o pacote stringr
library(stringr)

# Dividindo uma string em caracteres
?strsplit
strsplit("Histogramas e Elementos de Dados", NULL)

# Dividindo uma string em caracteres, apos o carater espaco
strsplit("Histogramas e Elementos de Dados", " ")


# Trabalhando com strings
string1 <- c("Esta é a primeira parte da minha string e será a primeira parte do meu vetor.
             Aqui a minha string continua, mas será trabsformada no segundo vetor")

string1

string2 <- c("Precisamos testar outras strings - @???!&$", "Análise de dados em R")
string2

# Adicionando 2 strings [concatenando]
str_c(c(string1, string2), sep = "")

# Podemos contar qunatas vezes um caracter aparece no texto
str_count(string2, "s")

# Localiza a primeira e ultima posicao em que o caracter aparece na string
str_locate_all(string2, "s")

# Substitui a primeira ocorrencia de um caracter
str_replace(string2, "\\s", "")

# Substitui todas as ocorrencias de um caracter 
str_replace_all(string2, "\\s", "")

# Detectando padroes nas strings
string1 <- "17 jan 2001"
string2 <- "1 jan 2001"
padrao <- "jan 20"
grepl(pattern = padrao, x = string1)
padrao <- "jan20"
grepl(pattern = padrao, x = string1)














































