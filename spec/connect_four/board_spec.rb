require 'connect_four'

describe Board do
	let(:player1) {double("Player", :mark => "X")}
	let(:player2) {double("Player", :mark => "O")}
	let(:game) {double("Game", :player1 => "player1", :player2 => "player2")}
	let(:board) {Board.new(game)}
	# session = Session.new
	# player1 = Player.new("Bob", "X")
	# player2 = Player.new("Joe", "O")
	# interface = Interface.new(session)
	# game = Game.new(player1, player2, interface)
	# subject {Board.new(game)}

	describe "#new" do
		it "creates an instance of Board" do
			expect(board).to be_an_instance_of(Board)
		end
		it "creates a grid of 42 spaces" do
			expect(board.spaces.length).to eql(42)
		end
	end
	describe "#win?" do
		it "throws false for no win" do
			board.move(1, player1)
			board.move(1, player2)
			board.move(1, player1)
			board.move(1, player2)
			board.win?
			expect(board.win).to eql(false)
		end
		it "throws true for vertical win" do
			board.move(1, player1)
			board.move(1, player1)
			board.move(1, player1)
			board.move(1, player1)
			board.win?
			expect(board.win).to eql(true)
		end
		it "throws true for horizontal win" do
			board.move(1, player1)
			board.move(2, player1)
			board.move(3, player1)
			board.move(4, player1)
			board.win?
			expect(board.win).to eql(true)
		end
		it "throws true for diagonal win" do
			board.move(1, player1)
			board.move(2, player2)
			board.move(2, player1)
			board.move(3, player2)
			board.move(3, player2)
			board.move(3, player1)
			board.move(4, player2)
			board.move(4, player2)
			board.move(4, player2)
			board.move(4, player1)
			board.win?
			expect(board.win).to eql(true)
		end
	end
end

