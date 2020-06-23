# Solution-Competition-DSA-Jun-2019
# https://www.kaggle.com/c/competicao-dsa-machine-learning-jun-2019

# Pacotes
install.packages("ranger")
install.packages("lightgbm")

library(CatEncoders)
library(ranger)
library(lightgbm)
library(mltools)
library(lubridate)
library(magrittr)
library(tidyverse)
library(data.table)

set.seed(0)

# Carrega os dados
htrans <- read_csv("data/transacoes_historicas.csv") %>% 
  rename(card = card_id)

####### Análise Exploratória ####### 

# Agrupamento por cartão
sum_htrans_id <- htrans %>%
  group_by(card) %>%
  summarise_at(vars(ends_with("_id")), n_distinct, na.rm = TRUE) 

# Sumarizando por quantidade de transações
num_amount_htrans <- htrans %>% select(card, purchase_amount, installments) %>% 
  mutate(installments_na = ifelse(installments == 999, NA, installments)) %>%
  group_by(card) %>%
  summarise(h_mean_purchase = mean(purchase_amount,na.rm = T),
            h_max_purchase = mean(purchase_amount, na.rm = T),
            h_min_purchase = mean(purchase_amount, na.rm = T),
            h_neg_purchase = sum(purchase_amount < 0, na.rm = T),
            h_pos_purchase = sum(purchase_amount > 0,nar.rm=T),
            h_mean_installments = mean(installments_na,na.rm = T),
            h_max_installments = mean(installments_na, na.rm = T),
            h_min_installments = mean(installments_na, na.rm = T),
            h_neg_installments = sum(installments_na < 0, na.rm = T),
            h_isna_installments = sum(is.na(installments_na)),
            h_pos_installments = sum(installments_na > 0,nar.rm=T)
  )

# Cria uma lista de chamadas de funções
?funs
fn <- funs(mean, sd, sum, n_distinct, .args = list(na.rm = TRUE))

# Matriz de atributos
ohe_htrans <- htrans %>%
  select(authorized_flag, starts_with("category")) %>% 
  mutate_all(factor) %>% 
  model.matrix.lm(~ . - 1, ., na.action = NULL) %>% 
  as_tibble()

# Cria uma lista de chamadas de funções
fn2 <- funs(mean, sd, min, max, sum, n_distinct, .args = list(na.rm = TRUE))

# Agrupando e Sumarizando
htrans_feats <- htrans %>%
  select(-authorized_flag, -starts_with("category"), -ends_with("_id")) %>% 
  add_count(card) %>%
  mutate(year = year(purchase_date),
         month = month(purchase_date),
         day = day(purchase_date),
         hour = hour(purchase_date)) %>% 
  select(-purchase_date) %>% 
  bind_cols(ohe_htrans) %>% 
  group_by(card) %>%
  summarise_all(fn2) %>% 
  left_join(sum_htrans_id, by = "card") %>%
  left_join(num_amount_htrans, by = "card")

# Remove os objetos para liberar memória
rm(htrans, ohe_htrans, sum_htrans_id, num_amount_htrans); gc()


####### Preparação dos Dados ####### 

# Carrega as novas transações
ntrans <- read_csv("data/novas_transacoes_comerciantes.csv") %>% 
  left_join(read_csv("data/comerciantes.csv"), by = "merchant_id", suffix = c("", "_merchant")) %>%
  rename(card = card_id)

# Agrupa e sumariza as transações
sum_ntrans_id <- ntrans %>%
  group_by(card) %>%
  summarise_at(vars(ends_with("_id")), n_distinct, na.rm = TRUE) 

# Sumarizando por quantidade de transações
num_amount_ntrans <- ntrans %>% select(card, purchase_amount, installments) %>% 
  mutate(installments_na = ifelse(installments == 999, NA, installments)) %>%
  group_by(card) %>%
  summarise(h_mean_purchase = mean(purchase_amount,na.rm = T),
            h_max_purchase = mean(purchase_amount, na.rm = T),
            h_min_purchase = mean(purchase_amount, na.rm = T),
            h_neg_purchase = sum(purchase_amount < 0, na.rm = T),
            h_pos_purchase = sum(purchase_amount > 0,nar.rm=T),
            h_mean_installments = mean(installments_na,na.rm = T),
            h_max_installments = mean(installments_na, na.rm = T),
            h_min_installments = mean(installments_na, na.rm = T),
            h_neg_installments = sum(installments_na < 0, na.rm = T),
            h_isna_installments = sum(is.na(installments_na)),
            h_pos_installments = sum(installments_na > 0,nar.rm=T)
  )

ohe_ntrans <- ntrans %>%
  select(starts_with("category"),-authorized_flag) %>% 
  mutate_all(factor) %>% 
  model.matrix.lm(~ . - 1, ., na.action = NULL) %>% 
  as_tibble()

fn2 <- funs(mean, sd, min, max, sum, n_distinct, .args = list(na.rm = TRUE))

