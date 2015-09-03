class Rook < Piece
  include SlidingPiece

  def initialize(position, color, board)
    @vectors = HV_VECTORS
    @value = 5
    super(position, color, board)
  end

  def symbol
    color == :black ? "\u265C" : "\u2656"
  end

end
