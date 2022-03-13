puts "Substring Match"




def get_dictionary
  # allow for user to enter an array of substrings, otherwise use default_dict values
  default_dict = ["the", "or", "thing", "hill", "car", "house", "tomato", "the", "i"]
  print "Enter an array of strings, or leave blank to use a default dictionary: "
  dict = gets.chomp.split(' ') # split into array on each space between words
  unless dict == []
    puts "Using dictionary #{dict}"
  else
    dict = default_dict
    puts "Using default dictionary #{dict}"
  end
  dict
end

def substrings(dictionary, *match_phrases)
  # get the number of matches for the given phrase in the dictionary
  dictionary.reduce(Hash.new(0)) do |result, string|
    if match_phrases.include? string
      result[match_phrases] += 1
    end
      result
  end
end

puts substrings(get_dictionary, "the", "or")
puts substrings(get_dictionary, "house", "tomato", "the", "i")
puts substrings(get_dictionary, "")
