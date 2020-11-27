# find_short.rb
# PEDAC practice #10

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Simple, given a string of words, return the length of the shortest word(s).

# String will never be empty and you do not need to account for different data types.


# Data Structure
##################
# input -- a string of words
# output -- an integer representing the length of the shortest word of the input string


# Algorithm
###############
# 1. parse the string, splitting it up into an array of words, word_array.
# 2. map word_array to an array containing the length of each word, called length_array.
# 3. return the min number from length_array.

# Code
#########

def find_short(string)
  string.split.map(&:length).min
end

p find_short("bitcoin take over the world maybe who knows perhaps") == 3
p find_short("turns out random test cases are easier than writing out basic ones") == 3
p find_short("lets talk about javascript the best language") == 3
p find_short("i want to travel the world writing code one day") == 1
p find_short("Lets all go on holiday somewhere very cold") == 2
