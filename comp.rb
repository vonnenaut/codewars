# comp.rb
# PEDAC practice #16

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Given two arrays a and b write a function comp(a, b) (compSame(a, b) in Clojure) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.


## Examples##


# Valid arrays #
# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]


# Invalid arrays #
# If we change the first number to something else, comp may not return true anymore:

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]

# comp(a,b) returns false because in b 132 is not the square of any number of a.

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]

# comp(a,b) returns false because in b 36100 is not the square of any number of a.


# Remarks #
# a or b might be [] (all languages except R, Shell). a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).

# If a or b are nil (or null or None), the problem doesn't make sense so return false.

# If a or b are empty then the result is self-evident.

# a or b are empty or not empty lists.


# Data Structure
##################
# input: two arrays
# output: boolean, true of the elements in the second array are the square of the elements in the first, false otherwise.  

# If both arrays are empty, return false.  If just one array is empty, return the string, "a or b are empty or not empty lists."


# Algorithm
###############
#1. set up a nested loop of the elements of each array.  Return false if the element from array1 squared is not equal to the corresponding element from array2.
#2. return true if loop completes without returning false.

# Code
#########
def comp(array1, array2)
  if [nil, 0].include?(array1) || [nil, 0].include?(array2)
    return false
  end

  array1.each do |item1|
    return false if array1.count(item1) != array2.count(item1**2)
  end
  array2.each do |item2|
    return false if array1.count(Math.sqrt(item2)) != array2.count(item2)
  end

  true
end


# Test Cases
##############
p comp( [121, 144, 19, 161, 19, 144, 19, 11], 
        [121, 14641, 20736, 361, 25921, 361, 20736, 361]) ==
true
p comp( [9, 5, 3, 1], [1, 9, 81, 25, 36]) ==
false
p comp( [], [] ) == true
p comp( [], nil ) == false
p comp( [2, 2, 3], [4, 9, 9] ) == false
