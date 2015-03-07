class Session

	attr_accessor :player1, :player2, :high_score, :games

	def initialize
		#establishes the various objects required to play, scoring system, and then the games themselves
		@interface = Interface.new(self)
		@player1
		@player2
		@high_score = 1
		@games = []
		setup
		play
	end

	def play
		#Checks to see if either player has won the overall set of games
		if @player1.score < @high_score && @player2.score < @high_score
			@games << Game.new(@player1, @player2, @interface)
		end
	end

private

	def setup
		#establishes player names, marks, and initializes objects
		get_players
		#Sets "best x out of y" terms for the game set
		high_score_i
	end

 	def get_players
	 	#actual initialization of players
	 	@player1 = Player.new(@interface.get_player_name("X"), "X")
	 	@player2 = Player.new(@interface.get_player_name("O"), "O")
 	end

 	def high_score_i
	 	#sets high score, rounds to appropriate minimum to score a winning set
	 	@high_score = (@interface.get_high_score / 2.0).ceil
 	end

end

