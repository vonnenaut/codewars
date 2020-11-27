# open_or_senior.rb
# PEDAC practice #1

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent

# Problem
###########
# The Western Suburbs Croquet Club has two categories of membership, Senior and Open. They would like your help with an application form that will tell prospective members which category they will be placed.

# To be a senior, a member must be at least 55 years old and have a handicap greater than 7. In this croquet club, handicaps range from -2 to +26; the better the player the lower the handicap.
# Input

# Input will consist of a list of lists containing two items each. Each list contains information for a single potential member. Information consists of an integer for the person's age and an integer for the person's handicap.


# Examples
############
# Example Input

# [[18, 20],[45, 2],[61, 12],[37, 6],[21, 21],[78, 9]]
# [[age1, handicap1], [age2, handicap2]]


# Output

# Output will consist of a list of string values stating whether the respective member is to be placed in the senior or open category.
# Example Output

# ["Open", "Open", "Senior", "Open", "Open", "Senior"]


# Data Structure
##################
# An array of arrays --> an array of strings

# Algorithm
#################
# Steps:
# 1. Create a local variable, membership_type, which will contain the new array of strings as output/return value described above.
# 2. Iterate through each input subarray, assigning a local variable to age and one to handicap (|age, handicap|).
# 3.  Check if the age qualifies for senior.  If so, check that handicap also qualifies, and if so, add "Senior" to the output array, membership_type.  Otherwise, if one or both qualifications fail, add "Open" to the output array, membership_type.
# 4.  Return the array of strings, membership_type. 

# Code
#########
def openOrSenior(data)
  membership_type = []

  data.each do |member|
    age = member[0]
    handicap = member[1]

    if age >= 55 && handicap > 7
      membership_type << "Senior"
    else
      membership_type << "Open"
    end
  end
  membership_type
end

p openOrSenior([[45, 12],[55,21],[19, -2],[104, 20]]) == ['Open', 'Senior', 'Open', 'Senior']
p openOrSenior([[3, 12],[55,1],[91, -2],[54, 23]]) == ['Open', 'Open', 'Open', 'Open']
p openOrSenior([[59, 12],[55,-1],[12, -2],[12, 12]]) == ['Senior', 'Open', 'Open', 'Open']
p openOrSenior([[16, 23],[73,1],[56, 20],[1, -1]]) == ['Open', 'Open', 'Senior', 'Open']


