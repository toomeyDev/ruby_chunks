puts "Tic-Tac-Toe\n"

# handle each player, name, preferred shape for marking the board
class Player
  attr_reader :name
  attr_reader :shape
  attr_reader :score
  def initialize(name, shape='x')
    @name = name
    @shape = shape
    @score = 0 # internally keep track of wins/losses
  end

  def choose_spot(board)
    # allow for the player to mark a spot of their choosing on the board
    while true do 
      puts 'Choose a place on the board (1-9) to mark: '
      puts board.to_s(1)
      selection = gets.chomp.to_i
      case selection
      when 1
        if board.check_spot(0)
          board.mark_spot(self, 0)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 2
        if board.check_spot(1)
          board.mark_spot(self, 1)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 3
        if board.check_spot(2)
          board.mark_spot(self, 2)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 4
        if board.check_spot(3)
          board.mark_spot(self, 3)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 5
        if board.check_spot(4)
          board.mark_spot(self, 4)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 6
        if board.check_spot(5)
          board.mark_spot(self, 5)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 7
        if board.check_spot(6)
          board.mark_spot(self, 6)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 8
        if board.check_spot(7)
          board.mark_spot(self, 7)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      when 9
        if board.check_spot(8)
          board.mark_spot(self, 8)
          break
        else
          puts 'Space already taken, please choose an empty spot.'
          next
        end
      else
        puts 'Please choose a valid board position (1-9)'
        next
      end

    end
    puts board.to_s
  end

  def to_s
    "Player #{@name} using #{@shape} to mark the board.\nScore of #{@score}."
  end
end

# handle tracking of gamestate, board
class Board

  def initialize(p1, p2)
    @cells = [0,0,0,0,0,0,0,0,0]
    @player1 = p1
    @player2 = p2
  end

  # handle marking of individual spots for each player
  def mark_spot(player, pos)
    @cells[pos] = player.shape
  end

  # check to ensure spots are empty before allowing player to mark them
  def check_spot(pos)
    return @cells[pos] == 0
  end

  # check for all possible victory conditions on the board
  def victory_check(player)
    shape = player.shape
    if @cells[0..2].join == (shape + shape + shape)
      puts 'winner!'
      return true
    elsif @cells[3..5].join == (shape + shape + shape)
      puts 'winner!'
      return true
    elsif @cells[6..8].join == (shape + shape + shape)
      puts 'winner!'
      return true
    elsif @cells[0] == shape && @cells[4] == shape && @cells[8] == shape
      puts 'winner!'
      return true
    elsif @cells[2] == shape && @cells[4] == shape && @cells[6] == shape
      puts 'winner!'
      return true
    elsif @cells[0] == shape && @cells[3] == shape && @cells[6] == shape
      puts 'winner!'
      return true
    elsif @cells[1] == shape && @cells[4] == shape && @cells[7] == shape
      puts 'winner!'
      return true
    elsif @cells[2] == shape && @cells[5] == shape && @cells[8] == shape
      puts 'winner!'
      return true 
    end
    return false
  end

  # handle main gameplay loop, sequencing
  def play_game
    puts "Starting Game...\n"
    while true do
      puts "#{@player1.name}'s turn."
      @player1.choose_spot(self)
      break if victory_check(@player1)
      puts "#{@player2.name}'s turn."
      @player2.choose_spot(self)
      break if victory_check(@player2)
    end
  end

  # output board status
  def to_s(mode=0)
    unless mode == 1
      board_str = "-=-=-=-=-=-\n"
      board_str += "|[#{@cells[0]}][#{@cells[1]}][#{@cells[2]}]|\n"
      board_str += "|[#{@cells[3]}][#{@cells[4]}][#{@cells[5]}]|\n"
      board_str += "|[#{@cells[6]}][#{@cells[7]}][#{@cells[8]}]|\n"
      board_str += "-=-=-=-=-=-"
      board_str
    else
      board_str = "-=-=-=-=-=-\n"
      board_str += "|[1][2][3]|\n"
      board_str += "|[4][5][6]|\n"
      board_str += "|[7][8][9]|\n"
      board_str += "-=-=-=-=-=-"
      board_str
    end
  end

end

game_board = Board.new(Player.new('Player'),Player.new('Opponent','o'))
puts game_board.to_s
game_board.play_game()