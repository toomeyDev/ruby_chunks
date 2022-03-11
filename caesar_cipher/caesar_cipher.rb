def caesar_shift(ascii, shift_factor=0)
  # collect all capital-letters
  shifted = ascii.map do |character| 
    if(character >= 65 && character <= 90)
  	  if((character + shift_factor) > 90)
  	    character = 65 + ((character + shift_factor-1) % 90)
  	  else
  	    character += shift_factor
  	  end
    elsif(character >= 97 && character <= 122)
      if((character + shift_factor) > 122)
        character = 97 + ((character + shift_factor-1) % 122)
      else
        character += shift_factor
      end
    else
      character = character
    end
    character = character.chr
  end  
  return shifted
end

puts "Caesar Cipher Converter"
running = true
retry_flag = false
until running != true do
    unless retry_flag
	  print "Enter a string to convert: "
	  raw_string = gets.chomp
	  puts "Entered string: #{raw_string}"
    end

	puts "\nInput shift factor (number of places to shift alphabetically): "
	shift_factor = gets.chomp.to_i
	puts "Shift factor: #{shift_factor}"

	characters = raw_string.split('') # convert string to an array of single character strings
	characters = characters.map{|character| character.ord} # convert characters to their ASCII table values

	characters = caesar_shift(characters, shift_factor)
	
	cipher_string = characters.join
	p cipher_string

	puts "Encrypt more strings? (y/n/retry): "
	u_choice = gets.chomp.downcase
	if u_choice == 'y' 
	  retry_flag = false
	  next
	elsif u_choice == 'retry'
	  retry_flag = true
	  next
	else
	  running = false
	end
end
