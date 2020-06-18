# Funções especiais

# Obs: Caso tenha problemas com a acentuacao, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorio com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap03")
getwd()

# De onde vem as funções? Pacotes (conjuntos de funções)
# Quando você inicia o RStudio, alguns pacotes são carregados por padrão

# Busca os pacotes carregados
search()

# Instala e carrega os pacotes
install.packages(c("ggvis", "tm","dplyr"))
library(ggvis)
library(tm)
library(dplyr)

search()
?require
detach(package:RSQLite)

# Lista o conteúdo dos pacotes
?ls
ls(pos = "package:tm")    # Lista todas as funções do pacote
ls(getNamespace("tm"), all.names = TRUE)   # Lista todas as funções, atributos e métodos do pacote

# Lista as funções de um pacote
install.packages("ggplot2")
library(formattable)
library(ggplot2)
lsf.str("package:tm")
lsf.str("package:formattable")
lsf.str("package:ggplot2")

# R possui um conjunto de datasets pré-instalados

library(MASS)
data()

?Nile
?lynx
head(lynx)
head(Nile)
tail(Nile)
summary(lynx)

plot(lynx)
plot(Nile)
plot(CO2)
hist(lynx)
head(CO2)
CO2$uptake
CO2$conc

# Essa função não funciona porque é necessário carregar os objetos do dataset no path
sum(uptake)

?attach

# A função attach carrega os objetos de um dataset / dataframe no path
attach(CO2)
sum(uptake)




