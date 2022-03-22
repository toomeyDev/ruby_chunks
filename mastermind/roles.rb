class Codemaker
  attr_accessor :hidden_colors
  def initialize
    @hidden_colors = [] # store chosen colors for the code which must be solved
  end

  def create_code(color_a, color_b, color_c, color_d)
    hidden_colors.append(color_a)
    hidden_colors.append(color_b)
    hidden_colors.append(color_c)
    hidden_colors.append(color_d)
  end

end

class Codebreaker
  attr_accessor :colors
  def initialize
    @colors = []
  end

  def get_guess(codemaker)
    print "Make your guess in the format c1/c2/c3/c4, ie: red/green/blue/yellow\nGuess: "
    guess = gets.chomp
    guess = guess.split("/")
    return guess
  end

end