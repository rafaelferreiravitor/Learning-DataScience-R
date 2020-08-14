base = read.csv('house_prices.csv')

library(caTools)

set.seed(1)

# Dividindo entre base de treinamento e base de teste
divisao = sample.split(base$price, SplitRatio = 0.70)
baseTreinamento = subset(base,divisao == TRUE)
baseTeste = subset(base,divisao == FALSE)

regressor = lm(formula = price ~ sqft_living, data = baseTreinamento)
summary(regressor)

previsoesTreinamento = predict(regressor, newdata = baseTreinamento[6])

library(ggplot2)

ggplot() + geom_point(aes(x = baseTreinamento$sqft_living, y = baseTreinamento$price), colour = 'blue') + 
  geom_line(aes(x = baseTreinamento$sqft_living, y = previsoesTreinamento),colour = 'red') +
  ggtitle('Idade x Custo') + 
  xlab('Idade') + 
  ylab('Custo')

previsoesTeste = predict(regressor, newdata = baseTeste[6])

resultado = mean(abs(baseTeste[3] - previsoesTeste)[['price']])

install.packages("miscTools")
library(miscTools)
#rSquared representa o quao perto os dados estão da linha
cr = rSquared(baseTeste[['price']], resid = baseTeste[['price']] - previsoesTeste)

