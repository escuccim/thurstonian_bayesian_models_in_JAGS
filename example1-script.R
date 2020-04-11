example1 <- with(compensation, {

require(rjags)
load.module("glm")

rankings <- cbind(y1, y2, y3, y4)
    
data <- list(y = rankings, x = cbind(1, hi, hc, vi, vc), N = 116, P = 4, K = 4)
init <- list(z = makeinits(rankings))
jags <- jags.model("thurstone-b.txt", data, init)
update(jags, 5000)
samp <- coda.samples(jags, c("beta.identified", "sigma.identified"), 1e+5)
})

# for summary statistics, try summary(example1)

# for plots of the parameter estimates and credibility intervals, try
# require(mcmcplots)
# caterplot(example1)
