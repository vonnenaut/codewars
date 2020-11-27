# number.rb
# PEDAC practice #3

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent

# Problem & Examples
#####################
# There is a bus moving in the city, and it simultaneously boards and disembarks passengers at each bus stop.

# You are provided with an array of integer arrays. Each integer array has two items which represent the number of people that get onto bus (The first item) and number of people that get off the bus (The second item) at a bus stop.

# Your task is to return the number of people who are still on the bus after the last bus station (after the last array). Even though it is the last bus stop, the bus is not empty and some people are still on the bus, probably sleeping there.

# Take a look at the test cases.

# Please keep in mind that the test cases ensure that the number of people on the bus is always >= 0. So the return integer can't be negative.

# The second value in the first integer array is 0, since the bus is empty at the first bus stop.

# Data Structure
##################
# bus_stops is a 2d array, each subarray comprising of two integers representing the number of people boarding and disembarking from the bus respectively.
# number_passengers is an integer representing the total number of people on the bus at any time and will be returned as the final output value after the subarrays from all stops are processed.

# Algorithm
#################
# 1. Instantiate a local variable for the number of people on the bus and set it to zero, naming it number_passengers.
# 2. Create a loop which processes each subarray in the argument array (each subarray is a bus stop).  
  # 2a. Process the first element in each subarray by addign its value to number_passengers.
  # 2b. Process the second element in each subarray by subtracting its value from number_passengers.
# 3. Return number_passengers as the final number of people on the bus after the final stop.

# Code
#########
def number(bus_stops)
  number_passengers = 0

  bus_stops.each do |stop|
    number_passengers += stop[0]
    number_passengers -= stop[1]
  end
  number_passengers
end

p number([[10, 0], [3, 5], [5, 8]]) == 5
p number([[3, 0], [9, 1], [4, 10], [12, 2], [6, 1], [7, 10]]) == 17
p number([[3, 0], [9, 1], [4, 8], [12, 2], [6, 1], [7, 8]]) == 21
