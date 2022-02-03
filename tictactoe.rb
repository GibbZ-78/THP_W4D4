# tictactoe.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W4D4 - Tic-Tac-Toe OOP game

# Useful includes & requires
require 'bundler'
Bundler.require
require_relative 'lib/apps/game.rb'
require_relative 'lib/apps/player.rb'
require_relative 'lib/apps/board.rb'
require_relative 'lib/views/show.rb'

# Main class - Instantiate and launch a new game
class TicTacToe
  attr_accessor :my_game

  def initialize
    Show.clear_screen
    Show.splash_screen(30)
    @my_game = Game.new(3,3,3,2)
    @my_game.launch
    Show.end_screen(30,my_game.get_winner)
    Show.end_screen(30,nil)
  end

end

# Launch of the Tic Tac Toe game
my_tictactoe = TicTacToe.new

# tictactoe.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)