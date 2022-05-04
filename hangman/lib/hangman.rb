class Game
    def initialize(debug=false)
        # debug flag to enable easier troubleshooting for development
        @debug = debug
        # track the number of guesses player has made
        @guesses = 0
        # flag to track whether player has successfully guessed the hidden word
        @victory = false
    end

    def gameplay
        puts "Selecting random word.."
        hidden_word = random_word()
        puts "Word is #{hidden_word.size} letters long."
        # if debug enabled, display the hidden word at start
        p hidden_word if @debug
        # keep track of any characters guessed by the player
        guessed_characters = []
        
        guess_outcome = nil
        until (guess_outcome == 1 || guess_outcome == -1)
            guessed_characters.push(player_guess(hidden_word))
            p "hidden is #{hidden_word}" if @debug
            guess_outcome = check_word_against_guesses(hidden_word, guessed_characters)
        end
    end

    # prompt the player for a guess to check against the hidden word
    def player_guess(current_word)
        puts "Choose a letter for your guess: "
        print "Guess: "
        u_choice = gets.chomp.downcase
                   
        # if user enters 'save' serialize current game state to file
        if u_choice == "save"
            puts "Saving current game to file..."
            save_game(self)
            return -1
        elsif u_choice.size > 1
            if u_choice == current_word
                @guesses += 1
                puts "#{current_word} is the word, congratulations!"
                @victory = true
            else
                @guesses += 1
                puts "#{u_choice} is not the word, too bad.."
                ''
            end
        elsif u_choice.size < 1 
            puts 'Expecting a single letter or word as a guess, please try again.'
            puts '(This guess will not be counted against your total)'
            ''
        else
            @guesses += 1
            u_choice
        end
    end

    # check the currently selected word against all previously
    # guessed letters entered by the player
    def check_word_against_guesses(word, guesses)
        if @victory
            puts "Congratulations, you guessed the word, #{word} in #{@guesses} guesses!"
            return 1
        end
        puts "Guessed #{@guesses} times:"
        puts "Current letters: #{guesses}"
        word_characters = word.split('')
        # for each letter guessed, check against the hidden word
        current_guess = ''
        word_characters.each do |character|
            if guesses.include? character
                current_guess += " #{character}"
            else
                current_guess += ' _'
            end
        end

        puts current_guess
        
        if current_guess == word
        	puts "Congratulations, you guessed the word, #{word} in #{@guesses} guesses!"
            return 1
        elsif @guesses == 5
        	puts "Too bad, you didn't guess the word in 5 guesses."
            puts "Hidden word was #{word}."
            return -1
        else
        	puts "#{5 - @guesses} guesses left.."
            return 0
        end
    end
end

def intro
    puts "Welcome to Hangman."
    puts "+-------------------------------+"
    puts "| Start | Words | Exit |  Load  |"
    puts "+-------------------------------+"
    print "Selection: "
    menu_choice = gets.chomp.downcase 
    
    # return strings to indicate outcome of menu selection
    # ie 'start' for a regular game start, or 'load'
    # to load a saved game file from storage
    case menu_choice
    when "start"
        puts "Starting game.."
        return 'start'
    when "word"
        puts"Displaying possible words.."
        # should be used in future to call wordlist method
        # show all valid words from the provided dataset
        'words'
    when "exit"
        puts "Exiting.."
    when "load"
        puts "Loading most recent saved game.."
        'load'
    else
        puts "Please choose a valid menu option."
        'invalid'
    end
end

def menu_sequence
    outcome = nil
    while outcome.nil?
	    outcome = intro
        if outcome == 'start'
            game_instance = Game.new
            game_instance.gameplay
        elsif outcome == 'load'
            game_instance = load_game('saved_game.txt')
            game_instance.gameplay
        elsif outcome == 'exit'
            break
        else
            outcome = nil
        end
    end

end

# select a random word from the dictionary dataset
def random_word()
    word_choice = nil
    File.open('english-10000-no-swears.txt', 'r') do |words|
        word_index = Random.rand(words.readlines().size)
        words.seek 0
        while word_index > 0
            current_word = words.gets.chomp
              # check to ensure words are of appropriate size for hangman
            if current_word.length >= 5 && current_word.length <= 7
                word_choice = current_word
            end
            word_index -= 1
        end
    end
    return word_choice
end

def save_game(game_instance)
	# store serialized game instance
	saved_game = Marshal.dump(game_instance)
	# write serialized instance to file
	File.write("saved_game.txt", saved_game)
end

def load_game(save_file)
	loaded_save = Marshal.load(save_file)
	return loaded_save
end

menu_sequence