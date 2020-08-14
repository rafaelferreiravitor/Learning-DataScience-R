base = read.csv('house_prices.csv')

# Removendo colunas que não influenciarão na regressão
base$id = NULL
base$date = NULL
base$sqft_living15 = NULL
base$sqft_lot15 = NULL
base$sqft_above = NULL

library(caTools)

set.seed(1)

# Dividindo entre base de treinamento e base de teste
divisao = sample.split(base$price, SplitRatio = 0.70)
baseTreinamento = subset(base,divisao == TRUE)
baseTeste = subset(base,divisao == FALSE)

regressor = lm(formula = price ~ ., data = baseTreinamento)
summary(regressor)

previsoes = predict(regressor, newdata = baseTeste[-1])

# Esta linha calcula o erro pela media absoluta, subtraindo o a previsao do preço do valor esperado de forma absoluta e tirando a media desse valor
resultado = mean(abs(baseTeste[['price']] - previsoes))

#install.packages("miscTools")
library(miscTools)
#rSquared representa o quao perto os dados estão da linha
cc = rSquared(baseTeste[['price']], resid = baseTeste[['price']] - previsoes)



