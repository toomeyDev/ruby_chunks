require "./roles.rb"

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
  end
end

mastermind_game = Game.new
mastermind_game.intro