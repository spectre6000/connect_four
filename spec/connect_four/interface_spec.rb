describe Interface do
	let (:fake_stdout)  {double("stdout")}
	allow(fake_stdout).to receive(:puts)
	let (:session) {double("Session")}
	player1 = Player.new("Bob", "X")
	# player2 = Player.new("Joe", "O")
	let (:interface) { Interface.new(session, fake_stdout) }
	# game = Game.new(player1, player2, interface)
	# board = Board.new(game)


	describe "#new" do
		it "creates an instance of Interface" do
			expect(interface).to be_an_instance_of(Interface)
		end
	end

	describe "#get_player_name" do
		it "prompts players to enter their names" do
			expect(fake_stdout).to have_received(:puts).with("Player X name:\n")
			interface.get_player_name("X")
		end
	end

	# describe "#get_coin_call" do
	# 	it "prompts players to answer HEADS or TAILS" do
	# 		expect{interface.get_coin_call(player1)}.to output("\nBob, heads or tails?\n").to_stdout
	# 	end
	# end

	# describe "#get_high score" do
	# 	it "prompts players to enter the number of rounds" do
	# 		expect{interface.get_high_score}.to output("Best out of how many?\n").to_stdout
	# 	end
	# end

	# describe "#move" do
	# 	it "prompts player for where to place a piece" do
	# 		expect{interface.move(player1.name)}.to output("Bob, where would you like to place your piece?\n").to_stdout
	# 	end
	# end

	# describe "#print_board" do
	# 	it "displays the game board" do
	# 		# player2 = Player.new("Joe", "O")
	# 		game = Game.new(player1, player2, interface)
	# 		board = Board.new(game)
	# 		expect{interface.print_board(board)}.to output("| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n").to_stdout
	# 	end
	# end

	# describe "#winner" do
	# 	it "displays the winner" do
	# 		expect{interface.winner(player1)}.to output("Bob wins!\n").to_stdout
	# 	end
	# end

end

