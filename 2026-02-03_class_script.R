# Olivia East
# 2026-02-03

# Mauna loa CO2 data from NASA

url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'

co2 = read.table(file = url, col.names = c("year",
                                          "month",
                                          "decimal_date",
                                          "monthly_average",
                                          "deseasonalized",
                                          "n_days", "st_dev_days",
                                          "monthly_mean_uncertainty"))

head(co2)
summary(co2)
range(co2$decimal_date)
range(co2$monthly_average)


#plot it!

plot(monthly_average ~ decimal_date, data=co2, type = "l")
lines(deseasonalized ~ decimal_date, data = co2, col = "red")

co2$seasonal_cycle = co2$monthly_average - co2$deseasonalized
head(co2)

plot(seasonal_cycle ~ decimal_date, data = co2, type = "l")

#grab most recent 5 yrs and plot it

co2_2021to2026 = co2[co2$decimal_date > 2021,]
summary(co2_2021to2026)

plot(seasonal_cycle ~ decimal_date, data = co2_2021to2026, type = "l")

jan_anomalies = co2$seasonal_cycle[co2$month == 1]
head(jan_anomalies)

#create a data frame with monthly detrended co2 anomalies
co2_monthly_cycle = data.frame(month = seq(12), detrended_monthly_cycle = NA)

#fill in the data
co2_monthly_cycle$detrended_monthly_cycle[1] = mean(co2$seasonal_cycle[co2$month == 1])
co2_monthly_cycle$detrended_monthly_cycle[2] = mean(co2$seasonal_cycle[co2$month == 2])
co2_monthly_cycle$detrended_monthly_cycle[3] = mean(co2$seasonal_cycle[co2$month == 3])
co2_monthly_cycle$detrended_monthly_cycle[4] = mean(co2$seasonal_cycle[co2$month == 4])
co2_monthly_cycle$detrended_monthly_cycle[5] = mean(co2$seasonal_cycle[co2$month == 5])
co2_monthly_cycle$detrended_monthly_cycle[6] = mean(co2$seasonal_cycle[co2$month == 6])
co2_monthly_cycle$detrended_monthly_cycle[7] = mean(co2$seasonal_cycle[co2$month == 7])
co2_monthly_cycle$detrended_monthly_cycle[8] = mean(co2$seasonal_cycle[co2$month == 8])
co2_monthly_cycle$detrended_monthly_cycle[9] = mean(co2$seasonal_cycle[co2$month == 9])
co2_monthly_cycle$detrended_monthly_cycle[10] = mean(co2$seasonal_cycle[co2$month == 10])
co2_monthly_cycle$detrended_monthly_cycle[11] = mean(co2$seasonal_cycle[co2$month == 11])
co2_monthly_cycle$detrended_monthly_cycle[12] = mean(co2$seasonal_cycle[co2$month == 12])

co2_monthly_cycle
plot(detrended_monthly_cycle ~ month, data = co2_monthly_cycle, type = "l", col = "navyblue")

# for loops
# i = name of variable used to step through the loop, assign it to in value
# i = iterand- value that you are iterating over, marker of keeping track of which repitition you're on
# i remembers the last value

for (i in seq(4)){
    print(i)
}

sentence = c("loops", "are", "fun", "y'all")
for (word in sentence){
    print(word)
}

# Use NA to create a space to store values
# my_vector_squared = rep(NA, length(my_vector)) = more efficient

# squaring each vector 
my_vector = c(1,3,5,2,4)
n_my_vector = length(my_vector)
my_vector_squared = rep(NA,n_my_vector)

for (i in seq(n_my_vector)){
  print(paste("I'm on iteration: ",i))
    my_vector_squared[i] = my_vector[i]^2
  print(paste("my answer is: ", my_vector_squared[i]))
}
my_vector_squared

# calculate total fo a vector
# when re-running loop --> grab all of code (including intializing vector)
my_vector = c(1,3,5,2,4)
n_my_vector = length(my_vector)
my_vector_total = 0

for(i in seq(n_my_vector)){
    print(paste("before the calc:", my_vector_total))
  my_vector_total = my_vector_total + my_vector[i]
  print(paste("after the calc:", my_vector_total))
}

# my own factorial
my_vector2 = c(5,4,3,2,1)
my_vector_factorial = rep(NA, length(my_vector2))
my_vector_factorial
my_factorial_start = 6
for(i in seq(length(my_vector2))){
    print(paste("before the calc:", my_factorial_start))
  my_factorial_start = my_factorial_start * my_vector2[i]
  print(paste("after the calc:", my_factorial_start))
}

# class factorial
# summing = start with 0, product/division = start with 1
num = 5
factorial_result = 1
for(i in seq(num)){
    factorial_result = i * factorial_result
    print(factorial_result)
}
factorial_result

# time to nest these loops
# dim = don't have to program rows/columns, dimensions of the matrix
# must do a new iterand if nesting

mat = matrix(c(2, 0, 8, 3, 5, -4), nrow = 2, ncol = 3)
mat_squared = matrix(rep(NA, 6), nrow = 2, ncol = 3)
dim(mat)
for(i in seq(dim(mat)[1])){
  for(j in seq(dim(mat)[2])){
    print(paste("I'm on row: ", i, "and column:", j))
    mat_squared[i,j] = mat[i,j]^2
  }
}

mat_squared

# while loops - don't know how many times you should repeat a task (if you know how many times --> use a for loop)

x = 5
while (x > 0){
  x = x - 1
}

# fish catching game
# rnorm gives us a random number
total_catch_lb = 0
n_fish = 0
while(total_catch_lb < 50){ # keep fishing
  new_fish_weight = rnorm(n = 1, mean = 2, sd = 1)
  total_catch_lb = total_catch_lb + new_fish_weight
  n_fish = n_fish + 1
  print(paste("n fish = ", n_fish, "and new fish weight = ", new_fish_weight))
}
