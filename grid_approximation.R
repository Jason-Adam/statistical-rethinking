# Variables
num_points <- 1000

# Define grid
p_grid <- seq(from = 0,
              to = 1,
              length.out = num_points)

# Define prior
prior <- rep(1, num_points)

# Compute likelihood at each value in grid
likelihood <- dbinom(6, size = 9, prob = p_grid)

# Compute product of likelihood and prior
unstandard_posterior <- likelihood * prior

# Standardize the posterior so it integrates to 1
posterior <- unstandard_posterior / sum(unstandard_posterior)

# Plot
png("imgs/grid_approximation_01.png")
plot(p_grid ,
     posterior ,
     type = "b" ,
     xlab = "probability of water" ,
     ylab = "posterior probability",
     main = "Posterior Probability")
mtext(paste(num_points, " points"))
dev.off()
