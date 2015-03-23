require 'connect_four'

describe Session do
  let (:fake_stdout) {double("$STDOUT", :puts => true)}
  let (:interface) {instance_double("Interface", :out => "fake_stdout")}
  let (:session) { Session.new }

  describe "#new" do
    it "creates an instance of Session" do
      allow(Interface).to receive(:new).with(session, fake_stdout).and_return(:interface)
      expect(session).to be_an_instance_of(Session)
    end
  end

  # describe "#setup" do
  #   it "creates player1" do
  #     expect(session.player1).to be_an_instance_of(Player)
  #   end

  #   it "creates player2" do
  #     expect(session.player2).to be_an_instance_of(Player)
  #   end

  #   it "gets a high score" do
  #     allow(interface).to receive(:get_high_score).and_return(3)
  #     expect(session.high_score).to eql(2)
  #   end
  # end

  # describe "#play" do

  #   it "creates a game if neither player has won" do
  #     allow(session.player1).to receive(:score).and_return(0)
  #     allow(interface).to receive(:get_high_score).and_return(3)
  #     expect(session.games.length).to eql(1)
  #   end

  #   it "does not create a game if either player has won" do
  #     allow(session.player1).to receive(:score).and_return(2)
  #     allow(interface).to receive(:get_high_score).and_return(3)
  #     expect(session.games.length).to eql(0)
  #   end
  # end
end

