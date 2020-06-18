# Primeiros passos na Linguagem R

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Enconding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando em seu computador
# Não use diretórios com espaço no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap02")
getwd()

# Nome dos contributors
contributors()

# Licença
license()

# Informações sobre a sessão
sessionInfo()

# Imprimir na tela
print('Estou iniciando minha caminhada na carreira de Cientista de Dados')

# Criar gráficos
plot(1:25)

# Instalando os pacotes necessários para o projeto
install.packages("dplyr")             # (Manipulação de dados): manipulação de dados de forma rápida e consistente
install.packages("randomForest")      # (Análise Estatística): grupo de algoritmos para aprendizado de máquina
install.packages("ggplot2")           # (Visualização de dados): criação e visualização de dados
install.packages("devtools")          # (Desenvolvimento): permite a instalação de outros pacotes

# Carregar o pacote
library(ggplot2)

# Descarregar o pacote (para quando não quiser mais usar e precisar de espaço na memória)
detach(package:ggplot2)

# Se souber o nome da função
help(mean)
?mean

# Para buscar mais opções sobre uma função, use o pacote SOS
install.packages("SOS")
library(SOS)
findFn("fread")

# Se não souber o nome da função 
help.search('randomForest')
help.search('matplot')
??matplot
RSiteSearch('matplot')
example('matplot')














