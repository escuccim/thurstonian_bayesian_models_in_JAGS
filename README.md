# "Bayesian Thurstonian models for ranking data using JAGS"

Johnson, T.R., Kuhn, K.M.

Behavior Research Methods 45, 857–872 (2013). 

https://doi.org/10.3758/s13428-012-0300-3

Published online: 29 March 2013

Issue Date September 2013

## Updates

The code provided with the supplementary materials with the paper was written for an older version of JAGS and will not run under the latest version.

Specifically the problem is that the code provided attempts to deterministically set a value for a stochastic node.

This has been addressed by replacing the deterministic assignment of 0 with a stochastic assignment using `dnorm(0, 1e5)`.

The rest of the code is unchanged.