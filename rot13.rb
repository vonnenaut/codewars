=begin
# Problem##############
How can you tell an extrovert from an introvert at NSA? Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it? According to Wikipedia, ROT13 (http://en.wikipedia.org/wiki/ROT13) is frequently used to obfuscate jokes on USENET.

Hint: For this task you're only supposed to substitue characters. Not spaces, punctuation, numbers etc. Test examples:

# Example #################
rot13("EBG13 rknzcyr.") == "ROT13 example.";
rot13("This is my first ROT13 excercise!" == "Guvf vf zl svefg EBG13 rkprepvfr!"

# Data Structures #############
in: a rot13-encoded string
out: a decoded string message which preserves non-alphabetic characters in place

# Algorithm #####################
split the string into chars and iterate through each, moving it directly to the end of the output string if it's not alphabetic, and translating it via rot13 if it is.
return the output string
=end
LOWERCASE = [*('a'..'z')]
UPPERCASE = [*('A'..'Z')]

def decode(char)
  idx = (char.match(/[a-z]/) ? LOWERCASE.index(char) : UPPERCASE.index(char))

  return LOWERCASE[idx+13] if char.match(/[a-z]/) && idx < 13
  return LOWERCASE[idx-13] if char.match(/[a-z]/) && idx >= 13
  return UPPERCASE[idx+13] if char.match(/[A-Z]/) && idx < 13
  return UPPERCASE[idx-13] if char.match(/[A-Z]/) && idx >= 13
end

def rot13(message)
  decoded_chars = []
  chars = message.split(//)

  chars.each do |char|
    decoded_chars << (char.match(/[^a-zA-Z]/) ? char : decode(char))
  end

  decoded_chars.join
end


# Test
p rot13("EBG13 rknzcyr.") == "ROT13 example."
