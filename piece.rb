require_relative 'board.rb'

class Piece
  attr_reader :color, :board, :position
  attr_accessor :captured, :moved

  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
    @captured, @moved = false, false
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

  def possible_move?(position)

  end

  def possible_moves(moves_in_range) #rewrite to not accept an argument
    in_bound_moves = moves_in_range.select do |move|
      board.in_bounds?(move)
    end

  end


end

class SlidingPiece < Piece


end

class SteppingPiece

end

class King < Piece

  def to_s
    color == :black ? "\u265A" : "\u2654"
  end

end

class Queen < Piece

  def to_s
    color == :black ? "\u265B" : "\u2655"
  end

end

class Rook < Piece

  def to_s
    color == :black ? "\u265C" : "\u2656"
  end

end

class Bishop < Piece

  def to_s
    color == :black ? "\u265D" : "\u2657"
  end

end

class Knight < Piece

  def to_s
    color == :black ? "\u265E" : "\u2658"
  end

end

class Pawn < Piece

  def to_s
    color == :black ? "\u265F" : "\u2659"
  end

  def potential_moves

  end

end
