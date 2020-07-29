credit = read.csv('../Bases/credit_data.csv')

#install.packages('outliers')
library(outliers)

#inferior
outlier(credit$age)
#superior
outlier(credit$age,opposite = TRUE)

#inferior
outlier(credit$income)
#superior
outlier(credit$income,opposite = TRUE)


#census
census = read.csv('../Bases/census.csv')
outlier(census$age)
outlier(census$final.weight)

