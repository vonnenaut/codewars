# delete_nth.rb
# PEDAC practice #50

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code


# Problem & Examples
#####################
=begin
Enough is enough!

Alice and Bob were on a holiday. Both of them took many pictures of the places they've been, and now they want to show Charlie their entire collection. However, Charlie doesn't like this sessions, since the motive usually repeats. He isn't fond of seeing the Eiffel tower 40 times. He tells them that he will only sit during the session if they show the same motive at most N times. Luckily, Alice and Bob are able to encode the motive as a number. Can you help them to remove numbers such that their list contains each number only up to N times, without changing the order?
Task

Given a list lst and a number N, create a new list that contains each number of lst at most N times without reordering. For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].
=end


# Data Structure
##################
# input -- an array of ints and an int, max_num; the latter is the max number of occurrences allowed
# output -- an arry in which, with order preserved, each unique number occurs a maximum of input int times


# Algorithm
###############
=begin
Iterate through array and for each value, starting from the left, assigned to current_value, count the number of occurrences and assign it to count.  

assign num_to_remove = count - max_num

Iterate through a copy of the array backwards (reversed) and remove occurrences of current_value in the first iteration from the left until the desired number of occurrences is achieved (decrement num_to_remove each time an extra occurrence is removed from the copy.

return the copy of the array after reversing it to the right order.
=end


# Code
#########
def delete_nth(num_arr, max_num)
  reversed_copy = num_arr[0..-1].reverse

  num_arr.uniq.each do |val|
    count = num_arr.count(val)
    
    while count > max_num
      idx = reversed_copy.index(val)
      reversed_copy.delete_at(idx)
      count -= 1
    end
  end
  reversed_copy.reverse
end

# Test Cases
#############
p delete_nth([1,1,1,1],2) == [1,1]
puts
p delete_nth([20,37,20,21],1) == [20,37,21]
