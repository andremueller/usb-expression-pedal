# Design of a digital FIR lowpass filter
# See https://www.r-bloggers.com/fir-filter-design-and-digital-signal-processing-in-r/
# Install install.packages(c("signal"))
library(signal)

n <- 2
W <- 0.2
#f <- cheby1(n = n, Rp = 5, W = W, type = "low", plane = "z")
f <- butter(n = n, W = W, type = "low", plane = "z")
#f <- fir1(n = n, w = W, type = "low")
fr <- freqz(f, Fs = 1)
plot(fr)
plot(fr$f, abs(fr$h), type = "l")
zplane(f)
# see signal::filter

options(digits=17)
x <- rep(1,100)
plot(filter(f, x))
