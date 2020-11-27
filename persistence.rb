# persistence.rb
# PEDAC practice #18

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.



# Data Structure
##################
# input: an integer
# output: the number of iterations/cycles of multiplying the digits of the number and then output digits of that number, etc., until the output becomes a single-digit number.


# Algorithm
###############
#1. Instantiate num_string, a variable representing the length of number as a string; count, set to 0
#2. Return 0 if the length of number is == 1
#3. Begin a loop conditioned on while output's length when converted to a string is greater than 1.
#4. Convert the number to a string, split it and convert the resulting array's elements back into integers.
#5. Instantiate/Reset the value of output to 1, which will hold the result of multiplying the digits of the number together.
#6. Multiply the array elements/digits together and assign the value to output.
#7. Update the values of num_string (output, converted to a string), num_length (length of output as a string) and count.
#8. Repeat the loop.
#9. When the loop terminates, return output.


# Code
#########
def persistence(number)
  num_string = number.to_s
  return 0 if num_string.length == 1
  count = 0

  while num_string.length > 1
    digit_arr = num_string.split(//).map(&:to_i)
    output = 1
    digit_arr.each { |num| output *= num }
    num_string = output.to_s
    num_length = num_string.length
    count += 1
  end
  count
end

# Test Cases
###############
p persistence(39) #== 3 # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

p persistence(999) #== 4 # returns 4, because 9*9*9=729, 7*2*9=126,
#                   # 1*2*6=12, and finally 1*2=2

p  persistence(4) #== 0 # returns 0, because 4 is already a one-digit number
