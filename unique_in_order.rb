# unique_in_order.rb
# PEDAC practice #17

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.


# Data Structure
##################
# input:  a string sequence of repeated characters  
# output: an array of unique values from the input, in the same order encountered in the original.


# Algorithm
###############
#1. create an empty array, unique_arr and a variable named last_entered which is set to an empty string
#2. split the input string into chars, called char_arr
#3. iterate through char_arr and add char to unique_arr if it doesn't equal last_entered, then  assign it to last_entered and proceed to the loop's next iteration. 
#4. After termination of the loop, return unique_arr


# Code
#########
def unique_in_order(sequence)
  return [] if sequence == [] || sequence == ''
  unique_arr = []
  last_entered = ''
  seq_type = sequence.class
  element_type = sequence[0].class

  if seq_type == Array && element_type == Integer
    char_arr = sequence.map(&:to_s)
  elsif seq_type == Array && element_type == String
    char_arr = sequence
  elsif seq_type == String
    char_arr = sequence.split(//)
  end

  char_arr.each do |char|
    unique_arr << char if last_entered != char
    last_entered = char
  end

  unique_arr.map!(&:to_i) if element_type == Integer
  unique_arr.map!(&:to_s) if element_type == String
  unique_arr
end

# Test Cases
##############
p unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
p unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1,2,2,3,3])       == [1,2,3]
p unique_in_order('') == []
p unique_in_order([]) == []
p unique_in_order(['a', 'b', 'a', 'a', 'c', 'c']) == ['a', 'b', 'a', 'c']