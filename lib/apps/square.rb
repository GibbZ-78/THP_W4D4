# square.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W4D4 - Tic-Tac-Toe OOP game

# Useful includes & requires
require_relative '../views/show.rb'

# Square class - Instantiate the cells (called "squares" by check players) of the tic-tac-toe game board
class Square
  attr_accessor :coordinates, :status
  
  # initialize - 
  def initialize(my_coord, my_status)
    @coordinates = my_coord
    @status = my_status
  end

end

# square.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)