COLORS = ['red','blue','green','yellow','black','white']

class Codemaker
  attr_accessor :hidden_colors
  def initialize
    @human = false # keep track of whether codemaker is CPU or player
    @hidden_colors = [] # store chosen colors for the code which must be solved
  end

  def create_code
    unless @human
      4.times do
        color = COLORS[rand(6)]
        hidden_colors.append(color)
      end
    else
      puts 'human'
    end
  end

end

class Codebreaker
  attr_accessor :colors
  def initialize
    @human = true # keep track of whether codebreaker is CPU or player
    @colors = []   
  end

  def get_guess(codemaker)
    print "Make your guess in the format c1/c2/c3/c4, ie: red/green/blue/yellow\nGuess: "
    guess = gets.chomp
    guess = guess.split("/")
    return guess
  end

end