# Leitura da base de dados
credit = read.csv('../Bases/credit_data.csv')
credit$age = ifelse(credit$age < 0, 40.92, credit$age)

#income x age
plot(credit$income, credit$age)

#income # loan
plot(credit$income, credit$loan)


#age x loan
plot(credit$age, credit$loan)


census = read.csv('../Bases/census.csv')

#age x final weight
plot(census$age, census$final.weight)