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
      # tmp_full = tmp_full && !each_square.is_empty?
      if each_square.is_empty?
        tmp_full = false
      end
    end
    return tmp_full
  end

  # we_have_a_winner? - Test if the board contains any line of length 'length_to_victory'. Return 'true' is so, 'else' if not
  def we_have_a_winner?(length_to_victory)
    ### TO BE UPDATED BECAUSE NOT GENERIC ###
    a1 = self.read_square_status("A1")
    a2 = self.read_square_status("A2")
    a3 = self.read_square_status("A3")
    b1 = self.read_square_status("B1")
    b2 = self.read_square_status("B2")
    b3 = self.read_square_status("B3")
    c1 = self.read_square_status("C1")
    c2 = self.read_square_status("C2")
    c3 = self.read_square_status("C3")
    cols = Board.test3(a1,a2,a3) || Board.test3(b1,b2,b3) || Board.test3(c1,c2,c3)
    rows = Board.test3(a1,b1,b3) || Board.test3(a2,b2,c2) || Board.test3(a2,b3,c3)
    diags = Board.test3(a1,b2,c3) || Board.test3(a3,b2,c1)
    return cols || rows || diags
    ### TO BE UPDATED BECAUSE NOT GENERIC ###
  end

  private

  # test3 - Return 'true' if all 3 parameters are equal to each other + are not empty (" ", 1 space)
  def self.test3(x,y,z)
    return x==y && x==z && x!=" "
  end

end

# board.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)