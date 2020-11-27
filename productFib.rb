# productFib.rb
# PEDAC practice #11

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# The Fibonacci numbers are the numbers in the following integer sequence (Fn):

#     0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...

# such as

#     F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.

# Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying

#     F(n) * F(n+1) = prod.

# Your function productFib takes an integer (prod) and returns an array:

# [F(n), F(n+1), true] or {F(n), F(n+1), 1} or (F(n), F(n+1), True)

# depending on the language if F(n) * F(n+1) = prod.

# If you don't find two consecutive F(m) verifying F(m) * F(m+1) = prodyou will return

# [F(m), F(m+1), false] or {F(n), F(n+1), 0} or (F(n), F(n+1), False)

# F(m) being the smallest one such as F(m) * F(m+1) > prod.
# Examples

# productFib(714) # should return [21, 34, true], 
#                 # since F(8) = 21, F(9) = 34 and 714 = 21 * 34

# productFib(800) # should return [34, 55, false], 
#                 # since F(8) = 21, F(9) = 34, F(10) = 55 and 21 * 34 < 800 < 34 * 55

# Notes: Not useful here but we can tell how to choose the number n up to which to go: we can use the "golden ratio" phi which is (1 + sqrt(5))/2 knowing that F(n) is asymptotic to: phi^n / sqrt(5). That gives a possible upper bound to n.

# You can see examples in "Example test".


# Data Structure
##################
# input -- integer, product
# output -- an array containing two consecutive Fibonacci numbers whose product is equal to the input.


# Algorithm
###############
# 1. Instantiate first as 1 and second as 1, set seq_prod to 0.
# 2. Iterate a while loop with a condition that seq_prod is less than product.
  # a. Set current = first + second and set seq_prod = current * second and test it to see if it's equal to product.  If so, return an array containing second, current and true.
  # b. set first = second, second = current.  The loop starts over from here.
# 3. After the loop terminates, return an array containing second, current, false.

# Code
#########
def productFib(product)
  first, second, current = 0, 1, 1
  seq_prod = 0

  while seq_prod < product
    first = second
    second = current
    current = first + second
    seq_prod = current * second
    return [second, current, true] if seq_prod == product    
  end

  [second, current, false]
end

p productFib(4895) == [55, 89, true]
p productFib(5895) == [89, 144, false]
