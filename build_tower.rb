# build_tower.rb
# PEDAC practice #8

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Build Tower by the following given argument:
# number of floors (integer and always greater than 0).

# Tower block is represented as *
#     Ruby: returns an Array;
# Ex. 
# A tower with 3 floors
# [
#   '  *  ', 
#   ' *** ', 
#   '*****'
# ]


# Data Structure
##################
# input -- integer representing number of floors for tower
# output --  an array with each floor as a string, going from the top floor to the bottom floor of the tower (see above).

# Algorithm
###############
# 1. Instantiate sym to represent symbol being repeated for each floor (default is '*').
# 2. Instantiate an array, floors_array, which will be the final element returned.
# 3. Instantiate a variable named num_half_spaces and assign it's value to zero.
# 4. Iterate through a loop starting at the highest number (number_floors) and counting down to 1, calling this variable floor_number.
  # a. Create a string of spaces measuring half the spaces needed on the current line.
    # i.  Multiply num_half_spaces by a string containing a space (" ") and assign it to half_spaces.
    # ii. Increment num_half_spaces by 1 at the end of each iteration of the loop (i.e.e 0, 1, 2... )
  # b. Create a string of sym's by multiplying sym * ((floor_number * 2) - 1) and name it sym_string.
    # i. The first floor has 1 sym, the second 3, the 3rd 5, the 4th 7, etc.
  # c. Combine half_spaces + sym_string + half_spaces and set it to the variable name floor_string.
  # d. Add floor_string to the end of floors_array.
# 5. After the loop terminates, return the array, floors_array, as the final output.

# Code
#########
def build_tower(number_floors)
  sym = "*"
  floors_array = []
  num_half_spaces = 0

  number_floors.downto(1).each do |floor_number|
    half_spaces = " " * num_half_spaces
    sym_string = sym * ((floor_number * 2) - 1)
    floor_string = half_spaces + sym_string + half_spaces
    floors_array.unshift(floor_string)
    num_half_spaces += 1
  end
  floors_array
end

p build_tower(1) == ['*']
p build_tower(2) == [' * ', '***']
p build_tower(3) == ['  *  ', ' *** ', '*****']
