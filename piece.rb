class Piece
  attr_accessor :captured

  def initialize(position, color)
    @position = position
    @captured = false
    @color = color
  end

  def empty?
    false
  end

  def piece?
    true
  end

end
