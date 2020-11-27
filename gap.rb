# gap.rb
# PEDAC practice #22

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code


# Problem & Examples
#####################
# The prime numbers are not regularly spaced. For example from 2 to 3 the gap is 1. From 3 to 5 the gap is 2. From 7 to 11 it is 4. Between 2 and 50 we have the following pairs of 2-gaps primes: 3-5, 5-7, 11-13, 17-19, 29-31, 41-43

# A prime gap of length n is a run of n-1 consecutive composite numbers between two successive primes (see: http://mathworld.wolfram.com/PrimeGaps.html).

# We will write a function gap with parameters:

# g (integer >= 2) which indicates the gap we are looking for

# m (integer > 2) which gives the start of the search (m inclusive)

# n (integer >= m) which gives the end of the search (n inclusive)

# In the example above gap(2, 3, 50) will return [3, 5] or (3, 5) or {3, 5} which is the first pair between 3 and 50 with a 2-gap.

# So this function should return the first pair of two prime numbers spaced with a gap of g between the limits m, n if these numbers exist otherwise nil or null or None or Nothing (depending on the language).


# Data Structure
##################
# input: 
          # g (>= 2): integer indicating the gap we are looking for (# of spaces between prime numbers)
          # m (> 2):  start of the search (inclusive) 
          # n (>= m): end of search (inclusive)

# output: an array with two integers representing the first two primes whose gap is g.  If no such pair exists, nil is returned.


# Algorithm
###############
#1. instantiate an empty array to house the two consecutive primes were looking for, named output_arr.
#2. Iterate a range starting at m and ending at n, inclusive, and test each number to see whether it is a prime.  Assign the first prime found to first_prime and then test for the next prime, assigning it to next_prime.
#3. Take the difference between first_prime and next_prime and if == g, return an array containing both.  Otherwise, assign first_prime to next_prime and search the range from first_prime to n, assigning the next prime found to next_prime and checking the difference again with the same result.  Loop through this behavior until a pair is returned or n has been reached by first_prime, in which case nil is returned.


# Code
#########
def is_prime(number)
  (2..number-1).each do |num|
    return false if number % num == 0
  end
  true
end

def gap(gap, m, n)
  return [m, n] if m - n == gap
  return nil if m == n
  primes_arr = []

  (m..n).each do |num|
    primes_arr << num if is_prime(num)
  end 

  (0...primes_arr.length-1).each do |idx|
    num1 = primes_arr[idx]
    num2 = primes_arr[idx+1]
    return [num1, num2] if num2 - num1 == gap
  end
  nil
end


# Test Cases
##############
#is_prime
# p is_prime(2) == true
# p is_prime(3) == true
# p is_prime(4) == false
# p is_prime(5) == true

p gap(2, 5, 7) == [5, 7]
p gap(2, 5, 5) == nil
p gap(4, 130, 200) == [163, 167]  # ([193, 197] is also such a 4-gap primes between 130 and 200 but it's not the first pair)
p gap(6,100,110) == nil  # between 100 and 110 we have 101, 103, 107, 109 but 101-107 is not a 6-gap because there is 103 in between and 103-109 is not a 6-gap because there is 107 in between.
