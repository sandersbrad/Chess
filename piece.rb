require_relative 'board.rb'

class Piece
  HV_VECTORS = [[0, 1],
             [1, 0],
             [0, -1],
             [-1, 0]]
  DIAG_VECTORS = [[1, 1],
                 [-1, 1],
                 [1, -1],
                 [-1, -1]]

  # VECTORS = DIAG_VECTORS

  attr_reader :color, :board
  attr_accessor :captured, :moved, :position, :vectors

  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
    @captured, @moved = false, false
  end

  def self_blocking?(move)
    this_piece = board.piece_at(move)
    return false unless this_piece.piece?
    color == this_piece.color
  end

  def to_s
    "Class: #{self.class}, Position: #{position}, Color: #{color}"
  end

  def empty?
    false
  end

  def piece?
    true
  end

  def dup(duped_board)
    self.class.new(position, color, duped_board)
  end

  def update_position(new_position)
    self.position = new_position
    self.moved = true
  end

  def possible_moves
    moves_in_range.select do |move|
      debugger if move.is_a?(Fixnum)
      board.in_bounds?(move) && !self_blocking?(move)
    end
  end

  def moves_in_range
    moves = []

    self.vectors.each do |vector|
      moves += moves_from_vector(vector)
    end

    moves
  end

  def step(vector)
    x, y = position
    dx, dy = vector
    [x + dx, y + dy]
  end

end

class SlidingPiece < Piece

  def moves_from_vector(vector)
    debugger if self.is_a?(Queen)
    vector_moves = []

    i = 1
    loop do
      vector = vector.map {|x| x*i }
      move = step(vector)
      i += 1
      break if !board.in_bounds?(move)
      vector_moves << move
      break if board.piece_at(move).piece?
    end

    vector_moves
  end

end

class SteppingPiece < Piece

  def moves_from_vector(vector)
    [step(vector)]
  end

end

class King < SteppingPiece

  def initialize(position, color, board)
    @vectors = HV_VECTORS + DIAG_VECTORS
    super(position, color, board)
  end

  def symbol
    color == :black ? "\u265A" : "\u2654"
  end

end

class Queen < SlidingPiece

  def initialize(position, color, board)
    @vectors = HV_VECTORS + DIAG_VECTORS
    super(position, color, board)
  end

  def symbol
    color == :black ? "\u265B" : "\u2655"
  end

end

class Rook < SlidingPiece

  def initialize(position, color, board)
    @vectors = HV_VECTORS
    super(position, color, board)
  end

  def symbol
    color == :black ? "\u265C" : "\u2656"
  end

end

class Bishop < SlidingPiece

  def initialize(position, color, board)
    @vectors = DIAG_VECTORS
    super(position, color, board)
  end
  def symbol
    color == :black ? "\u265D" : "\u2657"
  end

end

class Knight < SteppingPiece
  L_VECTORS = [[2,1],
               [-2,1],
               [2,-1],
               [-2,-1],
               [1,2],
               [1,-2],
               [-1,2],
               [-1,-2]]

   def initialize(position, color, board)
     @vectors = L_VECTORS
     super(position, color, board)
   end

   def symbol
    color == :black ? "\u265E" : "\u2658"
  end

end

class Pawn < SteppingPiece
  def initialize(position, color, board)
    @vectors = HV_VECTORS + DIAG_VECTORS
    super(position, color, board)
  end

  def symbol
    color == :black ? "\u265F" : "\u2659"
  end

end
