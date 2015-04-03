require 'connect_four'

describe Session do
  let (:fake_interface) { instance_double("Interface") }
  let (:fake_player) { instance_double("Player") }
  let (:fake_game) { instance_double("Game") }
  let (:session) { Session.new }

  before do
    allow(Interface).to receive(:new).and_return(fake_interface)
    allow(fake_interface).to receive(:get_player_name).with("X")
    allow(Player).to receive(:new).and_return(fake_player)
    allow(fake_interface).to receive(:get_player_name).with("O")
    allow(Player).to receive(:new).and_return(fake_player)
    allow(fake_interface).to receive(:get_high_score).and_return(3)
    allow(fake_player).to receive(:score).and_return(2)
    allow(fake_player).to receive(:score).and_return(2)
  end

  describe "#new" do
    it "creates an instance of Session" do
      expect(session).to be_an_instance_of(Session)
    end
  end

  describe "#setup" do
    it "creates player1" do
      expect(session.player1).to eql(fake_player)
    end

    it "creates player2" do
      expect(session.player1).to eql(fake_player)
    end

    it "gets a high score" do
      expect(session.high_score).to eq(2)
    end
  end

  describe "#play" do

    it "creates a game if neither player has won" do
      allow(session.player1).to receive(:score).and_return(0)
      allow(fake_interface).to receive(:get_high_score).and_return(3)
      allow(Game).to receive(:new).and_return(fake_game)
      session.play
      expect(session.games.length).to eql(1)
    end

    it "does not create a game if either player has won" do
      allow(session.player1).to receive(:score).and_return(3)
      allow(fake_interface).to receive(:get_high_score).and_return(3)
      allow(Game).to receive(:new).and_return(fake_game)
      session.play
      expect(session.games.length).to eql(0)
    end
  end
end

