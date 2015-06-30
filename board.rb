require_relative 'empty_square.rb'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) { EmptySquare.new } }
  end

  def render
    lines = []
    grid.each do |row|
      lines << row.map {|square| square.to_s }
    end
    lines
  end

  def out_of_bounds?(position)
    position.all? { |coord| coord.between?(0, grid.length-1) }
  end

end

board = Board.new
board.render
