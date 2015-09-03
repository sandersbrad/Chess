class Knight < Piece
  L_VECTORS = [[2,1],
               [-2,1],
               [2,-1],
               [-2,-1],
               [1,2],
               [1,-2],
               [-1,2],
               [-1,-2]]

  include SteppingPiece

   def initialize(position, color, board)
     @vectors = L_VECTORS
     @value = 3
     super(position, color, board)
   end

   def symbol
    color == :black ? "\u265E" : "\u2658"
   end

end
