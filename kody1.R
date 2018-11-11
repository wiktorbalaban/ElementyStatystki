# Struktury danych w programie R

# Wektory ----------------------------------------
# Umieszczamy w nich obserwowane wartości danej zmiennej.

# Tworzenie

wiek <- c(17, 18, 20, 24)
length(wiek)
## [1] 4
plec <- c('k', 'k', 'm', 'k')
wektor.logiczny <- c(TRUE, TRUE, FALSE)

# Odwołania

wiek[2]
## [1] 18
wiek[-2]
## [1] 17 20 24
wiek[c(2, 4)]
## [1] 18 24
wiek[wiek > 19]
## [1] 20 24

# Przypadki szczególne

2010:2015
## [1] 2010 2011 2012 2013 2014 2015
seq(2010, 2016, by = 2)
## [1] 2010 2012 2014 2016
rep(1:3, each = 2)
## [1] 1 1 2 2 3 3
rep(1:3, 1:3)
## [1] 1 2 2 3 3 3


# Ramki danych ----------------------------------------
# Są to odpowiedniki arkuszy danych.

# Tworzenie

dane <- data.frame(wiek, plec)
dane
##   wiek plec
## 1   17    k
## 2   18    k
## 3   20    m
## 4   24    k

# Proste funkcje

# liczba kolumn
ncol(dane)
## [1] 2

# liczba wieszy
nrow(dane)
## [1] 4

# Nazwy wierszy i kolumn

colnames(dane)
## [1] "wiek" "plec"
colnames(dane)[1] <- 'age'
colnames(dane)[2] <- 'sex'

rownames(dane)
## [1] "1" "2" "3" "4"
rownames(dane) <- c('a', 'b', 'c', 'd')

dane
##   age sex
## a  17   k
## b  18   k
## c  20   m
## d  24   k

# Odwołania

# trzeci wiersz i druga kolumna
dane[3, 2]
## [1] m
## Levels: k m

# pierwszy wiersz
dane[1, ] 
##   age sex
## a  17   k

# drugi i czwarty wiersz
dane[c(2, 4), ] 
##   age sex
## b  18   k
## d  24   k

# tylko wiersze z danymi dla kobiet
dane[dane$sex == 'k', ] 
##   age sex
## a  17   k
## b  18   k
## d  24   k

# druga kolumna
dane[, 2] 
## [1] k k m k
## Levels: k m
dane$sex
## [1] k k m k
## Levels: k m

# Usuwanie kolumn

dane$sex <- NULL
dane$sex <- c()

dane
##   age
## a  17
## b  18
## c  20
## d  24

# Uwaga: Większość danych w R przechowywana jest w postaci ramek danych.

# Listy ----------------------------------------
# Większość funkcji zwraca wynik w postaci listy.

# Tworzenie

lista <- list(name = 'Ala', plec = plec, dane = dane)

# Odwołania

lista[[2]]
## [1] "k" "k" "m" "k"
lista$plec
## [1] "k" "k" "m" "k"


# Import/Export ----------------------------------------

# ustawienie katalogu bieżącego
setwd("D://Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("U://Users/ls/Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("C://Users/ls/Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("D://Studia/ElementyStatystki")

# Dane z plików RData

load('Diabetes.RData')
head(Diabetes, 5)
##   pregnant glucose pressure triceps insulin mass pedigree age diabetes
## 1        1      89       66      23      94 28.1    0.167  21      neg
## 2        0     137       40      35     168 43.1    2.288  33      pos
## 3        3      78       50      32      88 31.0    0.248  26      pos
## 4        2     197       70      45     543 30.5    0.158  53      pos
## 5        1     189       60      23     846 30.1    0.398  59      pos

# Dane z plików tekstowych

wine <- read.table('winequality-red.txt', header = FALSE, sep = ';', dec = '.')
head(wine, 5)
##     V1   V2   V3  V4    V5 V6 V7     V8   V9  V10 V11 V12
## 1  7.4 0.70 0.00 1.9 0.076 11 34 0.9978 3.51 0.56 9.4   5
## 2  7.8 0.88 0.00 2.6 0.098 25 67 0.9968 3.20 0.68 9.8   5
## 3  7.8 0.76 0.04 2.3 0.092 15 54 0.9970 3.26 0.65 9.8   5
## 4 11.2 0.28 0.56 1.9 0.075 17 60 0.9980 3.16 0.58 9.8   6
## 5  7.4 0.70 0.00 1.9 0.076 11 34 0.9978 3.51 0.56 9.4   5

# Dane z plików csv

Demografia <- read.csv2('Demografia.csv', row.names = 1)
head(Demografia, 5)
##                Gęstość Przyrost Praca Bezrobocie Budżet Trasy Telefon
## Warszawa          3322     -4.0   331        3.2   3166   752     271
## Białystok         3046      3.8   304        9.3   1159   107     204
## Bydgoszcz         2192      0.9   307        9.9   1350   166     231
## Częstochowa       1622     -0.3   302       13.0   1852   169     133
## Gdańsk            1762      0.7   305       10.9   2925   307     155

# Zapis w formacie RData

save(Demografia, file = 'Demografia.RData')

# Zapis w formacie tekstowym

write.table(wine, "wino-red.txt")


# Obliczenia w ramkach ----------------------------------------

iris$area <- (4/5) * iris$Petal.Length * iris$Petal.Width
head(iris, 5)
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species  area
## 1          5.1         3.5          1.4         0.2  setosa 0.224
## 2          4.9         3.0          1.4         0.2  setosa 0.224
## 3          4.7         3.2          1.3         0.2  setosa 0.208
## 4          4.6         3.1          1.5         0.2  setosa 0.240
## 5          5.0         3.6          1.4         0.2  setosa 0.224


# Pomoc ----------------------------------------

?matplot