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

  VECTORS = []

  attr_reader :color, :board
  attr_accessor :captured, :moved, :position

  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
    @captured, @moved = false, false
  end

  def self_blocking?(move)
    color == board.piece_at(move).color
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
      board.in_bounds?(move) && !self_blocking?(move)
    end
  end

  def moves_in_range
    moves = []

    VECTORS.each do |vector|
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
    vector_moves = []

    i = 1
    loop do
      vector = vector.map {|x| x*2 }
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
    step(vector)
  end

end

class King < SteppingPiece
  VECTORS = HV_VECTORS + DIAG_VECTORS

  def symbol
    color == :black ? "\u265A" : "\u2654"
  end

end

class Queen < SlidingPiece
  VECTORS = HV_VECTORS + DIAG_VECTORS

  def symbol
    color == :black ? "\u265B" : "\u2655"
  end

end

class Rook < SlidingPiece
  VECTORS = HV_VECTORS
  def symbol
    color == :black ? "\u265C" : "\u2656"
  end

end

class Bishop < SlidingPiece
  VECTORS = DIAG_VECTORS
  def symbol
    color == :black ? "\u265D" : "\u2657"
  end

end

class Knight < SteppingPiece
  VECTORS = [[2,1],
               [-2,1],
               [2,-1],
               [-2,-1],
               [1,2],
               [1,-2],
               [-1,2],
               [-1,-2]]

  def symbol
    color == :black ? "\u265E" : "\u2658"
  end

end

class Pawn < SteppingPiece
  VECTORS = HV_VECTORS + DIAG_VECTORS
  def symbol
    color == :black ? "\u265F" : "\u2659"
  end

  def potential_moves

  end

end
