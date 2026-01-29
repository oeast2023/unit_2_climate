# 2026-01-29
# Olivia East

vec = c(1, 0, 2, 1)
vec
vec[ c(T,F,T,F)]

# 1 = --> assign a value; 2 == --> is the thing on either side the same
 3 == 3
 x = 1
y = 3
x = y
x! = y
x

x %in%% vec

c(1,2,3, 4) %in% c(3,2,1)
world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
world_oceans

world_oceans[ world_oceans$avg_depth_m > 4000]
world_oceans$ocean[ world_oceans$avg_depth_m > 4000]

1 + 2 == 3
0.1 + 0.2 == 0.3
(0.1 + 0.2) - 0.3
error_threshold = 0.001
abs(0.3 - (0.1 + 0.2)) > error_threshold

# boolian operator string multiple true/false functions together
x = 7
x > 5 & x < 10

x > 5 | x %in% c(1,2,3)

# If given multi-element function, it will try to pair up the parts of it, must be the same length
vec1 = c(1,2,3)
vec2 = c(3,2,1)
vec1 == vec2

world_oceans[ (world_oceans$avg_depth_m > 4000) & world_oceans$area_km2 > 100e6, ]
vec2 = c(1,2,NA,4)
NA %in% vec2
x = NA
y = NA
x == y

# is.na evaluates NAs
is.na(vec2)
sum(is.na(vec2))

# test if else statements
num = 50
if(num < 0){
  num = num * -1
  print("I made num posiitve!")
}
num

temp = 101.4
if(temp > 98.6){
  temp_diff = (temp - 98.6)
  print(temp_diff)
 if(temp > 101){
  print("Warning! High fever!")
}}
temp

a = 200
b = 200

if(a > b){
  print("a wins!")
} else{
  print("b winds!")
}

if(a > b){
  print("a wins!")
} else if (b>a){
  print("b winds!")
} else {
  print("it's a tie!")
}