COLORS = ['red','blue','green','yellow','black','white']

class Codemaker
  attr_accessor :hidden_colors
  def initialize(human=false)
    @human = human # keep track of whether codemaker is CPU or player
    @hidden_colors = [] # store chosen colors for the code which must be solved
  end

  def create_code
    unless @human
      4.times do
        color = COLORS[rand(6)]
        hidden_colors.append(color)
      end
    else
      code = get_code
      code.each {|color| hidden_colors.append(color)}
      puts "Codemaker has chosen a hidden code!"  
    end
  end

  def get_code
    print "Select a code for the other player to crack using format c1/c2/c3/c4, ie: red/green/green/blue\nYour code: "
    code = gets.chomp
    code = code.split("/")
    puts code
    return code
  end

end

class Codebreaker
  attr_accessor :colors
  def initialize(human=true)
    @human = human # keep track of whether codebreaker is CPU or player
    @colors = [] 
  end

  def cpu_guess
    guess = []
    4.times do  
      color = COLORS[rand(6)]
      guess.append(color)
    end
    guess
  end

  def get_guess
    unless @human
      return cpu_guess
    else
      print "Make your guess in the format c1/c2/c3/c4, ie: red/green/blue/yellow\nGuess: "
      guess = gets.chomp
      guess = guess.split("/")
      return guess
    end
  end

end