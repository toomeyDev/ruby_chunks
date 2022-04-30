require_relative "./roles.rb"

TURN_LIMIT = 12

class Game
  def initialize
    @game_info = { Codemaker: nil, Codebreaker: nil}
    # setup values for players/cpu participants for codemaker/breaker
    setup_players()

    # create instance vars to reference code_maker, code_breaker during gameplay
    @code_maker = @game_info[:Codemaker]
    @code_breaker = @game_info[:Codebreaker]
  end

  # handle setup for players (number of human players, roles for player/cpu participants)
  def setup_players
    puts "How many people are playing? (1-2 people)\nYour answer:"
    player_selection = gets.chomp
    if player_selection == '1'
      puts  "Codemaker or Codebreaker?"
      player_selection = gets.chomp.downcase
      if player_selection == 'codemaker'
        puts "Player will be Codemaker..."
        puts "CPU will be Codebreaker..."
        @game_info[:Codemaker] = Codemaker.new(true)
        @game_info[:Codebreaker] = Codebreaker.new(false)
      elsif player_selection == 'codebreaker'
        puts "Player will be Codebreaker..."
        puts "CPU will be Codemaker..."
        @game_info[:Codemaker] = Codemaker.new(false)
        @game_info[:Codebreaker] = Codebreaker.new(true)
      else
        puts "Invalid selection"
        puts "Setting Player 1 to Codebreaker, CPU to Codemaker..."
        @game_info[:Codemaker] = Codemaker.new(false)
        @game_info[:Codebreaker] = Codebreaker.new(true)
    end
    elsif player_selection == '2'
      puts "Player 1 Codemaker or Codebreaker?"
      player_selection = gets.chomp.downcase
      if player_selection == 'codemaker'
        puts "Player 1 will be Codemaker..."
        puts "Player 2 will be Codebreaker..."
        @game_info[:Codemaker] = Codemaker.new(true)
        @game_info[:Codebreaker] = Codebreaker.new(true)
      elsif player_selection == 'codebreaker'
        puts "Player 1 will be Codebreaker..."
        puts "Player 2 will be Codemaker..."
        @game_info[:Codemaker] = Codemaker.new(true)
        @game_info[:Codebreaker] = Codebreaker.new(true)
      else
        puts "Invalid selection"
        puts "Setting Player 1 to Codemaker, Player 2 to Codebreaker..."
        @game_info[:Codemaker] = Codemaker.new(true)
        @game_info[:Codebreaker] = Codebreaker.new(true)
      end
    end
	end

	

  def gameplay
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
    end_message(turns+1, victory)
  end

  def end_message(turns, victory_condition)
    if victory_condition
      puts "Congratulations, cracked the code in #{turns} turns!"
    else
      puts "Too bad, codebreaker couldn't crack the code in 12 turns!"
    end
  end

  def code_guess
    colors = @code_breaker.get_guess
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
mastermind_game.gameplay