ntrans_feats <- ntrans %>%
  select(-starts_with("category"), -starts_with("most_recent"), -contains("_id"), -authorized_flag) %>% 
  add_count(card) %>%
  mutate(year = year(purchase_date),
         month = month(purchase_date),
         day = day(purchase_date),
         hour = hour(purchase_date)) %>% 
  select(-purchase_date) %>% 
  bind_cols(ohe_ntrans) %>% 
  group_by(card) %>%
  summarise_all(fn2) %>% 
  left_join(sum_ntrans_id, by = "card") %>%
  left_join(num_amount_ntrans, by = "card")

rm(ntrans, ohe_ntrans, sum_ntrans_id, num_amount_ntrans); gc()

####### Modelagem Preditiva ####### 

# Dados de treino e de teste
tr <- read_csv("data/dataset_treino.csv") 
te <- read_csv("data/dataset_teste.csv")

tri <- 1:nrow(tr)
y <- tr$target

dat <- tr %>% 
  select(-target) %>% 
  bind_rows(te) %>%
  rename(card = card_id) %>% 
  mutate(first_active_month = ymd(first_active_month, truncated = 1),
         year = year(first_active_month),
         month = month(first_active_month),
         date_diff = as.integer(ymd("2018-02-01") - first_active_month)) %>% 
  select(-first_active_month) %>% 
  left_join(ntrans_feats, by = "card") %>% 
  left_join(htrans_feats, by = "card") %>% 
  select(-card) 

y_full_range <- c(y,rep(NA,nrow(te)))

dat$target <- y_full_range

impute_NA_values_num <- function(x, cols, type = "median"){
  
  for(l in cols){
    col_mean <- x[,l] %>% c() %>% unlist
    if(sum(is.na(x[,l])) >0 ){
      print(l)
      if(type == "mean"){
        col_mean <- mean(col_mean,na.rm = T)
      }
      if(type == "median"){
        col_mean <- median(col_mean,na.rm = T)
      }
      if(type == "max"){
        col_mean <- max(col_mean,na.rm = T)
      }
      if(type == "min"){
        col_mean <- min(col_mean,na.rm = T)
      }
      if(type == "const"){
        col_mean <- -9999
      }
      
      replace <- is.na(x[,l])
      x[replace,l] <- col_mean
    }
  }
  return(x)
}

feats <- setdiff(colnames(dat),"target")
dat <- impute_NA_values_num(dat, feats, type = "mean")

# Função para treinamento
bagging_ranger <- function(train_data, val_data, test_data, sample_ratio = c(seq(0.55,0.75,0.05)), mtry = NULL) {
  
  train_size <- nrow(train_data)
  records <- sample(x = 1:train_size, size = floor(train_size * sample(sample_ratio, 1)), replace = sample(c(TRUE,FALSE),1))
  new_data <- train_data[records, ]
  node.size <- sample(1:4, 1)
  mt <- ifelse(is.null(mtry), mtry, sample(mtry, 1))
  nt <- sample(seq(75,105,1),1)
  
  ran1 <- ranger(target ~ .,
                 min.node.size = node.size,
                 verbose = T,
                 num.trees = nt,
                 data = new_data)
  
  cat("oob r2 error: ", ran1$prediction.error, " num trees: ", nt, " min.node.size: ", node.size, " mytry ", mt , " # records: ", nrow(new_data),"\n")
  
  test_predict <- predict(ran1, test_data)$predictions
  val_predict <- predict(ran1, val_data)$predictions
  
  
  output <- list()
  output[["score"]] <- ran1$prediction.error
  output[["test_predict"]] <- test_predict
  output[["val_predict"]] <- val_predict
  return(output)
}


# Modelo
val_ind <- caret::createDataPartition(y = dat[tri,]$target, p=.2, list = T) %>% unlist

n_rounds <- 35
pred_mat <- matrix(0, nrow = n_rounds, ncol = nrow(dat[-tri,]))
val_mat <- matrix(0, nrow = n_rounds, ncol = nrow(dat[tri,][val_ind,]))


# Treinamento
oob_score <- vector()
for (i in 1:n_rounds) {
  res <- bagging_ranger(train_data = dat[tri,][-val_ind,], val_data = dat[tri,][val_ind,], test_data = dat[-tri,], mtry = floor(sqrt(ncol(dat))))
  pred_mat[i, ] <- res$test_predict
  val_mat[i, ] <- res$val_predict
  
  val_melt_ranger <- data.table(melt(val_mat[1:i,]))
  if(i==1){
    val_median_ranger <- val_melt_ranger
  } else{
    val_median_ranger <- val_melt_ranger[, .(value = median(value)), by = .(Var2)]
  }
  
  rmse <- MLmetrics::RMSE(val_median_ranger$value, y_true = y[val_ind])
  oob_score <- c(oob_score, rmse)
  cat("iteration ", i, " oob rmse ", mean(oob_score), "... \n")
}

# Previsões
pred_melt_ranger <- data.table(melt(pred_mat))
pred_median_ranger <- pred_melt_ranger[, .(value = median(value)), by = .(Var2)]
pred_mean_ranger <- pred_melt_ranger[, .(value = mean(value)), by = .(Var2)]

# Submissão
read_csv("data/sample_submission.csv") %>%  
  mutate(target = pred_median_ranger$value) %>%
  write_csv(paste0("rf_n_rounds_",n_rounds,"_score_",round(mean(oob_score), 5), ".csv"))


