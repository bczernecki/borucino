# histogram 

hist(rnorm(1000)) # jjsldkjflsdkjflsdjlskdjf
# sdkfjslkjslkd jlk jlkj slk jlsk slk jsdgk fdlkg jdlfkjd;lfkj ;dlfgk
# jhl;dfgkjhdl;fgkj hl;dfgkj hl;dfkgjh ;ldfkgj h;ldfkgj h;ldfkg jh;ldfkg
# jhdl;fkgj h;lk

plot(1:10)
plot(2:15)
dev.off() # ta komenda 'czysci' nam okno graficzne

# 2.1:
2+2
5+10

5 +    2.5
5+2.5 # jakis komentarz
5*10


(2+3)*5
5 / 2
10%%3
10%%2
10%/%3
10%/%2
8^(1/3)
8^1/3
sqrt(8)
sin(90)
exp(10)
log(10)
?log

LOG(10)
log(10)

sin(pi)

#### ala ma kota ####
a <- 1 # operator przypisania: alt + -
(a <- 1) # zapis do obiektu i podejrzenie wyniku w konsoli

a = 5
A <- 2.5
4.5 -> A

temperatura <- 279.15
temperatura
print(temperatura)
tc <- temperatura - 273.15 # przeliczenie temperatury z K na *C
tf <- tc * 1.8 + 32
#### ala ma kojota ####
floor(tf)
ceiling(tf)
round(tf)
round(0.5)
round(1.5)
??"ceiling"

round(temperatura, digits = 1)
round(temperatura, 1)
round(digits = 1, x= temperatura)
100:105
1.5:5.5
1.25:5
0:40/4
5:-5/5

seq(from=0, to=20, by=1)
seq(from=0, to=20, by=0.98234)
seq(from=0, to=50, length.out = 10^4)
hist(runif(10^5, min=-2,max=2))
round(runif(10),1)
a <- runif(100)
table(round(a,1))

set.seed(1)
b <- runif(100)
round(b,1)
hist(rnorm(100))
hist(rnorm(100, sd=10))

?sample
sort(sample(x=1:49, 6, replace=T))

a <- 1:1048576
a <- 1:(2^33)



a <- c(1,2,3,  5)
b <- c(0:10,10:1)
c(a, b, b+20)

a
b

d <- a*b
d


sd(c(1,2,5))
# mean, min, max, quantile, table, summary
mean(d)
min(d)
max(d)
quantile(d)
table(d)
summary(d)
quantile(d, 0.99)
quantile(d, 0.90)
quantile(d, 0:10/10)

length(d)
b <- c(1:5, NA)
?sum(b)
sum(b, na.rm = T)
mean(b, na.rm=T)

A <- c("ala ma kota", "ala ma kojota", "kojot ma ale")
A <- c(A, NA)
A <- c(A, 234)
A
A*2

as.numeric(c(1:5, "0","ala ma kota"))

logiczny <- c(TRUE, FALSE)
logiczny <- c(F, T, NA)
logiczny+2


dane <- runif(20)
dane[5]
dane[ c(1,20) ]
dane[ c(1,20,1,5)]
dane[1:3]
dane[20:1]
rev(dane)

indeks <- 1:5
dane[indeks]


indeks[c(T,F,T,F,T)]

dane[-20]
dane[-c(1,10,20)]
dane[c(-1,-10,-20)]

miasta <- c("Poznan", "Borucino", "Warszawa", "Londyn", "Wroclaw")
miasta <- miasta[-4]
miasta

