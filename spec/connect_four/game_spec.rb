require 'connect_four'

describe Game do
  let (:fake_interface) { instance_double("Interface") }
  let (:fake_player1) { instance_double("Player") }
  let (:fake_player2) { instance_double("Player") }
  let (:fake_board) { instance_double("Board") }
  let (:game) {Game.new(fake_player1, fake_player2, fake_interface)}

  before do
    srand(1)
    allow(fake_interface).to receive(:get_coin_call).and_return("HEADS")
    allow(Board).to receive(:new).and_return(fake_board)
    allow(fake_board).to receive(:win).and_return(true)
    allow(fake_player1).to receive(:score)
    allow(fake_player1.score).to receive(:+).with(1)
    allow(fake_player2).to receive(:score)
    allow(fake_player2.score).to receive(:+).with(1)
    allow(fake_interface).to receive(:winner).with(fake_player1)
    allow(fake_interface).to receive(:winner).with(fake_player2)
  end

  describe "#new" do
    it "creates an instance of Game" do
      expect(game).to be_an_instance_of(Game)
    end
    it "selects a player to go first" do
      expect([fake_player1, fake_player2]).to include(game.turn)
    end
    it "gets correct player from matching coin toss" do
#      srand(1) # player2 calls; coin flips to HEADS
 #     allow(fake_interface).to receive(:get_coin_call).with(fake_player2).and_return("HEADS")
      expect(game.turn).to eql(fake_player1)
    end
    # it "gets correct player from missed coin toss" do
    #   srand(1) # player1 calls; coin flips to HEADS
    #   print "here #{fake_player2}"
    #   allow(fake_interface).to receive(:get_coin_call).with(fake_player2).and_return("TAILS")
    #   expect(game.turn).to eql(fake_player1)
    # end
  end
  # describe "#play" do
  #   it "takes turns" do
  #     game.turn = fake_player1
  #     game.change_player
  #     expect(game.turn).to eql(fake_player2)
  #   end
  # end
end

