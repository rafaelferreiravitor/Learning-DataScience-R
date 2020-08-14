base = read.csv('plano_saude.csv')

#correlacao entre as variáveis para avaliar se elas são fortemente relacionadas ou nao
cor(base$idade, base$custo)

# Não é necessário escalonar os atributos antes pois a função lm já faz isso automatico
regressor = lm(formula = custo ~ idade, data = base)
summary(regressor)

# y = b0 + b1 * x
b0 = regressor$coefficients[1]
b1 = regressor$coefficients[2]
cr = summary(regressor)$adj.r.squared

previsoes = predict(regressor, newdata = base[-2])

#install.packages('ggplot2')
library(ggplot2)

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') + 
  geom_line(aes(x = base$idade, y = previsoes),colour = 'red') +
  ggtitle('Idade x Custo') + 
  xlab('Idade') + 
  ylab('Custo')

idade = c(40)
df = data.frame(idade)

previsao1 = predict(regressor, newdata = df)
previsao2 = b0 + b1*40
