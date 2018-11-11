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
  imieINazwisko=c('Wiktor','Bałaban'),
  PI=pi,
  wekt=seq(0.02,1,by=0.02)
  )
#z5
