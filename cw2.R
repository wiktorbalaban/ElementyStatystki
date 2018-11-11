#1
setwd("j://Desktop/elementy statystyki")
#a
Ankieta <- read.table("Ankieta.txt",header = TRUE)
attach(Ankieta)
wyniki <- table(WYNIK)
wynik <- table(WYNIK)*0.01
a <- prop.table(wyniki)
wynikSzkola <- table(SZKOLA,WYNIK)
wynikSzkola <- head(wynikSzkola, 1)
wynikSzkola
wyniki <- table(WYNIK[SZKOLA=='p'])
wyniki
