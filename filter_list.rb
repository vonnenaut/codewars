# filter_list.rb  
# PEDAC practice #8

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Create a function that takes a list of non-negative integers and strings and returns a new list with the strings filtered out.

# Data Structure
##################
# Input:  array of integers and strings.
# Output: array of integers (strings are filtered out)

# Algorithm
#################
#1. Iterate through array, removing any string items.
  #a. Use select method with a block that returns only array elements whose class is 'Integer'.

# Code
#########
def filter_list(array)
  array.select { |element| element.class == Integer }
end

p filter_list([1,2,'a','b']) == [1,2]
p filter_list([1,'a','b',0,15]) == [1,0,15]
p filter_list([1,2,'aasf','1','123',123]) == [1,2,123]
