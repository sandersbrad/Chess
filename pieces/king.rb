class King < Piece
  include SteppingPiece

  def initialize(position, color, board)
    @vectors = HV_VECTORS + DIAG_VECTORS
    super(position, color, board)
  end

  def symbol
    color == :black ? "\u265B" : "\u2655"
  end

end
