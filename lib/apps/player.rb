# player.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W4D4 - Tic-Tac-Toe OOP game

# Useful includes & requires
require_relative '../views/show.rb'

# Player class - Instantiate the player objects (2 minimum for a Tic-Tac-Toe game) with names, scores...
class Player
  attr_accessor :first_name, :token, :player_id
  @@token_in_use = []
  @@token_available = ['x','o','+','§','$','£','€','*','@','&']
  @@nb_of_players = 0

  # initialize - 
  def initialize
    @@nb_of_players +=1
    @player_id = @@nb_of_players
    tmp_tab = Show.player_form(30,@player_id) # Return a 2-cell array with...
    @first_name = tmp_tab[0]           # ... First item being the chosen name for this new instance of Player...
    @token = tmp_tab[1]                # ... Second item stabding for the token (i.e. 'x','o','$','$','€','*'...) of the related Player
    @@token_in_use.push(@token)
    @@token_available.delete(@token)
  end

  # get_available_token - 
  def self.get_available_token
    return @@token_available
  end

end

# player.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)