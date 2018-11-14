setwd("D://Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("U://Users/ls/Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("C://Users/ls/Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("j://Desktop/elementy statystyki/ElementyStatystki")

# Statystyka opisowa

# Cecha jakoœciowa ----------------------------------------

# Dane: Rodzina

load("Rodzina.RData")
attach(Rodzina)
head(Rodzina, 5)
##   Plec Rok_ur Wynik
## 1   dz   1982     2
## 2   dz   1982     2
## 3   dz   1982     2
## 4   dz   1982     1
## 5   dz   1982     1

# Szereg rozdzielczy dla zmiennej Wynik:

Liczebnosc <- table(Wynik)
Procent <- prop.table(Liczebnosc) * 100
Ocena <- cbind(Liczebnosc, Procent)
tekst <- c('bardzo dobra', 'przeciêtna', 'z³a', 'fatalna')
rownames(Ocena) <- tekst
Ocena
##              Liczebnosc    Procent
## bardzo dobra        216 17.9104478
## przeciêtna          924 76.6169154
## z³a                  58  4.8092869
## fatalna               8  0.6633499

# Wykres s³upkowy

barplot(Procent, 
        col = 1:4, 
        main = 'Ocena sytuacji materialnej', 
        ylab = 'Liczebnoœæ',
        names.arg = NA, 
        legend.text = tekst)

# Z podzia³em na ch³opców i dziewczêta

Liczebnosc <- table(Wynik, Plec)
Procent <- prop.table(Liczebnosc, 2) * 100
tekst <- c('bardzo dobra', 'przeciêtna', 'z³a', 'fatalna')
rownames(Procent) <- tekst
colnames(Procent) <- c('ch³opcy', 'dziewczêta')
Procent
##               Plec
## Wynik             ch³opcy dziewczêta
##   bardzo dobra 21.3500785 14.0597540
##   przeciêtna   73.9403454 79.6133568
##   z³a           3.6106750  6.1511424
##   fatalna       1.0989011  0.1757469

# Wykres s³upkowy

barplot(Procent,
        beside = TRUE,
        col = 1:4,
        main = 'Ocena sytuacji materialnej',
        ylab = 'Procent',
        legend.text = tekst)


# Cecha iloœciowa ----------------------------------------

# Dane: Diabetes

load("Diabetes.RData")
attach(Diabetes)
head(Diabetes, 5)
##   pregnant glucose pressure triceps insulin mass pedigree age diabetes
## 1        1      89       66      23      94 28.1    0.167  21      neg
## 2        0     137       40      35     168 43.1    2.288  33      pos
## 3        3      78       50      32      88 31.0    0.248  26      pos
## 4        2     197       70      45     543 30.5    0.158  53      pos
## 5        1     189       60      23     846 30.1    0.398  59      pos

# Szereg rozdzielczy dla zmiennej "mass"

# mass = BMI = masa / wzrost^2

# Uwaga: 18.5 - 24.99 wartoœæ prawid³owa

# Ustalony podzia³ na klasy

dane <- Diabetes
Liczebnosc <- table(cut(dane[, 6], c(10, 30, 50, 70)))
Procent <- prop.table(Liczebnosc) * 100
BMI <- cbind(Liczebnosc, Procent)
BMI
##         Liczebnosc   Procent
## (10,30]        134 34.096692
## (30,50]        253 64.376590
## (50,70]          6  1.526718

# Automatyczny podzia³ na klasy:

h <- hist(dane[, 6], plot = FALSE)
Liczebnosc <- table(cut(dane[, 6], h$breaks))
Procent <- prop.table(Liczebnosc) * 100
BMI <- cbind(Liczebnosc, Procent)
BMI
##         Liczebnosc    Procent
## (15,20]          7  1.7811705
## (20,25]         39  9.9236641
## (25,30]         88 22.3918575
## (30,35]        119 30.2798982
## (35,40]         86 21.8829517
## (40,45]         33  8.3969466
## (45,50]         15  3.8167939
## (50,55]          3  0.7633588
## (55,60]          2  0.5089059
## (60,65]          0  0.0000000
## (65,70]          1  0.2544529

# Histogram

hist(dane[, 6], main = 'BMI', xlab = '')

# Statystyki opisowe

summary(dane[, 6])
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   18.20   28.40   33.20   33.07   37.10   67.10

# œrednia
mean(dane[, 6]) 
## [1] 33.07252
# mediana
median(dane[, 6]) 
## [1] 33.2
# odchylenie standardowe
sd(dane[, 6]) 
## [1] 7.023947
# wspó³czynnik zmiennoœci
sd(dane[, 6]) / mean(dane[, 6]) * 100
## [1] 21.23801
# wspó³czynni asymetrii
library(e1071)
skewness(dane[, 6])
## [1] 0.662474
# wspó³czynnik koncentracji
library(e1071)
kurtosis(dane[, 6])
## [1] 1.5025

# Wykres ramka-w¹sy

boxplot(dane[, 6])