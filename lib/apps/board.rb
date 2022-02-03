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
        @game_board.push(Square.new(col.to_s + row.to_s,""))
      end
    end
    @board_rows = my_rows
    @board_columns = my_columns
  end

end

# board.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)