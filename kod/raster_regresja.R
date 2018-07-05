# przykladowe rozwiazanie liczenia regresji
# 05/07/2018 (Bartosz Czernecki)

library(raster)
library(maps)
air <- stack("~/Pobrane/air.mon.mean.nc") # wczytanie pliku wg sciezki

ind_styczen <- which(substr(names(air),7,8)=="01") # choc na dobra sprawe wyglada to na luty

a <- air[[ind_styczen]]
plot(a)


plot(calc(a, fun=mean)) # liczenie sredniej
map('world',add=T, wrap = c(0,360))

regresja <- function(x) {
  ramka <- data.frame(x=x, y=1:length(x))
  model <- lm(x~y, data=ramka)
  wspolczynniki <- coef(model)  
  return(wspolczynniki)
}


x2 <- calc(a, regresja)
plot(x2[[2]])
map('world',add=T, wrap = c(0,360))
