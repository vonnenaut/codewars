=begin
Data Structures
input: string, array of markers
output: the same string stripped of anything after any marker, through to the end of that line

# Algorithm
Option A: iterate through each char and place it in a new array to be joined, skipping over markers through to end of line chars.

Option B: Use gsub with a regular expression to replace anything that starts with a marker and ends with a newline char with an empty string.

=end
def solution(input, markers)
  # regex: any amount of whitespace followed by any of the markers and any number of characters that aren't a newline
  input.gsub(/\s*[#{markers.join}].*/, '')
end

puts solution("apples, plums % and bananas\npears\noranges !applesauce",  ["%", "!"]) == "apples, plums\npears\noranges"
puts solution("Q @b\nu\ne -e f g", ["@", "-"]) == "Q\nu\ne"