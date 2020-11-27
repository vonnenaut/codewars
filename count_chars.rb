# count_chars.rb
# PEDAC practice #20

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# The main idea is to count all the occuring characters(UTF-8) in string. If you have string like this aba then the result should be { 'a': 2, 'b': 1 }

# What if the string is empty ? Then the result should be empty object literal { }


# Data Structure
##################
# input: a string of chars
# output: a hash containing each unique char as a key and the number of occurrences of that char in the string as a value.


# Algorithm
###############
#1. instantiate variable, count_hash which will be used to return output
#2. split string into chars, called chars
#3. iterate through chars and check if key exists for each in count_hash; if not, add it with a value of 1, if so, increment the value pairing for that key.
# return count_hash


# Code
#########
def count_chars(string)
  count_hash = {}

  string.split(//).each do |char|
    count_hash.has_key?(char) ? count_hash[char] += 1 : count_hash[char] = 1
  end
  count_hash
end

# Test Cases
##############
p count_chars("aba") == {"a" => 2, "b" => 1}
p count_chars("") == {}
