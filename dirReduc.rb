# dirReduc.rb
# PEDAC practice #10

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code

# coding with intent


# Problem & Examples
#####################
# … a man was given directions to go from one point to another. The directions were "NORTH", "SOUTH", "WEST", "EAST". Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too. Going to one direction and coming back the opposite direction is a needless effort. Since this is the wild west, with dreadfull weather and not much water, it's important to save yourself some energy, otherwise you might die of thirst!


# Data Structure
##################
# Input: 
# Output: 

# Algorithm
#################
#1. 

# Code
#########
OPPOSITE = {
  "NORTH" => "SOUTH",
  "EAST" => "WEST",
  "SOUTH" => "NORTH",
  "WEST" => "EAST"
}

def dirReduc(arr)

end

directions = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
p dirReduc(directions) # == ["WEST"]

directions = ["NORTH", "SOUTH", "EAST", "WEST"]
p dirReduc(directions) # == []
