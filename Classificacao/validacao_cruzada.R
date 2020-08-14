# Leitura da base de dados
base = read.csv('credit-data.csv')

# Apaga a coluna clientid
base$clientid = NULL

# Valores inconsistentes
base$age = ifelse(base$age < 0, 40.92, base$age)

# Valores faltantes
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

# Escalonamento
base[, 1:3] = scale(base[, 1:3])

# Encode da classe
base$default = factor(base$default, levels = c(0,1))

library(caret)
controle_treinamento = trainControl(method = 'cv', number = 10)
#Essa linha e equivalente a rodar o algoritmo 30 vezes eo valor retornado sera a media dos valores
#controle_treinamento = trainControl(method = 'repeatedcv',repeats = 30, number = 10)
resultados30 = c()
for(i in 1:30){
  modelo = train(default ~ .,data = base, trControl = controle_treinamento, method ='nb')
  
  #print(modelo)
  
  precisao = modelo$results$Accuracy[2]
  print(precisao)
  resultados30 = c(resultados30,precisao)
}


for (i in 1:30) {
  cat(gsub('[.]', ',', resultados30[i])) 
  cat('\n')
}