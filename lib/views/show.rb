# show.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W4D4 - Tic-Tac-Toe OOP game

# Useful includes & requires
require_relative '../apps/player.rb'
require_relative '../apps/board.rb'

# Show class - Manage all "on-screen" display (now in text mode but could be improved easily in 2D / 3D mode)
class Show
  
  # clear_screen - Flush the DISPLAY:0 (Warning: the 'clear' command used might not be compatible with non-Unix systems...)
  #                Possible improvement #1: use the 'Stdio' class and methods instead, hopefully more generic
  def self.clear_screen
    system("clear")
  end

  # splash_screen - Display the game streamer
  def self.splash_screen(nb_spacer)
    spacer = " "*nb_spacer
    puts
    puts spacer+@@a+@@f*48+@@b
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@e+"                  TIC-TAC-TOOP                  "+@@e
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@e+"  Make lines... Or die trying. Simple & Basic.  "+@@e
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@g+@@f*48+@@h
    puts spacer+@@e+" © 2022 GibbZ               Made with "+@@i+" for THP "+@@e
    puts spacer+@@d+@@f*48+@@c
    puts
  end

  # player_form - Display the dialog and prompts to create a new Player
  def self.player_form(nb_spacer,num_player)
    spacer = " "*nb_spacer
    tmp_player_tab = ["",""]
    tmp_symbol_tab = Player.get_available_token
    tmp_token_line = ""
    tmp_length = 0
    tmp_symbol_tab.each do |symbol|
      tmp_token_line = tmp_token_line + symbol + " / "
    end
    tmp_token_line = tmp_token_line[0..-4]
    tmp_length = 48 - tmp_token_line.length
    if tmp_length%2 == 0
      tmp_length /= 2
      tmp_token_line = (" "*tmp_length)+tmp_token_line+(" "*tmp_length)
    else
      tmp_length /= 2
      tmp_token_line = (" "*tmp_length)+tmp_token_line+(" "*tmp_length)+" "
    end
    tmp_token_line = spacer+@@e+tmp_token_line+@@e
    puts
    puts spacer+@@a+@@f*48+@@b
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@e+"          What is your name, player ##{num_player}?         "+@@e
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@g+@@f*48+@@h
    print spacer+@@e+"  > "
    tmp_player_tab[0] = gets.chomp # Getting the name of the Player
    puts spacer+@@g+@@f*48+@@h
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@e+"  What will be your token (please chose below)? "+@@e
    puts tmp_token_line    
    puts spacer+@@e+" "*48+@@e
    puts spacer+@@g+@@f*48+@@h
    while tmp_player_tab[1].empty? || !tmp_symbol_tab.include?(tmp_player_tab[1]) do
      print spacer+@@e+"  > "
      tmp_player_tab[1] = gets.chomp.upcase # Getting the token of the player from user entry
    end
    puts spacer+@@d+@@f*48+@@c
    puts
    return tmp_player_tab
  end

# draw_board - Display the game board with empty and occupied squares
def self.draw_board(nb_spacer, my_board)
  spacer = " "*nb_spacer
  tmp_key = ""
  tmp_line = ""
  tmp_alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  tmp_alphabet = tmp_alphabet[0,my_board.board_columns]
  for col in tmp_alphabet do
    tmp_line += " "+col+"  "
  end
  puts
  puts spacer+"  "+tmp_line # WARNING : Non-generic from this point on... Works only for a 3-column board
  puts spacer+" "+@@a+@@f*(tmp_line.length-1)+@@b 
  for row in 1..my_board.board_rows do
    print spacer+row.to_s+@@e
    for col in tmp_alphabet do
      tmp_key = col+row.to_s
      print " "+my_board.read_square_status(tmp_key)+" "+@@e
    end
    print "\n"
  end
  puts spacer+" "+@@d+@@f*(tmp_line.length-1)+@@c
  puts
end

# get_move - Prompt the given Player for his / her move on the current Board
def self.get_move(nb_spacer, a_board, a_player)
  spacer = " "*nb_spacer
  tmp_move = ""
  puts
  puts spacer+@@a+@@f*48+@@b
  puts spacer+@@e+" "*48+@@e
  puts spacer+@@e+" OK, #{a_player.first_name}, where do you want to play?"+(" "*(48-33-a_player.first_name.length))+@@e
  puts spacer+@@e+" Enter the coordinates for your '"+a_player.token+"' below       "+@@e
  puts spacer+@@e+" (ex. 'a1' or 'A1' is the top left-hand corner) "+@@e
  puts spacer+@@e+" "*48+@@e
  puts spacer+@@g+@@f*48+@@h
  while tmp_move.empty? || a_board.get_square(tmp_move).nil? || !a_board.get_square(tmp_move).is_empty? do
    print spacer+@@e+"  > "
    tmp_move = gets.chomp # Capturing the (column*row) coordinates where the Player want to play
    tmp_move = tmp_move[0,2].upcase
  end
  puts spacer+@@d+@@f*48+@@c
  return tmp_move
end

# end_screen - Display the game ending streamer
def self.end_screen(nb_spacer,winner)
  spacer = " "*nb_spacer
  if !winner.nil? 
    tmp_winner_line1 = "Congratulations "+winner.first_name+"!"
    tmp_length = 48-tmp_winner_line1.length
    if tmp_length%2 == 0
      tmp_length /= 2
      tmp_winner_line1 = (" "*tmp_length)+tmp_winner_line1+(" "*tmp_length)
    else
      tmp_length /= 2
      tmp_winner_line1 = (" "*tmp_length)+tmp_winner_line1+(" "*tmp_length)+" "
    end
    tmp_winner_line1 = spacer+@@e+tmp_winner_line1+@@e
    tmp_winner_line2 = spacer+@@e+"  You litteraly destroyed your opponent(s)...   "+@@e
  else
    tmp_winner_line1 = spacer+@@e+"      How DISAPPOINTING to see NONE of you      "+@@e
    tmp_winner_line2 = spacer+@@e+"  was simply able to emerge from all this MIRE  "+@@e
  end
  puts
  puts spacer+@@a+@@f*48+@@b
  puts spacer+@@e+" "*48+@@e
  puts spacer+@@e+"                  TIC-TAC-TOOP                  "+@@e
  puts spacer+@@e+" "*48+@@e
  puts spacer+@@g+@@f*48+@@h
  puts spacer+@@e+" "*48+@@e
  puts tmp_winner_line1
  puts spacer+@@e+" "*48+@@e
  puts tmp_winner_line2
  puts spacer+@@e+" "*48+@@e
  puts spacer+@@g+@@f*48+@@h
  puts spacer+@@e+" © 2022 GibbZ               Made with "+@@i+" for THP "+@@e
  puts spacer+@@d+@@f*48+@@c
  puts
end

  private

  # define useful class vars to enable building nice frames
  @@a = "\u256d".encode('utf-8') # top-left-hand corner
  @@b = "\u256e".encode('utf-8') # top-right-hand corner
  @@c = "\u256f".encode('utf-8') # bottom-right-hand corner
  @@d = "\u2570".encode('utf-8') # bottom-left-hand corner
  @@e = "\u2502".encode('utf-8') # vertical line
  @@f = "\u2500".encode('utf-8') # horizontal line
  @@g = "\u251c".encode('utf-8') # left crossroads
  @@h = "\u2524".encode('utf-8') # right crossroads
  @@i = "\u2665".encode('utf-8') # heart

end

# show.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)