# meeting.rb
# PEDAC practice #51

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code


# Problem & Examples
#####################
=begin


=end


# Data Structure
##################
# input -- a string of names in the format FIRST:LAST;FIRST:LAST, etc.
# output -- a string of names in alphabetical order, separated by parentheses, i.e., "(ARNO,ANN)(BELL, JOHN)


# Algorithm
###############
=begin
* Instantiate empty array ordered_array and empty string ordered_string
* Instantiate names_array as the input string split by ';'
* Parse names_array with helper method named parse_names(names_array) which:
  * splits name by ':' and places 'LAST NAME, FIRST NAME' for each name
* Iterate through names_array, placing each name in order into the new ordered_array by checking last name (names_array[1]) against last names in the array
* Iterate through ordered_array, joining last name (names_array[1]) + ", " + first name (names_array[0]" and appending that to ordered_string
* Return ordered_string
=end


# Code
#########
def meeting(string)
  names_array = string.split(';').map! do |name|
    name.upcase.split(':').reverse
  end
  names_array.map { |name| "(" + name[0] + ", " + name[1] + ")" }.sort.join
end


# Test Cases
#############
p meeting("Alexis:Wahl;John:Bell;Victoria:Schwarz;Abba:Dorny;Grace:Meta;Ann:Arno;Madison:STAN;Alex:Cornwell;Lewis:Kern;Megan:Stan;Alex:Korn") == "(ARNO, ANN)(BELL, JOHN)(CORNWELL, ALEX)(DORNY, ABBA)(KERN, LEWIS)(KORN, ALEX)(META, GRACE)(SCHWARZ, VICTORIA)(STAN, MADISON)(STAN, MEGAN)(WAHL, ALEXIS)"

p meeting("John:Gates;Michael:Wahl;Megan:Bell;Paul:Dorries;James:Dorny;Lewis:Steve;Alex:Meta;Elizabeth:Russel;Anna:Korn;Ann:Kern;Amber:Cornwell") == "(BELL, MEGAN)(CORNWELL, AMBER)(DORNY, JAMES)(DORRIES, PAUL)(GATES, JOHN)(KERN, ANN)(KORN, ANNA)(META, ALEX)(RUSSEL, ELIZABETH)(STEVE, LEWIS)(WAHL, MICHAEL)"

p meeting("Alex:Arno;Alissa:Cornwell;Sarah:Bell;Andrew:Dorries;Ann:Kern;Haley:Arno;Paul:Dorny;Madison:Kern") == "(ARNO, ALEX)(ARNO, HALEY)(BELL, SARAH)(CORNWELL, ALISSA)(DORNY, PAUL)(DORRIES, ANDREW)(KERN, ANN)(KERN, MADISON)"      
