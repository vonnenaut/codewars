# dashatize.rb
# PEDAC practice #19

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Given a number, return a string with dash'-'marks before and after each odd integer, but do not begin or end the string with a dash mark.

# Ex:
# dashatize(274) -> '2-7-4'
# dashatize(6815) -> '68-1-5'


# Data Structure
##################
# input: integer
# output: string with dashes inserted before and after each odd integer but not at the beginning of end of the string.


# Algorithm
###############
#1. Convert the input to a string and split it's chars into an array called char_array.
#2. Make a copy of char_array called dashatized_arr.
#2. Iterate through the second to the second-to-last chars, converting each to an integer and checking if it's odd.  If so, prepend and append a dash ('-') to the char and insert it into dashatized_arr.
#4. Return dashatized_arr


# Code
#########
def dashatize(number=0)
  number ? number.to_s.scan(/[02468]+|[13579]/).join("-") : "nil"
end

# Test Cases
###############
# p dashatize(274) == '2-7-4'
# p dashatize(6815) == '68-1-5'
# p dashatize(5311) == '5-3-1-1'
# p dashatize(974302) == '9-7-4-3-02'
# p dashatize(0) == '0'
p dashatize('') == ''
p dashatize() == '0'
# p dashatize(-1) == '1'
# p dashatize(807605509) == '80-7-60-5-5-0-9'
# p dashatize(-28369) == '28-3-6-9'
# p dashatize(39762598) == '3-9-7-62-5-9-8'
