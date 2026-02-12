calc_rolling_avg = function(data, moving_window = 5){
  result = rep(NA, length(data))
  for (i in seq(from = moving_window, to = length(result))){ # skip the elements pre-ceding the length of the moving window
    result[i] = mean(data[seq( (i - moving_window + 1), to = i )])

  }
  return(result)
}