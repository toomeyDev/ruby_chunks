puts 'Tic-Tac-Toe'

class Player
  @score = 0
  attr_accessor :name, :shape
  def initialize(name='default', shape='circle')
    @name = name
    @shape = shape
  end
end

class Board
  # store board state, init to blank board
  
  def initialize()
  @cells = [
    [0,0,0],
    [0,0,0],
    [0,0,0]
  ]  
  end

  def play(rounds=1, p1=Player.new, p2=Player.new)
    @player = p1
    @cpu = p2

    puts "You are: #{p1.name}, your shape is : #{p1.shape}"
	puts "Choose a spot on the board to make a mark: (format [x][y])"
	player_spot = gets.chomp

    
		
  end

  def to_s
	board_string =  "|===========|\n"
	board_string += "|=[ ][ ][ ]=|\n"
	board_string += "|=[ ][ ][ ]=|\n"
	board_string += "|=[ ][ ][ ]=|\n"
	board_string += "|===========|\n"
	return board_string
  end
  
end

test_player = Player.new
p test_player

test_board = Board.new
puts test_board

test_board.play(1, test_player)
