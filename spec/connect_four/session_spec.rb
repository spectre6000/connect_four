require 'connect_four'

describe Session do
	session = Session.new
	player1 = Player.new("Bob", "X")
	player2 = Player.new("Joe", "O")
	interface = Interface.new(session)
	game = Game.new(player1, player2, interface)
	board = Board.new(game)

	describe "#new" do
		xit "creates an instance of Session" do
			expect(session).to be_an_instance_of(Session)
		end
	end

	describe "#setup" do
		xit "creates player1" do
			expect(session.player1).to be_an_instance_of(Player)
		end

		xit "creates player2" do
			expect(session.player2).to be_an_instance_of(Player)
		end

		xit "gets a high score" do
			allow(interface).to receive(:get_high_score).and_return(3)
			expect(session.high_score).to eql(2)
		end
	end

	describe "#play" do

		xit "creates a game if neither player has won" do
			allow(player1).to receive(:score).and_return(0)
			allow(interface).to receive(:get_high_score).and_return(3)
			expect(session.games.length).to eql(1)
		end

		xit "does not create a game if either player has won" do
			allow(player1).to receive(:score).and_return(2)
			allow(interface).to receive(:get_high_score).and_return(3)
			expect(session.games.length).to eql(0)
		end
	end
end

