setwd("D://Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("U://Users/ls/Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("C://Users/ls/Dysk Google/DYDAKTYKA/STA/DEST_LIO/dane")
setwd("j://Desktop/elementy statystyki/ElementyStatystki")
# Regresja liniowa ----------------------------------------
# y = ax + b

# Za pomocą regresji liniowej chcemy opisać zależność pomiędzy 
# miesięcznymi dochodami w rodzinie w przeliczeniu na jedną osobę, 
# a miesięczną wartością wydatków konsumpcyjnych w rodzinie 
# w przeliczeniu na jedną osobę. Dane dotyczące tych dwóch 
# cech dla dziesięciu rodzin podane są w poniższej tabeli.

#Dochody 210 270 290 310 370 400 450 480 510 520
#Wydatki 140 190 250 270 290 310 340 360 420 390

dochody <- c(210, 270, 290, 310, 370, 400, 450, 480, 510, 520)
wydatki <- c(140, 190, 250, 270, 290, 310, 340, 360, 420, 390)

dane <- data.frame(dochody = dochody, wydatki = wydatki)
plot(dane, main = "Wykres rozrzutu")

model <- lm(wydatki ~ dochody, data = dane)
model
## Call:
## lm(formula = wydatki ~ dochody, data = dane)
##
## Coefficients:
## (Intercept)      dochody  
##     -3.5036       0.7861

# równanie regresji liniowej
# wydatki = 0.7861 * dochody - 3.5036
abline(model, col = "red")

summary(model)
## Call:
## lm(formula = wydatki ~ dochody, data = dane)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -21.577 -14.907  -5.588  17.607  29.813 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -3.5036    25.0212   -0.14    0.892    
## dochody       0.7861     0.0634   12.40 1.67e-06 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
## 
## Residual standard error: 20.63 on 8 degrees of freedom
## Multiple R-squared:  0.9505,	Adjusted R-squared:  0.9444 
## F-statistic: 153.7 on 1 and 8 DF,  p-value: 1.67e-06

# predykcja

nowy <- data.frame(dochody = 350)
predict(model, nowy)
##        1 
## 271.6309


# Regresja wielokrotna ----------------------------------------
# y = a1 * x1 + a2 * x2 + ... + ak * xk

load("auto.RData")
head(auto)
##    horsepower city.mpg peak.rpm curb.weight price
## 4         102       24     5500        2337 13950
## 5         115       18     5500        2824 17450
## 7         110       19     5500        2844 17710
## 9         140       17     5500        3086 23875
## 11        101       23     5800        2395 16430
## 12        101       23     5800        2395 16925

model <- lm(price ~ horsepower + city.mpg + peak.rpm + curb.weight, data = auto)
# lub
model <- lm(price ~ ., data = auto)
## Call:
## lm(formula = price ~ horsepower + city.mpg + peak.rpm + curb.weight, 
##    data = auto)
## 
## Coefficients:
## (Intercept)   horsepower     city.mpg     peak.rpm  curb.weight  
##  -2.171e+04    3.316e+01    8.990e+01    4.791e-01    1.022e+01

## price = 3.316e+01 * horsepower + 8.990e+01 * city.mpg 
##         + 4.791e-01 * peak.rpm + 1.022e+01 * curb.weight -2.171e+04

summary(model)
## Call:
## lm(formula = price ~ horsepower + city.mpg + peak.rpm + curb.weight, 
##    data = auto)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -8067.1 -1264.6  -181.6  1070.7 10265.3 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -2.171e+04  4.946e+03  -4.390  2.1e-05 ***
## horsepower   3.316e+01  1.438e+01   2.306   0.0224 *  
## city.mpg     8.990e+01  6.604e+01   1.361   0.1754    
## peak.rpm     4.791e-01  5.298e-01   0.904   0.3672    
## curb.weight  1.022e+01  8.731e-01  11.701  < 2e-16 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
## 
## Residual standard error: 2601 on 154 degrees of freedom
## Multiple R-squared:  0.8092,	Adjusted R-squared:  0.8042 
## F-statistic: 163.2 on 4 and 154 DF,  p-value: < 2.2e-16

# mniejszy model i predykcja

model1 <- lm(price ~ horsepower + curb.weight, data = auto)
new <- data.frame(curb.weight = 2823, horsepower = 154)
predict(model1, new)
##        1
## 16484.18