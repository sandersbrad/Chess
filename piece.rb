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

  def move_to(new_position)
    board.move_piece(position, new_position)
    @position = new_position
  end


end

class SlidingPiece < Piece


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

end
