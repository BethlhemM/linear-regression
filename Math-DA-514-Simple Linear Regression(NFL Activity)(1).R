install.packages("ggplot2")
install.packages("scatterplot3d")
library(scatterplot3d)
library(ggplot2)
##########################################
##########################################
library(readxl)
NFL <- read_excel("NFL.xlsx")
View(NFL)
##########################################
##########################################
x11()
p <- ggplot(data = NFL, aes(x = OPINCOME, y = VALUE))
p + geom_point() + geom_smooth(method = "lm", se = TRUE) + theme_bw()
#
x11()
p <- ggplot(data = NFL, aes(x = OPINCOME, y = VALUE))

p + geom_point() + geom_smooth(method = "lm", se = FALSE) + theme_bw()
##########################################
##########################################
# NFL Regression 
##########################################
##########################################
Y <- NFL$VALUE
x <- NFL$OPINCOME
model.lm <- lm(VALUE ~ OPINCOME, data = NFL)
coef(model.lm)
summary(model.lm)$coef
summary(model.lm)
confint(model.lm, level = 0.95)
##########################################
##########################################
################################################
################################################
# Scatterplot Matrices from the gclus Package 
# The gclus package provides options to rearrange the 
# variables so that those with higher correlations are 
# closer to the principal diagonal. It can also color 
# code the cells to reflect the size of the correlations. 
################################################
################################################
install.packages("gclus")
library(gclus)
variables <- NFL[c(3,6,7)] 
variablecorrelations <- abs(cor(variables))
cpairs(variables, order.single(variablecorrelations), panel.colors=dmat.color(variablecorrelations))
################################################
################################################


