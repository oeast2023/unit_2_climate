# East 2026-02-10
# Repeating line of code 3 times or more = use loop or function
# Return = whatever the function will spit out once its done
# Good to name function a verb
# In parenthesis = put required parameters 
# Last line of coe in function = state value (answer) or use return b/c last thing in function is what you want to return

x = c(1,2,3,4)
mean(x)

avg = function(x){
  s = sum(x)
  n = length(x)
  answer = s/n
  return(answer)
}
avg(x)

avg(seq(from = 3,to = 500))

# Assumes that you want the arithmetic means
# Parameters that have an equal sign after them = has a default (don't need to supply info for it)
# Order of parameter is important
# Be super clear about what the function is doing
# ! = opposite
# Write many error funcitons for checks

# This function will calculate the arithmetic mean by defalut
# Otherwise it calculates the geometric mean
avg = function(x, arithmetic = TRUE){
  if(!is.numeric(x)){
    stop("Error: x isn't numeric, you dummy")
  }
  
  if(arithmetic){
    result = sum(x) / length(x)
  } else if (arithmetic == FALSE){ # assume user watns a geometric mean
  result = prod(x)^(1/length(x))
  } else {
    print("Unclear if you wanted an arithmetic mean")
  }
  return(result)
}

avg(x)
avg(x, arithmetic = F)
avg(arithmetic = F, x = seq(from = 5, to = 13))
avg(FALSE, seq(from = 5, to = 13))
avg(x, TRUE)

avg("hi")


# NASA glboal temp index
# Each data point separated by white space --> use sep = ""

url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'

temp_anomaly = read.delim(file = url, skip = 5, sep = "", header = FALSE,
                          col.names = c("Year", "No_Smoothing", "Lowess_5"))
tail(temp_anomaly)
summary(temp_anomaly)

temp_1998 = temp_anomaly$No_Smoothing[temp_anomaly$Year == 1998]
temp_2012 = temp_anomaly$No_Smoothing[temp_anomaly$Year == 2012]


plot(No_Smoothing ~ Year, data = temp_anomaly, ylab = "Global Temp Anomaly * C")
lines(No_Smoothing ~ Year, data = temp_anomaly)
lines(Lowess_5 ~ Year, data = temp_anomaly, col = "red")
abline(v = 1998, lty = "dashed")
abline(v = 2013, lty = "dashed")
lines(x = c(1998, 2012), y = c(temp_1998, temp_2012), col = "blue", lwd = 3)

# Make a user defined function to calculate the rolling average
# Moving window = 5 means there are 5 rows
# Add 1 if i = moving_window = 0

# Testing temporary variables
# data = seq(1,20)
# i = 10
# moving_window = 5
calc_rolling_avg = function(data, moving_window = 5){
  result = rep(NA, length(data))
  for (i in seq(from = moving_window, to = length(result))){ # skip the elements pre-ceding the length of the moving window
    result[i] = mean(data[seq( (i - moving_window + 1), to = i )])

  }
  return(result)
}

head(temp_anomaly)
temp_anomaly$avg_5_yr = calc_rolling_avg(temp_anomaly$No_Smoothing)
temp_anomaly$avg_10_yr = calc_rolling_avg(temp_anomaly$No_Smoothing, moving_window = 10)
head(temp_anomaly)
tail(temp_anomaly)

plot(No_Smoothing ~ Year, data = temp_anomaly, type = "l")
lines(avg_5_yr ~ Year, data = temp_anomaly, col = "red", lwd = 2)
lines(avg_10_yr ~ Year, data = temp_anomaly, col = "green", lwd = 2)

# Top of my ice core script
source("my_functions.r")

# Exercise 7.1
grade_percentage = 80

calc_grade_letter = function(grade_percentage){
  if(grade_percentage >= 90){
    print("A")
    letter = "A"
    else if(grade_percentage < 90 & >= 80)
        print("B")
    letter = "B"
  }
}
