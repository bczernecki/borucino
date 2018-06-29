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
              d = list(a = 1:10,  # mozemy nazwac podliste (ale nie musimy)
                   b = data.frame(kol1=runif(10), kol2=letters[1:10]),
                   c = matrix(1:12, ncol=4)))

str(lista2)
lista2$d$c # mozna sie odnosic po nazwach 'podlist'
lista2[[4]][[3]] # to jest sposob bardziej uniwersalny
lista2[[4]][[3]][1,] # pierwszy wiersz

data("airquality") # wczytujemy zbior airquality
head(airquality) # wyswietlamy pierwszych 6 rzedow

colnames(airquality) # wyswietla wektor z nazwami kolumn
colnames(airquality) <- c("o3","sun","ws","t2m","mm","dd") # zmieniamy nazwy kolumn
colnames(airquality)[c(2,4)] <- c("sloneczko","ciepelko w F")
head(airquality)
# jesli mamy spacje w nazwie kolumny musimy stosowac backticks
# (zwykle tam gdzie tylda na klawiaturze)
airquality$`ciepelko w F` 

##############################################
#### WCZYT I ZAPIS PLIKOW - ROZDZIAL 5. #### 
#### (enwo.pl/przetwarzanie)
#### Zapis danych ####
write.table(x = ogrody_d, file = "ogrody.txt", row.names = F, sep="\t", eol = "\r\n")
saveRDS(object = ogrody_d, file = "ogrody.rds")
#write.table(x = ogrody_d, file = "/home/bartosz/Desktop/ogrody.txt", row.names = F, sep="\t") # z podaniem sciezki

save.image("wszystko.RData")
load("wszystko.RData")

save(ogrody_d, file = "ogrody.Rdata")
save("ogrody_d", "polanka_d", file = "ogrody_polanka.Rdata")



#### ROZDZIAŁ 6 - PETLE ####

wynik <- NULL
moje <- sort(sample(1:49,6))
licz <- NULL

for(i in 1:10^5){
  a <- sort(sample(1:49, 6))
  wynik <- rbind(wynik, a)
  
  iletrafien <- sum(ifelse(match(moje, a)>0, 1, 0), na.rm=T)
  licz <- c(licz, iletrafien)
  
}

barplot(table(licz))


for(i in c(3.5,5,20)){
  print(i)
}

for(i in c("borucino","warszawa","suwalki")){
  print(i)
}

pliki <- dir(pattern="txt", recursive = F)

for(i in pliki){
  print(i)
  read.csv(i)
}

# zadania z petlami:
dane <- read.csv("pl1.csv")
head(dane)


par(mfrow=c(3,4)) # dzieli ekran wykresow na macierz 3x4

  for(i in 2:13){
    plot(dane[,1], dane[,i], xlab=colnames(dane)[i], type='l', 
         ylab="temperatura", main=colnames(dane)[i])
}



for(stacja in c("Poznań", "Łeba")){
  for(rok in c(2016,2017)){
    for(miesiac in 1:12){
      
      calosc <- paste(stacja, rok, miesiac) # funkcja paste "zlacza" ciagi tekstowe 
      print(calosc)
      
    } # ten nawias domyka petle dla zmiennej `miesiac`
  } # ten nawias domyka petle dla zmiennej `rok`
} # ten nawias domyka petle dla zmiennej `stacja`


pliki <- dir() # pobieramy nazwy plikow
calosc <- NULL

for(i in pliki){
  tmp <- read.table(i, header = F, sep = "\t")
  wynik <- cbind(tmp, i)
  colnames(wynik) <- c("data","value1","value2","value3","kod")

  calosc <- rbind(calosc, wynik)
  print(i)
}

