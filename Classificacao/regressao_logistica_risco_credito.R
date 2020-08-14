base = read.csv('risco-credito.csv')
# O algoritmo de regressão logistica classifica de forma binaria.
base = base[base$risco != "moderado",] 
classificador = glm(formula = risco ~ ., family = binomial, data = base)

#Para se criar um novo data frame para ser classificado é necessario fazer os seguintes passos:
historia = c('boa','ruim')
divida =  c('alta','alta')
garantias =  c('nenhuma', 'adequada')
renda =  c('acima_35','0_15')
df =  data.frame(historia, divida, garantias, renda)

probabilidades = predict(classificador, type = 'response', newdata = df)
resposta = ifelse(probabilidades > 0.5, 'baixo', 'alto')
