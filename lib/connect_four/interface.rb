class Interface
#Takes the place of the standard I/O to enable testing

  def initialize(session, out = $STDOUT)
    #ties to session
    @session = session
    @out = out
  end

  def get_player_name(mark)
    @out.puts "Player #{mark} name:"
    gets.chomp
  end

  def get_high_score
    @out.puts "Best out of how many?"
    gets.chomp.to_i
  end

  def get_coin_call(caller)
    @out.puts "\n#{caller.name}, heads or tails?"
    gets.chomp.upcase
  end

  def print_board(board)
    @out.print "|#{board.spaces[5][1]}|#{board.spaces[11][1]}|#{board.spaces[17][1]}|#{board.spaces[23][1]}|#{board.spaces[29][1]}|#{board.spaces[35][1]}|#{board.spaces[41][1]}|\n|#{board.spaces[4][1]}|#{board.spaces[10][1]}|#{board.spaces[16][1]}|#{board.spaces[22][1]}|#{board.spaces[28][1]}|#{board.spaces[34][1]}|#{board.spaces[40][1]}|\n|#{board.spaces[3][1]}|#{board.spaces[9][1]}|#{board.spaces[15][1]}|#{board.spaces[21][1]}|#{board.spaces[27][1]}|#{board.spaces[33][1]}|#{board.spaces[39][1]}|\n|#{board.spaces[2][1]}|#{board.spaces[8][1]}|#{board.spaces[14][1]}|#{board.spaces[20][1]}|#{board.spaces[26][1]}|#{board.spaces[32][1]}|#{board.spaces[38][1]}|\n|#{board.spaces[1][1]}|#{board.spaces[7][1]}|#{board.spaces[13][1]}|#{board.spaces[19][1]}|#{board.spaces[25][1]}|#{board.spaces[31][1]}|#{board.spaces[37][1]}|\n|#{board.spaces[0][1]}|#{board.spaces[6][1]}|#{board.spaces[12][1]}|#{board.spaces[18][1]}|#{board.spaces[24][1]}|#{board.spaces[30][1]}|#{board.spaces[36][1]}|\n"
  end

  def move(name)
    @out.puts "#{name}, where would you like to place your piece?\n"
    gets.chomp
  end

  def winner(player)
    @out.puts "#{player.name} wins!"
    # player.score +=1
    @session.play
  end


end

