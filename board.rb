require_relative 'empty_square.rb'
require_relative 'piece.rb'

class Board
  WHITE_POSITIONS = {
    "K" => [[0, 3]],
    "Q" => [[0, 4]],
    "B" => [[0, 2], [0, 5]],
    "N" => [[0, 1], [0, 6]],
    "R" => [[0, 0], [0, 7]],
    "P" => [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7]]
  }

  BLACK_POSITIONS = {
    "K" => [[7, 3]],
    "Q" => [[7, 4]],
    "B" => [[7, 2], [7, 5]],
    "N" => [[7, 1], [7, 6]],
    "R" => [[7, 0], [7, 7]],
    "P" => [[6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7]]
  }

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) { EmptySquare.new } }
    set_up_pieces(:white)
    set_up_pieces(:black)
  end

  def [](position)
    row, col = position
    grid[row][col]
  end

  def []=(position, value)
    row, col = position
    self.grid[row][col] = value
  end

  def render
    lines = []
    grid.each do |row|
      lines << row.map {|square| square.to_s }
    end
    lines
  end

  def checkmate?(color)

  end

  def check?(color)

  end

  def in_bounds?(position)
    position.all? { |coord| coord.between?(0, grid.length-1) }
  end

  def set_up_pieces(color)
    pieces_positions = color == :white ? WHITE_POSITIONS : BLACK_POSITIONS
    pieces_positions.each do |type, positions|
      positions.each do |position|
        case type
        when "K"
          self[position] = King.new(position, color, self)
        when "Q"
          self[position] = Queen.new(position, color, self)
        when "B"
          self[position] = Bishop.new(position, color, self)
        when "N"
          self[position] = Knight.new(position, color, self)
        when "R"
          self[position] = Rook.new(position, color, self)
        when "P"
          self[position] = Pawn.new(position, color, self)
        end
      end
    end
  end

  def piece_at(position)
    self[position]
  end

  def occupied?(position)
    piece_at(position).piece?
  end

  def move_piece(position, new_position)
    current_piece = piece_at(position)
    self[position] = EmptySquare.new
    self[new_position] = current_piece
  end

end

board = Board.new
board.render
