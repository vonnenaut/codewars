# find_it.rb
# PEDAC practice #21

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Given an array, find the integer that appears an odd number of times.  
# There will always be only one integer that appears an odd number of times.


# Data Structure
##################
# input: array of integers
# output: an integer representing the value of the array which appears an odd number of times


# Algorithm
###############
#1. instantiate an empty hash to track the number of occurrences of each value in the seq, called num_occur
#2. iterate through seq and increment hash value of array value (as key) if it exists, otherwise add it with a value of 1.
#3, find the key in the array with the max value and return it.


# Code
#########
def find_it(seq)
  num_occur = {}
  
  seq.each do |num|
    num_occur.has_key?(num) ? num_occur[num] += 1 : num_occur[num] = 1
  end

  num_occur.each do |key, value|
    return key if value.odd?
  end
end


# Test Cases
###############
p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10
