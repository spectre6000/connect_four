require 'connect_four'

describe Board do
  let(:board) { Board.new }
  let(:player1) { instance_double(Player, :mark => "X") }
  let(:player2) { instance_double(Player, :mark => "O") }

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

