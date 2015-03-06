require 'connect_four'

describe Player do
	subject {Player.new("Bob", "X")}

	describe "#new" do
		it "creates an instance of Player" do
			expect(subject).to be_an_instance_of(Player)
		end

		it "properly sets the name attribute" do
			expect(subject.name).to eql("Bob")
		end

		it "properly sets the mark attribute" do
			expect(subject.mark).to eql("X")
		end

		it "properly sets the score attribute" do
			expect(subject.score).to eql(0)
		end
	end
end

