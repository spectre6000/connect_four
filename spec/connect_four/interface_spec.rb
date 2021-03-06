require 'connect_four'

describe Interface do
  let (:fake_stdout) {double("$STDOUT", :puts => true)}
  let (:player1) {instance_double(Player, :name => "Bob")}
  let (:session) {instance_double(Session)}
  let (:board) {instance_double(Board)}#, :spaces => [[1," "],[1," "],[1," "],[1," "],[1," "],[1," "],[2," "],[2," "],[2," "],[2," "],[2," "],[2," "],[3," "],[3," "],[3," "],[3," "],[3," "],[3," "],[4," "],[4," "],[4," "],[4," "],[4," "],[4," "],[5," "],[5," "],[5," "],[5," "],[5," "],[5," "],[6," "],[6," "],[6," "],[6," "],[6," "],[6," "],[7," "],[7," "],[7," "],[7," "],[7," "],[7," "]])}
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

  describe "#get_high score." do
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
    it "displays the game board" do
      allow(board).to receive(:spaces).and_return([[1," "],[1," "],[1," "],[1," "],[1," "],[1," "],[2," "],[2," "],[2," "],[2," "],[2," "],[2," "],[3," "],[3," "],[3," "],[3," "],[3," "],[3," "],[4," "],[4," "],[4," "],[4," "],[4," "],[4," "],[5," "],[5," "],[5," "],[5," "],[5," "],[5," "],[6," "],[6," "],[6," "],[6," "],[6," "],[6," "],[7," "],[7," "],[7," "],[7," "],[7," "],[7," "]])
      expect(fake_stdout).to receive(:print).with("| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n| | | | | | | |\n")
      interface.print_board(board)
    end
  end

  describe "#winner" do
    it "displays the winner" do
      allow(session).to receive(:play)
      expect(fake_stdout).to receive(:puts).with("Bob wins!")
      interface.winner(player1)
    end
  end

end

