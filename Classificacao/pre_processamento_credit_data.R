#F1 serve para abrir o help
base = read.csv('credit-data.csv') #importa a base
base$clientid = NULL #elimina um atributo da base
summary(base) #resume informação da base como max, min, mean, median, 1st qu, 3st qua
idade_invalida = base[base$age < 0 & !is.na(base$age), ] #filtra a base de acordo com a regra. O segundo parametro são as colunas que voce deseja (por exemplo 1:2). O is.na confere se o valor esta preenchido ou nao

##solução para retirar valores inconsistentes da tabela

#apagar a coluna inteira
base$age = NULL

#apagar somente os registros com problema
base = base[base$age > 0 & !is.na(base$age), ]

#preencher os dados manualmente
mean(base$age,na.rm = TRUE) #remove os valores faltantes

#substituir dados invalidos pela media dos demais
base$age = ifelse( base$age < 0 | is.na(base$age) , 40.92 , base$age) #o primeiro parametro do ielse e a condição, o segundo é o "se" e o terceiro "se nao"


#escalonamento dos atributos
base[,1:3] = scale(base[,1:3]) #scale utiliza a padronização para escalonar os valores e permitir a aplicação de algoritmos baseados em distancia


install.packages('caTools') #instalação
library(caTools) #import

#Dividindo a base em teste e treinamento
set.seed(1)
divisao = sample.split(base$default, SplitRatio = 0.75) #função para dividir a base de dados dados em treinamento e teste (nesse caso 75% sera para treinamento e 25% para teste) e isso irá gerar um vetor de true ou false dizendo se uma posicao pertence a base de treinamento ou nao
base_treinamento = subset(base,divisao == TRUE) # essa função irá filtrar a base de acordo com a condição do vetor divisao 
base_teste = subset(base,divisao == FALSE) 
