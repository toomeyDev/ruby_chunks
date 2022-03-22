require "./roles.rb"

TURN_LIMIT = 12

class Game
  def initialize
    @code_maker = Codemaker.new(true)
    @code_breaker = Codebreaker.new(false)
  end

  def intro
    puts "|Mastermind|
    \nHow to play:
    \nOne player is the codemaker, and will choose a hidden code made up of four colors, color choices include red, green, blue, yellow, black and white.
    \nThe other player is the codebreaker, and must guess the codebreaker's code in 12 turns.
    \b\b\b\bCodebreaker will receive feedback after each guess to assist in cracking the code."
    victory = false
    turns = 0
    @code_maker.create_code
    TURN_LIMIT.times do |turn|
      puts "Turn number: #{turn+1}"
      victory = code_guess()
      turns = turn
      break if victory # break out if victory condition is detected
    end
    end_message(turns, victory)
  end

  def end_message(turns, victory_condition)
    if victory_condition
      puts "Congratulations, cracked the code in #{turns} turns!"
    else
      puts "Too bad, codebreaker couldn't crack the code in 12 turns!"
    end
  end

  def code_guess
    colors = @code_breaker.get_guess(@code_maker)
    correct_positions = []
    correct_colors = []

    colors.each_with_index do |color, index|
      if color == @code_maker.hidden_colors[index]
        correct_positions << "x" # indicate a correct guess
      else
        correct_positions << "o" # indicate an incorrect guess
      end
      
      if @code_maker.hidden_colors.include? color
        correct_colors << color if !correct_colors.include? color
      end

    end
    puts correct_positions.join
    puts "Correct colors: #{correct_colors.join(" ")}"

    # check for victory condition
    if correct_positions.join == "xxxx"
      puts "Cracked the code, great job!"
      return true
    end
    return false
  end

end

mastermind_game = Game.new
mastermind_game.intro
