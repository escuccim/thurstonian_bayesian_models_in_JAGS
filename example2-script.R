example2 <- with(resume, {
require(rjags)
load.module("glm")
rankings <- cbind(mc.rank, as.rank, sw.rank)
xmat <- array(NA, c(73, 4, 3))
x.mc <- cbind(1, 0, dates.mc, degree.mc); xmat[,,1] <- x.mc
x.as <- cbind(0, 0, dates.as, degree.as); xmat[,,2] <- x.as
x.sw <- cbind(0, 1, dates.sw, degree.sw); xmat[,,3] <- x.sw
data <- list(y = rankings, x = xmat, N = 73, P = 4, K = 3)
init <- list(z = makeinits(rankings))
jags <- jags.model("thurstone-w.txt", data, init)
update(jags, 5000)
samp <- coda.samples(jags, c("beta.identified", "sigma.identified"), 1e+5)
})

# for summary statistics, try summary(example2)

# for plots of the parameter estimates and credibility intervals, try
# require(mcmcplots)
# caterplot(example2)