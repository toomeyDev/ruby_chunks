puts "Substring Match"

# should allow for user to enter an array of substrings, otherwise use default
default_dict = ["the", "or", "thing", "hill", "car", "house", "tomato", "the", "i"]

print "Enter an array of strings, or leave blank to use a default dictionary: "
dict = gets.chomp.split(' ')
unless dict == []
  puts "Using dictionary #{dict}"
else
  dict = default_dict
  puts "Using default dictionary #{dict}"
end
