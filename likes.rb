def likes(names)
  length = names.length

  case length
    when 0 then "no one likes this"
    when 1 then names[0] + " likes this"
    when 2 then names[0] + " and " + names[1] + " like this"
    when 3 then "#{names[0]}, #{names[1]} and #{names[2]} like this"
    else "#{names[0]}, #{names[1]} and #{length - 2} others like this"
  end  
end

p likes([]) == 'no one likes this'
p likes(['Peter']) == 'Peter likes this'
p likes(['Jacob', 'Alex']) == 'Jacob and Alex like this'
p likes(['Max', 'John', 'Mark']) == 'Max, John and Mark like this'
p likes(['Alex', 'Jacob', 'Mark', 'Max']) == 'Alex, Jacob and 2 others like this'