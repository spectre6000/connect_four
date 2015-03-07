class Player

  attr_accessor :name, :mark, :score

  def initialize(name, mark, score = 0)
    @name = name
    @mark = mark
    @score = score
  end

end

