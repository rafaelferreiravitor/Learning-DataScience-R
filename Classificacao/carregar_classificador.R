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


rfFinal = readRDS('rfFinal.rds')

previsoesRF = predict(rfFinal,newdata = base[-4])


rnaFinal = readRDS('rnaFinal.rds')

previsoesRNA = predict(rnaFinal,newdata = as.h2o(base[-4]))

                      