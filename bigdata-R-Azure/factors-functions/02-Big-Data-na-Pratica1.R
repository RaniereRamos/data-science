# Big Data na Pratica 1 - Analisando a Temperatura Media nas Cidades Brasileiras

# Obs: Caso tenha problemas com a acentuacao, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador
# Nao use diretorio com espaco no nome

setwd("C:/Raniere/DSA/FCD/BigDataRAzure/Cap03")
getwd()

# Dataset: Berkeley Earth (http://berkeleyearth.org/data)
# TemperaturasGlobais.csv ~ 78 MB (zip) ~ 496 MB (unzip)
# Faca o download do arquivo zip no link abaixo e descompacte na mesmo diretorio de trabalho
# https://drive.google.com/open?id=1PpVjaCbYPmfQjNBDsT3d-sh9Hkb9NoLD

# Instalando e carregando os pacotes
# Obs: Os pacotes precisam ser instalados apenas uma vez.
# Se ja instalou em outros scripts, nao precisa instalar novamente.
install.packages("readr")
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplpot2")  
install.packages("tidtverse")

library(readr)
library(data.table)
library(dplyr)
library(ggplot2)
library(scales)

# Carregando os dados (usando um timer para comparar o tempo de carregamento com diferentes funcoes)

# Usando read.csv2()
system.time(df_teste1 <- read.csv2("TemperaturasGlobais.csv"))

# Usando o read.table()
system.time(df_teste2 <- read.table("TemperaturasGlobais.csv"))

# Usando fread()
?fread
system.time(df <- fread("TemperaturasGlobais.csv"))

# Criando subsets dos dados carregados
cidadesBrasil <- subset(df, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)            # na.omit() retira os valores missing
head(cidadesBrasil)
nrow(df)
nrow(cidadesBrasil)
dim(cidadesBrasil)

# Preparacao e organizacao

# Convertendo as datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format = '%Y-%m-%d')  # Transforma e atualiza a coluna
cidadesBrasil$Month <- month(cidadesBrasil$dt)                         # Feature engineering (coluna mes) 
cidadesBrasil$Year <- year(cidadesBrasil$dt)                           # Feature engineering (coluna ano)

# Carregando os subsets

# Palmas
plm <- subset(cidadesBrasil, City == 'Palmas')
plm <- subset(plm, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

# Curitiba
crt <- subset(cidadesBrasil, City == 'Curitiba')
crt <- subset(crt, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

# Recife
recf <- subset(cidadesBrasil, City == 'Recife')
recf <- subset(recf, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

# Construindo os plots
p_plm <- ggplot(plm, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Palmas") +
  theme(plot.title = element_text(size = 18))


p_crt <- ggplot(crt, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Curitiba") +
  theme(plot.title = element_text(size = 18))


p_recf <- ggplot(recf, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Recife") +
  theme(plot.title = element_text(size = 18))

plot(p_plm)
plot(p_crt)
plot(p_recf)












