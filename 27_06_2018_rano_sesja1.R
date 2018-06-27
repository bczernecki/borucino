# sesja poranna (sroda)
dane <- readRDS("opady.rds")
head(dane)
str(dane)
table(dane$stacja)
head(dane)


# postac waska do szerokiej:
library(tidyr)


?spread
szeroka <- spread(dane, key=stacja, value=wartosc)
head(szeroka)


# z postaci szerokiej do waskiej
pl <- read.csv("pl1.csv")
head(pl)


?gather()
waska <- gather(pl, key="miesiac", value="temperatura", I:XII)
head(waska)

library(dplyr)
spread(waska, key="miesiac", value = "temperatura") %>% head()
as.Date("1500-01-01")+1:10000



head(pl)
?lm
lm(pl$I ~ pl$rok )
model <- lm(I ~ rok, data = pl)
str(model)
coef(model)
coefficients(model)
podsumowanie <- summary(model)
podsumowanie$r.squared
resid(model)

plot(model)

# obliczmy korelacje miedzy obserwacjami a prognoza modelu:
prognoza <- predict(model, newdata = pl) 
obserwacje <- pl$I
cor(x = prognoza, y=obserwacje)
cor.test(x = prognoza, y=obserwacje)
cor(x = prognoza, y=obserwacje, method = "spearman", use = "pairwise.complete.obs")

macierz_korelacji <- cor(pl) # mozemy rowniez stworzyc macierz korelacji
image(macierz_korelacji)
