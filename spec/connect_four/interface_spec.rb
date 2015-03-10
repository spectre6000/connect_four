require 'connect_four'

describe Interface do
  let (:fake_stdout) {double("$STDOUT")}
  let (:player1) {instance_double("Player", :name => "Bob")}
  let (:session) {instance_double("Session")}
  let (:board) {instance_double("Board")}
  let (:interface) { Interface.new(session, fake_stdout) }


  describe "#new" do
    it "creates an instance of Interface" do
      expect(interface).to be_an_instance_of(Interface)
    end
  end

  describe "#get_player_name" do
    it "prompts players to enter their names" do
      expect(fake_stdout).to receive(:puts).with("Player X name:")
      interface.get_player_name("X")
    end
  end

  describe "#get_coin_call" do
    it "prompts players to answer HEADS or TAILS" do
      expect(fake_stdout).to receive(:puts).with("\nBob, heads or tails?")
      interface.get_coin_call(player1)
    end
  end

  describe "#get_high score" do
    it "prompts players to enter the number of rounds" do
      expect(fake_stdout).to receive(:puts).with("Best out of how many?")
      interface.get_high_score
    end
  end

  describe "#move" do
    it "prompts player for where to place a piece" do
      expect(fake_stdout).to receive(:puts).with("Bob, where would you like to place your piece?\n")
      interface.move(player1.name)
    end
  end

  describe "#print_board" do
    xit "displays the game board" do
      allow(board).to receive(:spaces).and_return(" ")
      expect(fake_stdout).to receive(:puts).with("| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n")
      interface.print_board(board)
    end
  end

  describe "#winner" do
    it "displays the winner" do
      allow(player1).to receive(:score)
      expect(fake_stdout).to receive(:puts).with("Bob wins!")
      interface.winner(player1)
    end
  end

end

