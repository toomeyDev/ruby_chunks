class Codemaker
  attr_accessor :hidden_colors
  def initialize
    @hidden_colors = [] # store chosen colors for the code which must be solved
  end
end

class Codebreaker
  attr_accessor :colors
  def initialize
    @colors = []
  end
end