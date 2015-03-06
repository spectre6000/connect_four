require 'connect_four'

describe Game do
	session = Session.new
	player1 = Player.new("Bob", "X")
	player2 = Player.new("Joe", "O")
	interface = Interface.new(session)
	game = Game.new(player1, player2, interface)
	board = Board.new(game)

	describe "#new" do
		xit "creates an instance of Game" do
			expect(game).to be_an_instance_of(Game)
		end
		xit "selects a player to go first" do
			allow_any_instance_of(Interface).to receive(:get_coin_call).and_return("HEADS")
			expect(game.turn).to be_an_instance_of(Player)
		end
		# xit "gets correct player from matching coin toss" do
		# 	srand(1) # player2 calls; coin flips to TAILS
		# 	allow_any_instance_of(Interface).to receive(:get_coin_call).and_return("TAILS")
		# 	# expect([player1, player2]).to include(subject.turn)
		# 	expect(game.turn).to eql(player2)
		# end
		# xit "gets correct player from missed coin toss" do
		# 	srand(1) # player2 calls; coin flips to TAILS
		# 	allow_any_instance_of(Interface).to receive(:get_coin_call).and_return("HEADS")
		# 	expect(game.turn).to eql(player1)
		# end

		describe "#play" do
			xit "correctly places a piece in the first column" do
				allow_any_instance_of(Interface).to receive(:move).and_return(1)
				board.move(1,"X")
				expect(["X"]).to include(board.spaces[0][1])
			end
			xit "correctly places a piece in the second column" do
				allow_any_instance_of(Interface).to receive(:move).and_return(1)
				board.move(2,"O")
				expect(["O"]).to include(board.spaces[6][1])
			end
			xit "correctly places a second piece in the first column" do
				allow_any_instance_of(Interface).to receive(:move).and_return(1)
				board.move(1,"O")
				expect(["O"]).to include(board.spaces[1][1])
			end
			xit "takes turns" do
				game.turn = player1
				game.change_player
				expect(game.turn).to eql(player2)
			end
		end
	end
end

