# square_digits.rb
# PEDAC practice #9

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Welcome. In this kata, you are asked to square every digit of a number.

# For example, if we run 9119 through the function, 811181 will come out, because 92 is 81 and 12 is 1.

# Note: The function accepts an integer and returns an integer


# Data Structure
##################
# Input: integer 
# Output: integer

# Algorithm
#################
#1. Convert integer to string and split(//) into chars, then covert the array's elements back to integers with map.
#2. Transform each integer with map, squaring it.
#3. Combine the digits back into one number by converting the array's elements to strings with map and then joining the elements of the array and finally converting the final string to an integer.  

# Code
#########
def square_digits(number)
  digits_array = number.to_s.split(//).map { |el| el.to_i }
  digits_array.map! do |digit|
    digit**2
  end
  digits_array.map! { |el| el.to_s }.join.to_i
end

# Tests
p square_digits(9119) == 811181
p square_digits(0) == 0
p square_digits(111) == 111
p square_digits(2507) == 425049
