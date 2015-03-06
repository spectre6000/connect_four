require 'connect_four'

describe Board do
	session = Session.new
	player1 = Player.new("Bob", "X")
	player2 = Player.new("Joe", "O")
	interface = Interface.new(session)
	game = Game.new(player1, player2, interface)
	subject {Board.new(game)}

	describe "#new" do
		it "creates an instance of Board" do
			expect(subject).to be_an_instance_of(Board)
		end
		xit "creates a grid of 42 spaces" do
			expect(subject.spaces.length).to eql(42)
		end
	end
	describe "#win?" do
		xit "throws true for vertical win" do
			subject.move(1,"X")
			subject.move(1,"X")
			subject.move(1,"X")
			subject.move(1,"X")
			expect(subject.win?).to eql(true)
		end
		xit "throws true for horizontal win" do
			subject.move(1,"X")
			subject.move(2,"X")
			subject.move(3,"X")
			subject.move(4,"X")
			expect(subject.win?).to eql(true)
		end
		xit "throws true for diagonal win" do
			subject.move(1,"X")
			subject.move(1,"O")
			subject.move(1,"X")
			subject.move(1,"O")
			subject.move(1,"O")
			subject.move(1,"X")
			subject.move(1,"O")
			subject.move(1,"O")
			subject.move(1,"O")
			subject.move(1,"X")
			expect(subject.win?).to eql(true)
		end
	end
end

