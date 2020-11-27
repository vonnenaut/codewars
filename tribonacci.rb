# tribonacci.rb
# PEDAC practice #2

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent

# Problem & Examples
#####################
# Well met with Fibonacci bigger brother, AKA Tribonacci.

# As the name may already reveal, it works basically like a Fibonacci, but summing the last 3 (instead of 2) numbers of the sequence to generate the next. And, worse part of it, regrettably I won't get to hear non-native Italian speakers trying to pronounce it :(

# So, if we are to start our Tribonacci sequence with [1, 1, 1] as a starting input (AKA signature), we have this sequence:

# [1, 1 ,1, 3, 5, 9, 17, 31, ...]

# But what if we started with [0, 0, 1] as a signature? As starting with [0, 1] instead of [1, 1] basically shifts the common Fibonacci sequence by once place, you may be tempted to think that we would get the same sequence shifted by 2 places, but that is not the case and we would get:

# [0, 0, 1, 1, 2, 4, 7, 13, 24, ...]

# Well, you may have guessed it by now, but to be clear: you need to create a fibonacci function that given a signature array/list, returns the first n elements - signature included of the so seeded sequence.

# Signature will always contain 3 numbers; n will always be a non-negative number; if n == 0, then return an empty array (except in C return NULL) and be ready for anything else which is not clearly specified ;)

# If you enjoyed this kata more advanced and generalized version of it can be found in the Xbonacci kata

# *[Personal thanks to Professor Jim Fowler on Coursera for his awesome classes that I really recommend to any math enthusiast and for showing me this mathematical curiosity too with his usual contagious passion :)]*

# Input -- [signature, n], where signature is the starting series of three numbers and n is the number of elements to return.


# Data Structure
##################
# Input is an array of two elements, the first being a subarray of three integers and the second, an integer.
# Output is going to be an array of integers of length n.

# Algorithm
#################
# 1.  Instantiate an empty array variable for storing and returning the output array of integers, called 'n_sequence'.
# 2.  Instantiate local variables for 'first', 'second' and 'third', to contain the last three numbers in the sequence for creating the next number of the sequence.  Add those three values to n_sequence as its first three numbers and subtract 3 from n.
# 3. Include case statement for edge cases (none or first 3 elements)
# 4.  Begin a range loop ((1..n).each do ...) and inside it, do the following:
# 5.  Add 'first', 'second' and 'third' and assign the sum to a variable, 'current', and place the sum in 'n_sequence'.
# 6.  Assign 'first' to the value of 'second', 'second' to the value of 'third' and 'third' to the value of 'current'.  The loop begins again after this point.
# 7.  Upon completing the loop, and outside of it, implicitly return 'n_sequence'.

# Code
###########
def tribonacci(signature,n)
  n_sequence = []
  first = signature[0]
  second = signature[1]
  third = signature[2]

  case n
  when 0 then return []
  when 1 then return [signature[0]]
  when 2 then return [signature[1]]
  when 3 then return [signature[2]]
  end
  
  signature.each do |value|
    n_sequence << value
  end
  
  n -= 3
  (1..n).each do |_|
    current = first + second + third
    n_sequence << current
    first = second
    second = third
    third = current
  end
  n_sequence
end

p tribonacci([1,1,1],1) == [1]
p tribonacci([300,200,100],0) == []
p tribonacci([1,1,1],10) == [1,1,1,3,5,9,17,31,57,105]
p tribonacci([0,0,1],10) == [0,0,1,1,2,4,7,13,24,44]
p tribonacci([0,1,1],10) == [0,1,1,2,4,7,13,24,44,81]
p tribonacci([1,0,0],10) == [1,0,0,1,1,2,4,7,13,24]
p tribonacci([0,0,0],10) == [0,0,0,0,0,0,0,0,0,0]
p tribonacci([1,2,3],10) == [1,2,3,6,11,20,37,68,125,230]
p tribonacci([3,2,1],10) == [3,2,1,6,9,16,31,56,103,190]
p tribonacci([0.5,0.5,0.5],30) == [0.5,0.5,0.5,1.5,2.5,4.5,8.5,15.5,28.5,52.5,96.5,177.5,326.5,600.5,1104.5,2031.5,3736.5,6872.5,12640.5,23249.5,42762.5,78652.5,144664.5,266079.5,489396.5,900140.5,1655616.5,3045153.5,5600910.5,10301680.5]

