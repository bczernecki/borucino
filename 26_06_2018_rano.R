# listy jako kolejny typ obiektow R:
lista <- list(a = 1:10, 
     b = data.frame(kol1=runif(10), kol2=letters[1:10]),
     c = matrix(1:12, ncol=4))

lista$c
lista[[3]]

str(lista) # wyswietla strukture obiektu
class(lista) # wyswietla klase obiektu
# lista skladajaca sie z podlisty (w obiekcie nr 4)
lista2 <- list(a = 1:10, 
              b = data.frame(kol1=runif(10), kol2=letters[1:10]),
              c = matrix(1:12, ncol=4),
              list(a = 1:10, 
                   b = data.frame(kol1=runif(10), kol2=letters[1:10]),
                   c = matrix(1:12, ncol=4)))

str(lista2)
