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
rnaFinal = readRDS('rnaFinal.rds')


previsoesRF = predict (rfFinal, newdata = base[1,-4])
previsoesRF = as.numeric(trimws(previsoesRF))

previsoesRNA = predict (rnaFinal, newdata = as.h2o( base[1,-4]))
previsoesRNA = previsoesRNA[1]
previsoesRNA = as.numeric(as.vector(previsoesRNA))


classe_0 = 0
classe_1 = 0

if (previsoesRF == 1){
  classe_1 = classe_1+1
}else{
  classe_0 = classe_0+1
}

if (previsoesRNA == 1){
  classe_1 = classe_1+1
}else{
  classe_0 = classe_0+1
}

if(classe_0 > classe_1){
  print('classe_0')
}else if(classe_0 == classe_1){
  print("empate")
}else{
  print('classe_1')
}