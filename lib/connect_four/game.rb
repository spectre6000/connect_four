class Game

  attr_accessor :turn, :board

  def initialize(player1, player2, interface)
  #ties game to session
  @player1 = player1
  @player2 = player2
  @interface = interface
  #decides who goes first per game
  @turn = coin_toss
  @board = Board.new
  play
  end

  private

  def change_player
    #takes turns
    current = [@player1, @player2]
    current.delete(@turn)
    @turn = current[0]
  end

  def play
    #if no one has won...
    while @board.win == false
      #starts by printing board for player reference
      @interface.print_board(@board)
      #get the current player's move
      column = @interface.move(@turn.name).to_i
      #place the mark
      @board.move(column, @turn)
      #check for win
      @board.win?
      change_player
    end
    #changes player back in the case of a win
    change_player
    #increments player score
    @turn.score +=1
    #states who won
    @interface.winner(@turn)
  end

  def coin_toss
    #decides who goes first in a given round
    #picks a player at random
    calling = caller
    #checks to see if the randomly picked
    if @interface.get_coin_call(calling) == flip
      @turn = calling
    else
      @turn = [@player1, @player2].delete(calling)
    end
  end

  def caller
    #picks player at random to call coin toss
    calleri = [@player1, @player2].sample
  end

  def flip
    #picks side of coin at random
    flipi = ["HEADS", "TAILS"].sample
  end

end

