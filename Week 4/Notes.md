# Generating Random Numbers

+ **rnorm** - generate random Normal variates with a given mean and standard deviation
+ **dnorm** - evaluate the Normal probablity density (with a given mean/SD) at a point (or vector of points)
+ **pnorm** - evaluate the cumulative distribution function for a Normal distribution
+ **rpois** - generate random Poisson variates with a given rate

# Generating Random Numbers from a Linear Model

```
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
plot(x,y)
```

Use `rbinom` if x is a binary variable

# Simulation from a Poisson model

```
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
plot(x,y)
```

# Random Sampling

The `sample` function allows us to draw randomly from a specified set of objects allowing us to sample arbitrary distributions

```
set.seed(1)
sample(1:10, 4)
sample(letters, 5)
sample(1:10) #permutation
sample(1:10, replace = TRUE) # with replacement
```

# Profiling

+ we can use `system.time()`
+ `Rprof()` starts the R profiler, `summaryRprof()` summarizes the output from `Rprof()`
+ Don't use the above both together

q
