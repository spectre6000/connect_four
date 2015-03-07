class Board
  attr_accessor :spaces, :game, :win

  def initialize(game)
    @game = game
    @win = false
    @spaces = []

    7.times do |x|
      x += 1
      6.times do |y|
        y += 1
        #column number in first position, blank or players' mark in second
        @spaces << [x," "]
      end
    end
  end

  def win?
    game.is_the_game_over?

    WINNERS.each do |x|
      #get the various combinations of spots for win
      fours = [ @spaces[x[0]], @spaces[x[1]], @spaces[x[2]], @spaces[x[3]] ]
      if fours.all? { |space| space[1] != " " }

        #check to see if they're all the same and not just blank
        if fours[0][1] == fours[1][1] &&
          fours[1][1] == fours[2][1] &&
          fours[2][1] == fours[3][1]

          @win = true
        end
      end
    end
  end

  def move(column, turn)
    #find the correct sub-array within the @spaces array for the spot played
    @spaces.find do |x|
      if x[0] == column
        x[1] = turn.mark
        x[0] = 0
      end
    end
  end

  WINNERS =
    #V row 1
    [ [0, 1, 2, 3], [1, 2, 3, 4], [2, 3, 4, 5],
      #V row 2
      [6, 7, 8, 9], [7, 8, 9, 10], [8, 9, 10, 11],
      #V row 3
      [12, 13, 14, 15], [13, 14, 15, 16], [14, 15, 16, 17],
      #V row 4
      [24, 25, 26, 27], [25, 26, 27, 28], [26, 27, 28, 29],
      #V row 5
      [30, 31, 32, 33], [31, 32, 33, 34], [32, 33, 34, 35],
      #V row 6
      [36, 37, 38, 39], [37, 38, 39, 40], [38, 39, 40, 41],
      #H row 1
      [0, 6, 12, 18], [6, 12, 18, 24], [12, 18, 24, 30], [18, 24, 30, 36],
      #H row 2
      [1, 7, 13, 19], [7, 13, 19, 25], [13, 19, 25, 31], [19, 25, 31, 37],
      #H row 3
      [2, 8, 14, 20], [8, 14, 20, 26], [14, 20, 26, 32], [20, 26, 32, 38],
      #H row 4
      [3, 9, 15, 21], [9, 15, 21, 27], [15, 21, 27, 33], [21, 27, 33, 39],
      #H row 5
      [4, 10, 16, 22], [10, 16, 22, 28], [16, 22, 28, 34], [22, 28, 34, 40],
      #H row 6
      [5, 11, 17, 23], [11, 17, 23, 29], [17, 23, 29, 35], [23, 29, 35, 41],
      #NW-SE
      [2, 9, 16, 23], [1, 8, 15, 22], [8, 15, 22, 29], [0, 7, 14, 21], [7, 14, 21, 28], [14, 21, 28, 35],
      [6, 13, 20, 27], [13, 20, 27, 34], [20, 27, 34, 41], [12, 19, 26, 33], [19, 26, 33, 40], [18, 25, 32, 39],
      #NE-SW
      [3, 8, 13, 18], [4, 9, 14, 19], [9, 14, 19, 24], [5, 10, 15, 20], [10, 15, 20, 25], [15, 20, 25, 30],
      [11, 16, 21, 26], [16, 21, 26, 31], [21, 26, 31, 36], [17, 22, 27, 32], [22, 27, 32, 37], [23, 28, 33, 38]]
end

