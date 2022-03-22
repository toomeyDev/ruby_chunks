require "./roles.rb"

TURN_LIMIT = 12

class Game
  def initialize
    @code_maker = Codemaker.new
    @code_breaker = Codebreaker.new
  end

  def intro
    puts "|Mastermind|
    \nHow to play:
    \nOne player is the codemaker, and will choose a hidden code made up of four colors, color choices include red, green, blue, yellow, black and white.
    \nThe other player is the codebreaker, and must guess the codebreaker's code in 12 turns.
    \b\b\b\bCodebreaker will receive feedback after each guess to assist in cracking the code."
    @code_maker.create_code
    TURN_LIMIT.times do |turn|
      puts "Turn number: #{turn+1}"
      break if code_guess()
    end
  end

  def code_guess
    colors = @code_breaker.get_guess(@code_maker)
    correct_positions = []
    correct_colors = []

    colors.each_with_index do |color, index|
      if color == @code_maker.hidden_colors[index]
        correct_positions << "*" # indicate a correct guess
      else
        correct_positions << "-" # indicate an incorrect guess
      end
      
      if @code_maker.hidden_colors.include? color
        correct_colors << color
      end

    end
    puts correct_positions.join
    puts "Correct colors: #{correct_colors.join}"

    # check for victory condition
    if correct_positions.join == "****"
      puts "Cracked the code, great job!"
      return true
    end
    return false
  end

end

mastermind_game = Game.new
mastermind_game.intro
