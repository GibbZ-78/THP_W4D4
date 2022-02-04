# game.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W4D4 - Tic-Tac-Toe OOP game

# Useful includes & requires
require_relative 'board.rb'
require_relative 'player.rb'
require_relative '../views/show.rb'

# Game class - Instantiate the overall game mechanic (players, board, rounds, win/lose tests...)
class Game
  attr_accessor :my_board, :my_players, :my_length_to_win, :my_current_player

  # initialize - Constructor of the Game class instantiating the game board and 
  def initialize(nb_rows=3, nb_columns=3, line_size_to_win=3, nb_players=2)
    @my_board = Board.new(nb_rows, nb_columns)
    @my_players = []
    nb_players.times do
      @my_players.push(Player.new)
    end
    @my_current_player = @my_players[0]
    @my_length_to_win = line_size_to_win
  end

  # launch - Start and manage the game logic
  def launch
    while !my_board.is_full? && !my_board.we_have_a_winner?(my_length_to_win) do
      my_players.each do |current_player|
        self.my_current_player = current_player 
        Show.draw_board(30, my_board)
        my_board.write_square_status(Show.get_move(30, my_board, current_player),current_player.token)
        if my_board.is_full? || my_board.we_have_a_winner?(my_length_to_win)
          Show.draw_board(30, my_board)
          break
        end
      end
    end
    if my_board.we_have_a_winner?(my_length_to_win)
      Show.end_screen(30,self.my_current_player)
    else my_board.is_full?
      Show.end_screen(30,nil)
    end
  end

end

# game.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)