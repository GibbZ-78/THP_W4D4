# board.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W4D4 - Tic-Tac-Toe OOP game

# Useful includes & requires
require_relative '../views/show.rb'
require_relative 'square.rb'

# Board class - Instantiate the game board of n*m squares for the players to play on
class Board
  attr_accessor :game_board, :board_rows, :board_columns
  
  def initialize(my_rows, my_columns)
    @game_board = []
    tmp_alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    tmp_alphabet = tmp_alphabet[0,my_columns]
    for col in tmp_alphabet do
      for row in 1..my_rows do
        @game_board.push(Square.new(col + row.to_s," "))
      end
    end
    @board_rows = my_rows
    @board_columns = my_columns
  end

  # get_square - Return a Square object corresponding to the given 'my_key', or nil
  def get_square(my_key)
    self.game_board.each do |each_square| 
      if (each_square.coordinates == my_key) 
        return each_square 
      end
    end
    return nil
  end

  # read_square_status - Return the content of the square with the given 'key'
  def read_square_status(my_key)
    self.game_board.each do |each_square| 
      if (each_square.coordinates == my_key) 
        return each_square.status 
      end
    end
    return nil
  end
  
  # write_square_status - Update the content of the square with the given 'key'
  def write_square_status(my_key, my_status)
    # self.game_board.map! {|each_square| ((each_square.coordinates == my_key) ? (each_square.status = my_status)) }
    self.game_board.map do |each_square| 
      if each_square.coordinates == my_key
        each_square.status = my_status
      end
    end
  end

  # is_full? - Return 'true' if the whole related board is full of token (i.e. no square is empty)
  def is_full?
    tmp_full = true
    self.game_board.each do |each_square|
      tmp_full = tmp_full && !each_square.is_empty?
    end
    return tmp_full
  end

  # is_there_a_winner? - Test if the board contains any line of length 'length_to_victory'. Return 'true' is so, 'else' if not
  def is_there_a_winner?(length_to_victory)
    ### TO BE UPDATED ###
    return false
    ### TO BE UPDATED ###
  end

end

# board.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)