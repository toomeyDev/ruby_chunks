

class Game
    def initialize
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
        p hidden_word
        # keep track of any characters guessed by the player
        guessed_characters = []
        5.times do
            guessed_characters.push(player_guess)
            check_word_against_guesses(hidden_word, guessed_characters)
        end
    end

    # prompt the player for a guess to check against the hidden word
    def player_guess()
        puts "Choose a letter for your guess: "
        print "Guess: "
        gets.chomp
    end

    # check the currently selected word against all previously
    # guessed letters entered by the player
    def check_word_against_guesses(word, guesses)
        p guesses
        word_characters = word.split('')
        # for each letter guessed, check against the hidden word
        word_characters.each do |character|
            if guesses.include? character
                print character
            else
                print '_'
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
                word_choice = words.gets.chomp
                word_index -= 1
            end
        end
        return word_choice
    end
end

game_instance = Game.new