# sum_of_intervals.rb
# PEDAC practice #23

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# Problem & Examples
#####################
# Write a function called sum_of_intervals that accepts an array of intervals, and returns the sum of all the interval lengths. Overlapping intervals should only be counted once.

# Intervals are represented by a pair of integers in the form of an array. The first value of the interval will always be less than the second value. Interval example: [1, 5] is an interval from 1 to 5. The length of this interval is 4.


# Data Structure
##################
# input -- array of two-integer arrays representing a set of intervals where the first integer is always less than the second.
# output --  integer representing the sum of the lengths of all the intervals given, not counting overlap.

# Algorithm
###############
# Methods:
# get_combined_interval(interval_arr, left_edge, right_edge)
  # returns the largest combined interval given the interval to match or extend (left_edge, right_edge) and the other intervals to match it with (interval_arr)

# sum_ints(interval_arr)
  # sums all of the provided intervals (called after get_combined_interval)

# sum_of_intervals(interval_arr)
  # main method which calls other methods and returns final output, the sum of the various intervals without counting overlapping intervals more than once
  # Logic in detail:
  #1. get combined intervals from interval_arr using get_combined_interval
  #2. get intervals not part of combined intervals
  #3. sum combined intervals with intervals not part of combined intervals.


# Code
#########
def get_combined_interval(interval_arr, left_edge, right_edge)
  p "interval_arr: #{interval_arr}"
  interval_arr.each do |interval| # get combined interval
    p "interval: #{interval}"
    p "left_edge: #{left_edge}    right_edge: #{right_edge}"
    if interval[0] >= 0 && interval[0] < left_edge && interval[1] >= left_edge
        left_edge = interval[0]
        interval_arr.delete(interval)
    elsif interval[0] < 0 && interval[0] > left_edge && interval[1] <= left_edge
        left_edge = interval[0]
        interval_arr.delete(interval)
    elsif interval[1] >= 0 && interval[1] > right_edge && interval[0] <= right_edge
        right_edge = interval[1]
        interval_arr.delete(interval)
    elsif interval[1] < 0 && interval[1] < right_edge && interval[0] >= right_edge
        right_edge = interval[1]
        interval_arr.delete(interval)
    end
  end

  interval_arr.each do |interval| # get intervals not part of combined interval
    
  end
  puts
  [interval_arr, left_edge, right_edge]
end

def sum_ints(interval_arr)
  # sums the intervals in the given interval array
  sum = 0
  interval_arr.each do |interval|
    sum += interval[1] - interval[0]
  end
  sum
end

def sum_of_intervals(interval_arr)
  p "interval_arr: #{interval_arr}"
  overlapping_ints = []
  nonoverlapping_ints = []
  idx = 0

  while idx < interval_arr.length
    left_edge = interval_arr[idx][0]
    right_edge = interval_arr[idx][1]
    edges = get_largest_interval(interval_arr, left_edge, right_edge)
    left_edge = edges[0]
    right_edge = edges[1]
    p "left_edge: #{left_edge}  right_edge: #{right_edge}"
    overlapping_ints << [left_edge, right_edge]
    puts
    idx += 1
  end
  p "overlapping_ints: #{overlapping_ints}"  

  interval_arr.each do |interval|
    overlapping_ints.each do |overlapping_interval|
      left_edge = overlapping_interval[0]
      right_edge = overlapping_interval[1]

      if interval[0] < left_edge && interval[1] <= left_edge || interval[0] >= right_edge && interval[1] > right_edge
        nonoverlapping_ints << interval
      end
    end
  end
  p "nonoverlapping_ints: #{nonoverlapping_ints.uniq}"

  overlapping_sum = sum_ints(overlapping_ints)
  nonoverlapping_sum = sum_ints(nonoverlapping_ints)
  sum = overlapping_sum + nonoverlapping_sum 
end


# Testing Code
################
# Individial Method tests:

###### get_combined_interval Tests ######
idx = 0
interval_arr = [[-2, 0], [-1, 2], [3,5]]
left_edge = interval_arr[idx][0]
right_edge = interval_arr[idx][1]
p get_combined_interval(interval_arr, left_edge, right_edge) #== [-2, 2]

idx = 0
interval_arr = [[-2, 0], [2, 4], [12, 16]]
left_edge = interval_arr[idx][0]
right_edge = interval_arr[idx][1]
p get_combined_interval(interval_arr, left_edge, right_edge) #== [-2, 0]

idx = 0
interval_arr = [[-2, 0], [-1, 4], [12, 16]]
left_edge = interval_arr[idx][0]
right_edge = interval_arr[idx][1]
p get_combined_interval(interval_arr, left_edge, right_edge) #== [-2, 4]

###### sum_ints Tests ######
# p sum_ints([[-2, 2], [3, 5]]) == 6
# p sum_ints([[-2,0]]) == 2
# p sum_ints([[-2, 4], [6,10], [14, 18]]) == 14



###### som_of_intervals Tests ######
# interval_arr = [[-2, 0], [-1, 2], [3,5]]
# p sum_of_intervals(interval_arr) #== 6

# interval_arr = 
# [[1,4],
#    [7, 10],
#    [3, 5]]
# p sum_of_intervals(interval_arr) == 7  # The sum of the lengths of these intervals is 7. Since [1, 4] and [3, 5] overlap, we can treat the interval as [1, 5], which has a length of 4.

# interval_arr = 
# [[1,2],
#    [6, 10],
#    [11, 15]]
# p sum_of_intervals(interval_arr) == 9

# interval_arr = 
# [[1,5],
#    [10, 20],
#    [1, 6],
#    [16, 19],
#    [5, 11]]
# p sum_of_intervals(interval_arr) == 19

# interval_arr = 
# [[-228, 309], [291, 320], [-197, -55], [479, 490], [-350, 485], [-262, 17], [-109, 187], [-28, 157], [495, 500], [-245, 53], [-389, -294], [-58, 414], [54, 450], [47, 178]]
# p sum_of_intervals(interval_arr) #== 884
