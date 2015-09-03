class Queen < Piece
  include SlidingPiece

  def initialize(position, color, board)
    @vectors = HV_VECTORS + DIAG_VECTORS
    @value = 9
    super(position, color, board)
  end

  def symbol
    color == :black ? "\u265A" : "\u2654"
  end

end
