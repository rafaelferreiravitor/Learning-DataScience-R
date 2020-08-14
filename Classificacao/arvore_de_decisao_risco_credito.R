base = read.csv("risco-credito.csv")

install.packages("rpart")
library(rpart)
classificador = rpart(formula = risco ~ ., data = base, control = rpart.control(minbucket = 1)) # risco é o atributo classe e o ponto representa todos atributos previsores. O segundo paremetro "base" representa todos registros dessa base de dados. O terceiro parametro serve para forçar uma arvore de decisao ser criada independente da quantidade de registros
print(classificador)
plot(classificador)
text(classificador)



install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(classificador)

#Para se criar um novo data frame para ser classificado é necessario fazer os seguintes passos:
historia = c('boa','ruim')
divida =  c('alta','alta')
garantias =  c('nenhuma', 'adequada')
renda =  c('acima_35','0_15')
df =  data.frame(historia, divida, garantias, renda)

previsoes = predict(classificador, newdata = df)
print(previsoes)
