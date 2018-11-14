setwd("j://Desktop/elementy statystyki/ElementyStatystki")
#z1
x <- rep(c(TRUE,FALSE,TRUE,FALSE), c(3,4,2,5))
x
#z2
natur <- 1:1000
natur[seq(2, 1000, by = 2)] <- natur[seq(2, 1000, by = 2)]^(-1)
#z3
palind <- c(1:20,rep(0,10),seq(102,140,by=2),
            seq(140,102,by=-2),rep(0,10),20:1)
#z4
MojaLista <- list(
  imieINazwisko=c('Wiktor','Ba³aban'),
  PI=pi,
  wekt=seq(0.02,1,by=0.02)
  )
#z5
temp <- read.table('temp.txt')
tempNyC <- round((temp$NY_F - 32)/1.8, 2)
temp <- cbind(temp,tempNyC)
save(temp,file = 'Miasta.RData')
#z6
Cities <- read.csv2('Cities.csv')
Cities$MONTH <- NULL
Atlanta_C <- (Cities$ATLANTA - 32)/1.8
Phoenix_C <- (Cities$PHOENIX - 32)/1.8
SanDiego_C <- (Cities$SANDIEGO - 32)/1.8
load('Miasta.RData')
temp <- cbind(temp,Atlanta_C)
temp <- cbind(temp,Phoenix_C)
temp <- cbind(temp,SanDiego_C)
colnames(temp)[2] <- 'NY_C'
temp$Atlanta_C=round(temp$Atlanta_C,2)
temp$Phoenix_C=round(temp$Phoenix_C,2)
temp$SanDiego_C=round(temp$SanDiego_C,2)
temp$NY_F <- NULL
colnames(temp) <- c('Nowy York','Atlanta','Phoenix','San Diego')
save(temp,file = 'Miasta1.RData')
?legend
matplot(1:12,temp,type = 'b',lwd=2,pch=1:4,xlab='Miesiac',
        ylab='Temperatura (w stopniach C)')
legend(x='topleft',y=0,legend=colnames(temp),col=1:4,lty=1:4,lwd=2,
       pch=1:4)
