# reverse_string.rb
# PEDAC practice #15

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# Complete the function that accepts a string parameter, and reverses each word in the string. All spaces in the string should be retained.
# Examples

# "This is an example!" ==> "sihT si na !elpmaxe"
# "double  spaces"      ==> "elbuod  secaps"


# Data Structure
##################
# input:  a string
# output: a string with the letters of each word reversed (but words are still in the same order)


# Algorithm
###############
# 1. split string into letters
# 2. iterate through each letter and store all letters up to the first encountered space, reversing the order of the letters in a temporary array variable, temp_letters, and then placing the reversed letters into a new output string, output_array, **preserving spaces between words**.
# 3. return the output_array
# Preserving spaces between words:
  # once a space is encountered, note its index in the original letter array, after reversing the letters of the delineated word, having placed them in temp_letters and finally storing them in output_array, take the space(s) next encountered in the original string's letter array and send them directly to output_array as well, then start the process over with the next word delineated up to the next space or set of spaces.  This will ensure both sinle- and multiple- space perseverance.


# Code
#########
def reverse_words(string)
  string.gsub(/\w+/) { |match| match.reverse }
end


# Test Cases
##############
# p reverse_words("This is an example!") # == "sihT si na !elpmaxe"
# p reverse_words("double  spaces") # == "elbuod  secaps"
# p reverse_words("hello hello") #== "olleh olleh"
# p reverse_words("double  spaced  words") == "elbuod  decaps  sdrow"
== "ehT kciuq nworb xof spmuj revo eht yzal .god" #, instead got: "ehT kciuq nworb xof spmuj revo eht yzal god."
