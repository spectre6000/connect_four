require 'connect_four'

describe Session do
	let (:interface) {double("Interface")}
	let (:player1) {double("Player")}
	session = Session.new
	# player1 = Player.new("Bob", "X")
	# player2 = Player.new("Joe", "O")
	# interface = Interface.new(session, fake_stdout)
	# game = Game.new(player1, player2, interface)
	# board = Board.new(game)

	describe "#new" do
		it "creates an instance of Session" do
			expect(session).to be_an_instance_of(Session)
		end
	end

	describe "#setup" do
		it "creates player1" do
			expect(session.player1).to be_an_instance_of(Player)
		end

		it "creates player2" do
			expect(session.player2).to be_an_instance_of(Player)
		end

		xit "gets a high score" do
			allow(:interface).to receive(:get_high_score).and_return(3)
			expect(session.high_score).to eql(2)
		end
	end

	describe "#play" do

		it "creates a game if neither player has won" do
			allow(session.player1).to receive(:score).and_return(0)
			allow(interface).to receive(:get_high_score).and_return(3)
			expect(session.games.length).to eql(1)
		end

		it "does not create a game if either player has won" do
			allow(player1).to receive(:score).and_return(2)
			allow(interface).to receive(:get_high_score).and_return(3)
			expect(session.games.length).to eql(0)
		end
	end
end

