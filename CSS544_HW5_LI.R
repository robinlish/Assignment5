#Assignment 5
library(prob)
## Part1) Central Limit Theorem: The input data consists of the sequence from 1 to 25 (1:25). Show the following three plots in a single row.
### a) Show the histogram of the densities of this distribution.
a1 <- seq(1:25)
hist(a1,prob=T)

### b) Using all samples of this data of size 2, show the histogram of the densities of the sample means.
sample_of_2 <- urnsamples(a1, 2)
xbar_sample_of_2 <- (sample_of_2$X1+sample_of_2$X2)/2
hist(xbar_sample_of_2, prob=T)

### c) Using all samples of this data of size 5, show the histogram of the densities of the sample means.
sample_of_5 <- urnsamples(a1, 5)
xbar_sample_of_5 <- apply(sample_of_5, 1, FUN=mean)
hist(xbar_sample_of_5, prob=T)

### d) Compare of means and standard deviations of the above three distributions.

mean(a1)
sd(a1)

mean(xbar_sample_of_2)
sd(xbar_sample_of_2)

mean(xbar_sample_of_5)
sd(xbar_sample_of_5)

## Part2) Central Limit Theorem
##The data in the file queries.csv contains the number of queries Google has had each day for a one year period (365 days). The data file is also available at http://kalathur.com/cs544/data/queries.csv. Use this link to read the data using read.csv function when submitting the homework.
###a) Show the histogram of the distribution of the number of queries. Compute the mean and standard deviation of the number of queries Google has had per day.
options(digits=2)
part2 <- read.csv("http://kalathur.com/cs544/data/queries.csv")
queries <- part2$queries
hist(queries)
mean(queries)
sd(queries)
length(queries)
###b) Draw 1000 samples of this data of size 5, show the histogram of the densities of the sample means. Compute the mean of the sample means and the standard deviation of the sample means.
sample2b_of_5 <- combn2(queries, 5)
st
srswor()




## Part3) Central Limit Theorem – Negative Binomial distribution
##Suppose the input data follows the negative binomial distribution with the parameters size = 5 and prob = 0.5.
###a) Generate 1000 random numbers from this distribution. Show the barplot with the proportions of the distinct values of this distribution.
part3a <- rnbinom(1000,size=5, prob=0.5)
barplot(prop.table(table(part3a)),type="h",xlab = "value",ylab = "proportion")

###b) With samples sizes of 10, 20, 30, and 40, generate the data for 5000 samples using the same distribution. Show the histograms of the densities of the sample means. Use a 2 x 2 layout.
par(mfrow = c(2,2))
samples <- 5000
xbar <- numeric(samples)
for (n in c(10, 20, 30, 40)) {
  for (i in 1:samples) {
    xbar[i] <- mean(rnbinom(n, 
                          size = 5, prob = 0.5))
  }
  
  hist(xbar, prob = TRUE, main = paste("Sample Size =", n))
  
  cat("Sample Size = ", n, " Mean = ", mean(xbar),
      " SD = ", sd(xbar), "\n")
}
par(mfrow=c(1,1))

###c) Compare of means and standard deviations of the data from a) with the four sequences generated in b).
mean(part3a)
sd(part3a)












