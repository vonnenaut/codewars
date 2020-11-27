# common_denominator.rb
# PEDAC practice #52

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code


# Problem & Examples
#####################
=begin
Given a collection of fractions represented as a 2d array, find the least common denominator of this collection and return the collection converted to the least common denominator.
=end


# Data Structure
##################
# input -- an array of arrays (2d array) of ints, each pair representing a numerator and denominator of a fraction
# output -- an array of arrays where each fraction has been converted to the least common denominator


# Algorithm
###############
=begin
* Instantiate lc_denom = 1
* Instantiate num_array << fraction_array.each do |fraction| fraction[0] end
# Instantiate denom_array similarly
# iterate through denominators and find lcd, assign it to lc_denominator
# multiply numerators by lcd and place product in fraction_array[x][0] and lcd for a denominators (fraction_array[x][1])
    # finding lcd
      take each demoninator in denom_array and get its factors, checking the smallest number to be found in each of the series
return fraction_array
=end


# Code
#########
def convertFracts(fraction_array)
  least_common_multiple = fraction_array.transpose { |x, y, z| [x, y, z] }[1].reduce(1, :lcm)
  
  fraction_array.map do |numer, denom|
    [numer*least_common_multiple/denom, least_common_multiple]
  end
end

# Test Cases
#############
p convertFracts([[1, 2], [1, 3], [1, 4]]) #== [[6, 12], [4, 12], [3, 12]]
