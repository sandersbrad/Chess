class Bishop < Piece
  include SteppingPiece

  def initialize(position, color, board)
    @vectors = DIAG_VECTORS
    @value = 3
    super(position, color, board)
  end
  
  def symbol
    color == :black ? "\u265D" : "\u2657"
  end

end
