zmienna <- 1

while(zmienna>0){
  print(zmienna)
  zmienna <- zmienna-0.2
}

a <- 1
while(a>0.1){
 a <- runif(1)
 print(a)
}


# losujemy totolotka za pomoca petli while
nr_zakladu <- 0  # sprawdzmy ile totolotkow musimy puscic zanim wygramy chocby 'trojke'
kupon <- c(10, 17, 23, 26, 39, 49)
wygrana <- 0
while(wygrana<3){ # jesli bedzie >= 3 to znaczy ze wygralismy, 
  # w przeciwnym razie gramy jeszcze raz
  wynik <- sample(1:49, 6)
  razem <- c(wynik, kupon)
  wygrana <- sum(duplicated(razem))
  
  nr_zakladu <- nr_zakladu +1
  
  cat(c(nr_zakladu,"wylosowane liczby to:", wynik,"\n"))
}



#### DPLYR ####
dane <- readRDS("synop.rds")

summary(dane)

library(dplyr)
head(dane)

test <- select(dane, kod, nazwa, yy, mm, dd, hh, t2m, tot_cl)
test2 <- select(dane, -ws, -wd, -slp)
test3 <- select(dane, kod:t2m, tot_cl)
test4 <- select(dane, nazwa, kod, yy:t2m, tot_cl)
head(test4)

unique(test4$nazwa)
test <- filter(dane, nazwa=="POZ", mm>=6 & mm<=8)

zima <- filter(dane, nazwa %in% c("POZ","LOD"), mm %in% c(12,1,2))

zima$rok <- ifelse(zima$mm==12, zima$yy+1, zima$yy) # szybkie obejscie dla meteorologicznych por roku

unique(zima$nazwa)
unique(zima$mm)
table(zima$tot_cl)

filter(dane, slp<800 | slp>1100)

lato <- filter(dane, nazwa=="POZ", mm %in% c(6:8), yy>2005)
head(lato)
mean(lato$t2m)
max(lato$t2m)
min(lato$t2m)


arrange(dane, -t2m, nazwa) # sortowanie w odwrotnej kolejnosci
arrange(dane, yy,mm,dd,hh, nazwa) # sortowanie w pierwszej kolejnosci po datach, dopiero potem po nazwach stacji

# top_n() # funkcja ktora wyswietla nam top X elementow 
test1 <- arrange(dane, -ws)
test2 <- head(test1, 30)
table(test2$nazwa)




# tego nie ma:
# top_n(dane, 30, ws) %>% arrange(-ws) %>% select(nazwa) %>% table()



head(airquality)
airquality %>% head()

# ozon > 40, maj, kolumny tylko: ozon i dzien
airquality %>% 
  filter(Ozone>40) %>% 
  filter(Month==5) %>% 
  select(Ozone, Day) -> test
  

  top_n(dane, 30, ws) %>% arrange(-ws) %>% select(nazwa) 
  
  
dane %>% filter(nazwa=="POZ") %>% 
         filter(mm %in% 6:8) %>% 
         arrange(t2m) -> wynik
  
dane %>% group_by(nazwa, yy,mm) %>% summarise(sr_t2m=mean(t2m),
                                              max_t2m=max(t2m, na.rm=T),
                                              sd = sd(t2m),
                                              t2m_q90=quantile(t2m, 0.9))



