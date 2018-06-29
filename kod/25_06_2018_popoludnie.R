# sesja popoludniowa (poniedzialek)
dane <- runif(20) # generujemy 20 losowych wartosci
dane <- round(dane, 2) # zaokraglamy do 2 miejsc po przecinku
dane

table(dane > -0.5) ## tak nie robic, bo bedzie zrozumiane jako przypisanie table(dane <-0.5)
table(dane >= -0.55)

dane != 0.88
dane == 0.88 # nie pojedynczy "=" bo wtedy przypisanie

opady <- round(rnorm(n=50, mean = 30, sd=5),1)
indeksy <- opady>30
opady[indeksy]

opady>=30 & opady<=35

opady[opady>=30 & opady<=35]
opady[opady<28 | opady>33]

indeksy <- which(opady > 30) # which zwraca numery 
opady[indeksy]
which.max(opady)
which.min(opady)
range(opady)

opady[-indeksy] # indeksowanie przez negacje (wektor *-1)
indeksy <- opady>30
opady[indeksy]
opady[!indeksy] # indeksowanie przez negacje logiczna




letters[24]
table(letters > "s")
sum(letters > "s")

letters[ 1:13*2 ]
letters[ (1:13*2)-1 ]


# zad.5.1 (ale dla domeny reanalizy NCEP/NCAR (Kalnay et al 1996))
lon <- seq(from=-25, to=40, by=2.5)
lat <- seq(from=30, to=75, by=2.5)

siatka <- expand.grid(lon, lat)
siatka
head(siatka,10)
tail(siatka)

plot(siatka)
library(mapdata)
map("world",add=T)

# 10-30E, 50-65N - ile gridow (lacznie z granicznymi )

sum(lon>=10 & lon<=30) * sum(lat>=50 & lat<=65)

rep(0, 10)
rep(x=c(0,5,7), 10)
rep(x=c(0,5,7), each=10)
a <- rep(1, times=10^6)
rep(c("ala ma kota", "ala ma kojota"), 10)



#################### RAMKI DANYCH #######################
dane <- data.frame(stacja=c("a","b","c"), 
           opad=1:3, 
           obserwator=c(T,F,NA))
data("airquality")
head(airquality)

airquality$Ozone
airquality$tc <- (airquality$Temp-32)*(5/9)
# airquality$tc <- NULL # w ten sposob usuwamy kolumne
head(airquality)

airquality$tc[1:10] # kolu
hist(airquality$tc)

airquality[ c(1,4), ] # adresowanie wierszy: wyswietli wiersz nr 1 i 4
airquality[ -1, ] # adresowanie przez negacje rowniez jest mozliwe

airquality[1:76*2, ] # tylko parzyste wiersze
airquality[ , c(2,5) ] # w ten sposob adresujemy kolumny
airquality[1:10, c(2,4)]
airquality[, "Temp"] # teoretycznie tak tez mozemy sie "dobrac" do kolumny
airquality[, c("Temp","Month")] # teoretycznie tak tez mozemy sie "dobrac" do kolumny

head(airquality)
airquality[1,3] <- NA # podmieniamy bledna wartosc na brak obserwacji

indeks <- airquality$Wind < mean(airquality$Wind, na.rm = TRUE)
# airquality$indeks <- indeks # tylko dla pokazania
airquality$Wind[indeks] <- NA
head(airquality)

indeks <- which(airquality$tc>32)
upal <- airquality[indeks,]

airquality[airquality$tc<15,] # wersja szybsza filtrowania (dla chetnych)

write.csv(upal, "upal.csv") # zapis wynikow do pliku csv
getwd() # pokazuje katalog w ktorym zapisalo



## macierz
matrix(1:12, ncol=4, byrow = T)
matrix(1:12, nrow=4, byrow = T)
x <- 1:5
y <- runif(5)
x
y
m1 <- cbind(x, y)
m2 <- rbind(x,y, x+y, x^y)

dim(m2)
t(m2)
m1
t(m1)
m1*2


class(siatka)

data(volcano)
dim(volcano)
image(1:87, 1:61,volcano, col=topo.colors(64))
contour(volcano, add=T)
persp(volcano,theta = 40, phi = 20, col="white")

head(siatka)
# 10-30E, 50-65N - ile gridow (lacznie z granicznymi )

#       
which((siatka$Var1>=10 & siatka$Var1<=30 ) & (siatka$Var2>=50 & siatka$Var2<=65))
plot(siatka)
points(siatka[which((siatka$Var1>=10 & siatka$Var1<=30 ) & 
                      (siatka$Var2>=50 & siatka$Var2<=65)),], col="red", pch=18)
map('world',add=T, lwd=2) # to wymaga pakietu maps lub mapdata
title("nasza domena obliczeniowa")
