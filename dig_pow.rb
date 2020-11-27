# dig_pow.rb
# PEDAC practice #7

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Some numbers have funny properties. For example:

#     89 --> 8¹ + 9² = 89 * 1

#     695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

#     46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

#     we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.

# In other words:

#     Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

# If it is the case we will return k, if not return -1.

# Note: n and p will always be given as strictly positive integers.

# dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
# dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
# dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
# dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51


# Data Structure
##################
# input -- two inputs, n and p, both integers
  # n:  integer whose digits will be operated on
  # p:  power to which n's digits will be taken when summed (n[0]^p + n[1]^(p+1) + n[2]^(p+2)...
# output --  either k or -1, k being a positive integer such that the sum of the digits of the first input, n, taken to the successive powers of p is equal to k*n.


# Algorithm
###############
# 1. Instantiate k as -1, the value to be returned if no integer is found.
# 2. Instantiate digits_array as an array containing the digits of n.
# 3. Instantiate power as p, the starting power for summing n's digits.
# 4. Instantiate sum as 0, the sum of the digits to the successive powers.
# 5. Iterate through a loop of each digit, adding to sum the digit to it's respective power.
# 6. After the loop terminates, check if sum modulo n is equal to zero.  If so, return this quotient as k.  Otherwise, return -1.

# Code
#########
def dig_pow(n, power)
  k = -1
  digits_array = n.to_s.split(//).map(&:to_i)
  sum = 0

  digits_array.each do |digit|
    sum += digit**power
    power += 1
  end

  if sum % n == 0
    k = sum / n
  end
  k
end

p dig_pow(89, 1) == 1 # since 8¹ + 9² = 89 = 89 * 1
p dig_pow(92, 1) == -1 # since there is no k such as 9¹ + 2² equals 92 * k
p dig_pow(695, 2) == 2 # since 6² + 9³ + 5⁴= 1390 = 695 * 2
p dig_pow(46288, 3) == 51 # since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
