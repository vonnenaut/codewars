# Array.rb
# PEDAC practice #46

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code


# Problem & Examples
#####################
=begin
This kata is designed to test your ability to extend the functionality of built-in classes. In this case, we want you to extend the built-in Array class with the following methods: square(), cube(), average(), sum(), even() and odd().

Explanation:

    square() must return a copy of the array, containing all values squared
    cube() must return a copy of the array, containing all values cubed
    average() must return the average of all array values; on an empty array must return NaN (note: the empty array is not tested in Ruby!)
    sum() must return the sum of all array values
    even() must return an array of all even numbers
    odd() must return an array of all odd numbers

Note: the original array must not be changed in any case!

=end


# Data Structure
##################
=begin 
input: an array of integers representing the original array to be modified by one of the following methods

output -- 
  square:  an array of integers representing the input values squared
  cube:  an array of integers representing the input values cubed
  average:  the average of the array values
  sum:  the sum of the array values
  even:  the even values in the array
  odd:  the odd values in the array
=end

# Algorithm
###############
=begin
  sum:  create an output integer set equal to 0 and iterate through each value in the array, adding it to sum, then return sum.
  
  square:  map each value in array to itself times itself and set the output of map to a variable named squares, which is then returned.

  cube:  map each value in array to itself times itself times itself and set the output of map to a variable named cubes and return it.

  average:  Instantiate a variable named length set equal to array.length and one named sum, equal to the return of self.sum(array)  Then iterate through each value of array and add it to sum.  After iteration is complete, divide sum by length and return it as the average.

  even: Select values of array for which value % 2 == 0 is true 

  odd:  Select values of array for which value % 2 != 0 is true
=end


# Code
#########
class Array
  def initialize(int_array)
    @int_array = int_array
    p "input: #{@int_array}"
  end

  def square
    squares = @int_array.map {|num| num**2 }
  end

  def cube
    cubes = @int_array.map do |num|
      num * num * num
    end
  end

  def average
    self.sum / @int_array.length
  end

  def sum
    sum = 0

    @int_array.each { |num| sum += num }
    sum
  end

  def even
    @int_array.select { |num| num % 2 == 0 }
  end

  def odd
    @int_array.select { |num| num % 2 != 0 }    
  end
end

# Test Cases
#############
numbers = Array.new([1, 2, 3, 4, 5])
p numbers.square() == [1, 4, 9, 16, 25]
p numbers.cube() == [1, 8, 27, 64, 125]
p numbers.average() == 3
p numbers.sum() == 15
p numbers.even() == [2, 4]
p numbers.odd() == [1, 3, 5]
