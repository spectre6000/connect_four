require 'connect_four'

describe Player do
	subject {Player.new("Bob", "X")}

	describe "#new" do
		xit "creates an instance of Player" do
			expect(subject).to be_an_instance_of(Player)
		end

		xit "properly sets the name attribute" do
			expect(subject.name).to eql("Bob")
		end

		xit "properly sets the mark attribute" do
			expect(subject.mark).to eql("X")
		end

		xit "properly sets the score attribute" do
			expect(subject.score).to eql(0)
		end
	end
end

