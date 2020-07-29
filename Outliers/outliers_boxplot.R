# Leitura da base de dados
base = read.csv('../Bases/credit_data.csv')

#outlier idade
boxplot(base$age,outline = TRUE)
boxplot.stats(base$age)$out
outilers_age = base[base$age < 0,]

#outlier load
boxplot(base$loan,outline = TRUE)
boxplot.stats(base$loan)$out
outilers_loan = base[base$loan > 13100,]
outilers_loan

#income load
boxplot(base$income,outline = TRUE)
boxplot.stats(base$income)$out
#income_loan = base[base$income > 13100,]
#income_loan