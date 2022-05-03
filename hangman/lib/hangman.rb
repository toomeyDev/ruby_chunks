

class Game
    def initialize(debug=false)
        # debug flag to enable easier troubleshooting for development
        @debug = debug
        # track the number of guesses player has made
        @guesses = 0
        # flag to track whether player has successfully guessed the hidden word
        @victory = false
        intro
    end

    def intro
        puts "Welcome to Hangman."
        puts "------------------------"
        puts "| Start | Words | Exit |"
        puts "------------------------"
        print "Selection: "
        menu_choice = gets.chomp.downcase 
        case menu_choice
        when "start"
            "Starting game.."
            gameplay
        when "word"
            "Displaying possible words.."
        when "exit"
            "Exiting.."
        else
            "Please choose a valid menu option."
        end
    end

    def gameplay
        puts "Selecting random word.."
        hidden_word = random_word()
        # if debug enabled, display the hidden word at start
        p hidden_word if @debug
        # keep track of any characters guessed by the player
        guessed_characters = []
        5.times do
            guessed_characters.push(player_guess(hidden_word))
            p "hidden is #{hidden_word}" if @debug
            guess_outcome = check_word_against_guesses(hidden_word, guessed_characters)
            break if guess_outcome != 0
        end
    end

    # prompt the player for a guess to check against the hidden word
    def player_guess(current_word)
        puts "Choose a letter for your guess: "
        print "Guess: "
        u_choice = gets.chomp
        if u_choice.size > 1
            if u_choice == current_word
                @guesses += 1
                puts "#{current_word} is the word, congratulations!"
                @victory = true
            else
                @guesses += 1
                puts "#{u_choice} is not the word, too bad.."
            end
        elsif u_choice.size < 1 
            puts 'Expecting a single letter or word as a guess, please try again.'
            puts '(This guess will not be counted against your total)'
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
                current_guess += character
            else
                current_guess += '_'
            end
        end

        puts current_guess
        
        if current_guess == word
        	puts "Congratulations, you guessed the word, #{word} in #{@guesses} guesses!"
        elsif @guesses == 5
        	puts "Too bad, you didn't guess the word in 5 guesses."
            puts "Hidden word was #{word}."
            return -1
        else
        	puts "#{5 - @guesses} guesses left.."
            return 0
        end
    end

    # select a random word from the dictionary dataset
    def random_word()
        word_choice = nil
        File.open('english-10000-no-swears.txt', 'r') do |words|
            word_index = Random.rand(words.readlines().size)
            words.seek 0
            while word_index > 0
                word_choice = words.gets.chomp
                word_index -= 1
            end
        end
        return word_choice
    end
end

# create an instance of game with debug enabled for testing
game_instance = Game.new(false)